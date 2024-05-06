library(brms)              # 加载 brms 包
library(rstan)             # 加载 rstan 包
library(ggplot2)           # 加载 ggplot2 包
library(dplyr)            # 加载 dplyr 包
library(patchwork)  # 加载 patchwork 包
library(broom.mixed)
library(hexbin)
library(reshape2)  # 用于数据重塑
library(GGally)

# 读取数据
wine_data <- read.csv("./a3/wine_review.csv")

# 重新创建映射关系，确保直接使用数字编号
wine_data$variety_factor <- factor(wine_data$variety)
variety_mapping <- setNames(1:length(levels(wine_data$variety_factor)), levels(wine_data$variety_factor))

# 使用映射关系生成品种名称，用于绘图
wine_data$variety <- as.numeric(factor(wine_data$variety, levels = names(variety_mapping)))

# 更新variety_name为实际的品种名称
wine_data$variety_name <- levels(wine_data$variety_factor)[wine_data$variety]

# 打印映射表
print(variety_mapping)

# 打印variety转换后的统计摘要
print(summary(wine_data$variety))

# 打印variety_name的统计摘要
print(summary(wine_data$variety_name))

# 打印前10条记录以检查variety_name与variety的对应关系
head(wine_data[c("variety", "variety_name", "variety_factor")], 10)


# 绘制关系图和箱形图
p1 <- ggplot(wine_data, aes(x = price, y = points)) +
    geom_point(alpha = 0.4) +
    ggtitle("Relationship between Price and Points") +
    xlab("Price") +
    ylab("Points")

p2 <- ggplot(wine_data, aes(x = variety_name, y = points)) +
    geom_boxplot() +
    theme(axis.text.x = element_text(angle = 90, hjust = 1)) +
    ggtitle("Points Distribution by Wine Variety") +
    xlab("Variety") +
    ylab("Points")

# 对品种进行重新排序，基于评分的中位数
library(ggplot2)

p2_colored <- ggplot(wine_data, aes(x = reorder(variety_name, points, median), y = points, fill = reorder(variety_name, points, median))) +
  geom_boxplot() +  # 画箱形图
  theme(axis.text.x = element_text(angle = 90, hjust = 1),  # 调整X轴文字角度
        legend.position = "none") +  # 不显示图例
  labs(title = "Points Distribution by Wine Variety",
       x = "Variety",
       y = "Points") +
  coord_flip() +  # 翻转坐标轴
  scale_fill_viridis_d()  # 使用 Viridis 颜色渐变

print(p1)
print(p2_colored)

# 输出图形
print(p2)

# 创建散点图并添加LOESS平滑线
ggplot(wine_data, aes(x = price, y = points)) +
  geom_point(alpha = 0.4, color = "blue") +  # 设置点的颜色和透明度
  geom_smooth(method = "loess", color = "red", se = FALSE) +  # 添加LOESS平滑线，不显示置信区间
  labs(title = "Relationship between Price and Points",
       x = "Price ($)",
       y = "Points") +
  theme_minimal() +  # 使用简洁主题
  theme(plot.title = element_text(hjust = 0.5))  # 标题居中

# 使用table函数创建交叉表
superior_table <- table(wine_data$variety_name, wine_data$superior_rating)

# 绘制马赛克图，设置标签水平显示
mosaicplot(superior_table, col = c("red", "green"), main = "Variety vs. Superior Rating", las = 2)



cor_matrix <- cor(wine_data[, c("points", "Crisp", "Dry", "Finish", "Firm", "Fresh", "Fruit", "Full", "Rich", "Round", "Soft", "Sweet")])
# 将相关性矩阵转化为长格式
cor_melted <- melt(cor_matrix)

# 创建热力图
ggplot(cor_melted, aes(Var1, Var2, fill = value)) +
  geom_tile() +
  scale_fill_gradient2(low = "blue", high = "red", mid = "white", midpoint = 0, limit = c(-1,1), name = "Correlation") +
  theme_minimal() +
  theme(axis.text.x = element_text(angle = 45, hjust = 1),
        axis.title.x = element_blank(),
        axis.title.y = element_blank()) +
  labs(title = "Correlation Heatmap for Wine Features and Points")

