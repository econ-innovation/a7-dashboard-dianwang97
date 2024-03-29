pub_211 <- read.csv("~/learngit/a7-dashboard-dianwang97/pub_211.csv")
library(ggplot2)
library(plotly)
library(DT)

# 一个含时间趋势的散点图
ggplot(pub_211, aes(x = pubyear, y = pubnum_wos)) +
  geom_point(size = 3) +
  geom_smooth(method = "lm", se = FALSE) +  # 添加线性拟合线，se = FALSE 表示不显示置信区间
  labs(x = "pubnum", y = "pubnum_wos") +
  theme_minimal()
# 一个交互图
plot_ly(data = pub_211, x = ~pubyear, y = ~pubnum_wos, type = "scatter", mode = "markers") %>%
  layout(title = "Pubnum_wos vs Pubyear",
         xaxis = list(title = "Pubyear"),
         yaxis = list(title = "Pubnum_wos"))
# 一个表格
datatable(pub_211, options = list(pageLength = 5))  # 设置每页显示5行数据
# 一些说明性文本
scatter_plot <- plot_ly(data = pub_211, x = ~pubyear, y = ~pubnum_wos, type = "scatter", mode = "markers") %>%
  layout(title = "Pubnum_wos vs Pubyear",
         xaxis = list(title = "Pubyear"),
         yaxis = list(title = "Pubnum_wos"))
text_labels <- list(
  x = c(2010, 2011, 2012, 2013, 2014),
  y = c(1000, 1500, 2000, 2500, 3000),
  text = c("Point 1", "Point 2", "Point 3", "Point 4", "Point 5"),
  showarrow = FALSE,
  font = list(color = "black", size = 12)
)

scatter_plot <- scatter_plot %>% add_trace(type = "scatter", mode = "text", text = text_labels)
scatter_plot
