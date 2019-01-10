# 檔案目的:將A電腦的packages複製到B電腦
# 方法:
#      步驟1. 將A電腦的packages的名稱先copy下來存成rds檔
#      步驟2. 把copy下來的rds檔用B電腦讀取並下載


#  步驟1. 用A電腦----
packs <- .packages(all.available = T)
saveRDS(packs,"packs.rds")

#  步驟2. 用B電腦----
# 注意檔案路徑
packs <- readRDS("packs.rds") 

# 排除已經安裝的packages
packs_want <- setdiff(packs,.packages(all.available = T))

for(pack in packs_want){
  install.packages(pack)
}
