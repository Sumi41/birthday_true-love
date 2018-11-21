library(dplyr)

v=read.csv("./data.csv",header=T)

# 可視化
plot(v$month,v$like_parallel)
png("./image/plot.png")
plot(v2$month,v2$like_parallel,xlab="誕生月",ylab="心から人を好きになれない割合[%]",pch=19,main="早生まれは好きになる気持ちに影響があるのか？")
dev.off()


# 月ごとに偏りがあるかの確認
v%>%{chisq.test(.$like_parallel*1038/100,p=.$born/.$born%>%sum)}

# 1月をピークに12月にかけて減少傾向があることのモデル化
lm(like~born+month,v)%>%summary
lm(like_parallel~born+month,v)%>%summary