# 选择相关列进行绘图
parallel_data <- wine_data[, c("points", "Crisp", "Dry", "Finish", "Firm", "Fresh", "Fruit", "Full", "Rich", "Round", "Soft", "Sweet")]
parallel_data$points <- cut(parallel_data$points, breaks = quantile(parallel_data$points, probs = seq(0, 1, 0.25)), include.lowest = TRUE, labels = c("Low", "Medium", "High", "Very High"))

# 绘制平行坐标图
ggparcoord(parallel_data, columns = 2:12, groupColumn = 1) +
  scale_color_brewer(palette = "Set1") +
  theme_minimal() +
  labs(title = "Parallel Coordinates Plot for Wine Features and Points")




# 建立贝叶斯线性回归模型
model <- brm(points ~ price + variety + Crisp + Dry + Finish + Firm + Fresh + Fruit + Full + Rich + Round + Soft + Sweet,
             data = wine_data,
             family = gaussian(),  # 假设残差遵循正态分布
             prior = c(set_prior("normal(0, 10)", class = "b"),  # 为斜率设置正态先验
                       set_prior("normal(88, 3)", class = "Intercept")),  # 为截距设置正态先验
             chains = 4, iter = 2000, warmup = 500,
             control = list(adapt_delta = 0.95))  # 提高 adapt_delta 以增加采样稳定性

# 检查模型输出
summary(model)
plot(model)


print("Posterior Summary:")
# 查看参数的后验总结
posterior_summary(model)

print("Posterior Predictive Checks:")
# 检查是否有发散的迹步
np <- nuts_params(model)
print(np$divergent__)

print("Conditional Effects:")
print(conditional_effects(model))

print("Posterior Predictive Checks:")
samples <- as_draws_matrix(model)
pairs(samples[, 1:4])
print("Correlation Matrix:")
cor(samples[, 1:4])

# 绘制预测结果与实际值
fitted_values <- fitted(model)
# 计算每个点的ID，以便连接实际值和预测值
fitted_values[, "Estimate"] <- pmin(pmax(fitted_values[, "Estimate"], 0), 100)
actual_vs_fitted <- data.frame(Actual = wine_data$points, Fitted = fitted_values[, "Estimate"])
actual_vs_fitted$ID <- 1:nrow(actual_vs_fitted)

# 使用 ggplot 绘制实际值与预测值，并添加连接线
p4 <- ggplot(actual_vs_fitted, aes(x = ID)) +
    geom_point(aes(y = Actual, color = "Actual"), alpha = 0.6) +
    geom_point(aes(y = Fitted, color = "Fitted"), alpha = 0.6) +
    geom_segment(aes(xend = ID, y = Actual, yend = Fitted), color = "gray", alpha = 0.5) +
    scale_color_manual(values = c("Actual" = "blue", "Fitted" = "green")) +
    ggtitle("Actual vs. Fitted Points with Lines") +
    xlab("Index of Observation") +
    ylab("Points") +
    theme_minimal()

print(p4)


# 使用你的模型得到的预测值
actuals_preds <- data.frame(Actual = wine_data$points, Predicted = fitted_values[, "Estimate"])

# 计算实际值和预测值之间的相关性
correlation_accuracy <- cor(actuals_preds)
print("Correlation between actual and predicted points:")
print(correlation_accuracy)

print("Actual vs Predicted Points:")
# 展示前几行数据来检查实际值与预测值
head(actuals_preds)

print("Min-Max Accuracy:")
# 最小-最大准确率计算
# 这是一种衡量预测值与实际值比例接近性的方法
min_max_accuracy <- mean(apply(actuals_preds, 1, min) / apply(actuals_preds, 1, max))
print(min_max_accuracy)

