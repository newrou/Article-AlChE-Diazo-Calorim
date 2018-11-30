args <- commandArgs(trailingOnly = T)
args
fname <- args[1]
td = read.table(paste0(fname, ".csv"), sep=";", head=TRUE)
###pdf(paste0(fname, ".pdf"),family="NimbusSan",encoding="KOI8-R.enc")
#t.test(td$P0,td$C0,alternative=c("two.sided"),var.equal=FALSE, conf.level=0.95) 
r_P0 <- t.test(td$P0,NULL,alternative=c("two.sided"),var.equal=FALSE, conf.level=0.95, Paired=FALSE); 
rs_P0 <- sprintf("P0 = %f +- %f [%f %f]", mean(td$P0), (r_P0$c[2]-r_P0$c[1])/2, r_P0$c[1], r_P0$c[2]); r_P0; rs_P0;

r_k <- t.test(td$k,NULL,alternative=c("two.sided"),var.equal=FALSE, conf.level=0.95, Paired=FALSE) 
rs_k <- sprintf("k = %f +- %f [%f %f]", mean(td$k), (r_k$c[2]-r_k$c[1])/2, r_k$c[1], r_k$c[2]); r_k; rs_k;

r_dH <- t.test(td$dH,NULL,alternative=c("two.sided"),var.equal=FALSE, conf.level=0.95, Paired=FALSE) 
rs_dH <- sprintf("dH = %f +- %f [%f %f]", mean(td$dH), (r_dH$c[2]-r_dH$c[1])/2, r_dH$c[1], r_dH$c[2]); r_dH; rs_dH;

r_C0 <- t.test(td$C0,NULL,alternative=c("two.sided"),var.equal=FALSE, conf.level=0.95, Paired=FALSE) 
rs_C0 <- sprintf("C0 = %f +- %f [%f %f]", mean(td$C0), (r_C0$c[2]-r_C0$c[1])/2, r_C0$c[1], r_C0$c[2]); r_C0; rs_C0;

#plot(td$P0, main=fname)
###hist(td$P0, main=rs_P0);
###hist(td$k, main=rs_k);
###hist(td$dH, main=rs_dH);
###hist(td$C0, main=rs_C0);
###dev.off()
###embedFonts(paste0(fname, ".pdf"))
#cor(td$P0~td$C0)
