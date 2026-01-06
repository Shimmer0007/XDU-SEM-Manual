# Part III 列表
# 分别对两个列表提取年龄在 30 岁以上的员工的信息。 
Name = c(" 张三"," 李四"," 王五"," 赵六")
Gender = c(" 男"," 女"," 男"," 男")
Age = c(31,25,35,46)
Interest = list(" 篮球", c(" 游泳"," 电影"), c(" 旅行"," 摄影"," 阅读"), NA)
info1 = list(Name = Name, Gender = Gender,
             Age = Age, Interest = Interest)
info2 = list(
  张三 = list(Sex = " 男", Age = 31, Interest = " 篮球"),
  李四 = list(Sex = " 女", Age = 25,
            Interest = c(" 游泳"," 电影")),
  王五 = list(Sex = " 男", Age = 35,
            Interest = c(" 旅行"," 摄影"," 阅读")),
  赵六 = list(Sex = " 男", Age = 46, Interest = NA))
info2
# 分别对两个列表提取年龄在 30 岁以上的员工的信息
## info1
idx <- which(info1$Age>30)
### 第一种方式
test1 <- list()
for (i in 1:length(idx)) {
  test1[[i]]=lapply(info1, "[",idx[i])
}
test1
### 第二种方式
test1 <- lapply(idx,function(x) lapply(info1, "[",x))
### 第三种方式
library(purrr)
map(idx, \(x) map(info1, x))

## info2
### 第一种方式
test2 <- list()
j=1
for (i in 1:length(info2)) {
  if(info2[[i]]["Age"]>30){
    test2[j]=info2[i]
    j=j+1
  }
}
test2
### 第二种方式
mm <- sapply(info2, function(x) x$Age>30)
info2[which(mm==TRUE)]
### 第三种方式
keep(info2, \(x) x$Age > 30)