p5 <- ggplot(actuals_preds, aes(x = Actual, y = Predicted)) +
    geom_point(alpha = 0.5) +  # 设置点的透明度为0.5
    geom_abline(intercept = 0, slope = 1, linetype = "dashed", color = "red") +
    ggtitle("Actual vs Predicted Points") +
    xlab("Actual Points") +
    ylab("Predicted Points")

print(p5)

# 使用DMwR包进行回归评估
# 使用你的模型得到的预测值
# 使用DMwR2包进行回归评估
# 计算 RMSE
rmse <- sqrt(mean((actuals_preds$Actual - actuals_preds$Predicted)^2))
print(paste("RMSE:", rmse))

# 计算 MAE
mae <- mean(abs(actuals_preds$Actual - actuals_preds$Predicted))
print(paste("MAE:", mae))


# 提取模型系数和置信区间
model_summary <- broom.mixed::tidy(model, effects = "fixed", conf.int = TRUE)

# 提取需要的参数
coef_data <- model_summary %>%
  filter(term != "(Intercept)") %>%  # 移除截距项
  mutate(Term = term,
         Estimate = estimate,
         LowerCI = conf.low,
         UpperCI = conf.high)

# 创建棒图
ggplot(coef_data, aes(x = Term, y = Estimate, fill = Estimate > 0)) +
  geom_col() +
  geom_errorbar(aes(ymin = LowerCI, ymax = UpperCI), width = 0.2) +
  coord_flip() +  # 翻转坐标轴以便阅读
  scale_fill_manual(values = c("red", "green")) +
  labs(title = "Impact of Various Factors on Wine Ratings",
       x = "Factors",
       y = "Effect Size (Coefficient Estimate)") +
  theme_minimal()


# 假设 actual_vs_fitted 已经包含两列：Actual 和 Predicted
actual_vs_fitted <- data.frame(Actual = wine_data$points, Predicted = fitted_values[, "Estimate"])

p6 <- ggplot(actual_vs_fitted, aes(x = Actual, y = Predicted)) +
  geom_hex(bins = 30) +  # 可以调整bins参数控制六边形的大小和数量
  geom_abline(intercept = 0, slope = 1, linetype = "dashed", color = "red") +
  labs(title = "Hexbin Plot of Actual vs Predicted Points",
       x = "Actual Points",
       y = "Predicted Points") +
  scale_fill_gradient(low = "blue", high = "red") +  # 渐变色填充
  theme_minimal()

print(p6)

p7 <- ggplot(actual_vs_fitted, aes(x = Actual, y = Predicted)) +
  geom_density2d_filled(contour_var = "ndensity") +  # 使用密度填充
  geom_abline(intercept = 0, slope = 1, linetype = "dashed", color = "red") +
  labs(title = "Density Plot of Actual vs Predicted Points",
       x = "Actual Points",
       y = "Predicted Points") +
  theme_minimal()

print(p7)
# print((p6 | p5 | p7))

# 将数据放入一个数据框中
metrics_data <- data.frame(
  Metric = c("Min-Max Accuracy", "RMSE", "MAE"),
  Value = c(min_max_accuracy, rmse, mae)
)

# 使用ggplot2画图
library(ggplot2)

p8 <- ggplot(metrics_data, aes(x = Metric, y = Value, fill = Metric)) +
  geom_col(show.legend = FALSE) +
  geom_text(aes(label = round(Value, 3)), vjust = -0.3) +
  labs(title = "Comparison of Prediction Accuracy Metrics",
       y = "Metric Value") +
  theme_minimal()

print(p8)

p9 <- ggplot(actual_vs_fitted, aes(x = Actual, y = Predicted)) +
  geom_point(alpha = 0.6, color = "blue") +  # 设置透明度和颜色
  geom_abline(intercept = 0, slope = 1, linetype = "dashed", color = "red") +  # 添加y=x参考线
  labs(title = "Scatter Plot of Actual vs Predicted Points",
       x = "Actual Points",
       y = "Predicted Points") +
  theme_minimal()  # 使用简洁主题

print(p9)