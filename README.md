# 貪吃蛇遊戲

**如何開始遊戲**
1. 下載snakeGame.m檔案。
2. 用戶可在檔案第三行設置遊戲難度，1為最簡單，10為最難。
3. 在command window輸入snakeGame以執行程序。
4. 執行的同時畫面跳出代表遊戲開始，以上下左右四個按鍵控制蛇走向。

**遊戲規則**
- 用戶需要操控蛇來吃下食物，蛇每吃下一個食物，長度就會增加一格。
- 當蛇頭咬到自己或碰到牆壁則遊戲結束。
- 遊戲中，用戶可使用空格鍵來暫停遊戲。按下暫停後，用戶可選擇繼續遊戲或退出遊戲。

**遊戲中用到的概念或內建功能**
1. timer計時器讓畫面以高頻率刷新動起來
2. line7在axis中加0.5是為了方便檢測蛇頭是否碰到牆壁
3. 主要概念為當蛇往前移動一格，就把他尾巴刪掉一格以保持蛇身長度
4. 使用KeyPressFcn記錄上下左右方向鍵來控制蛇頭走向


**參考資料**
https://ch.mathworks.com/help/matlab/matlab_prog/use-a-matlab-timer-object.html
https://www.jianshu.com/p/ca34b17f7974
https://yuchungchuang.wordpress.com/2018/06/03/matlab-%E8%B2%AA%E5%90%83%E8%9B%87-snake/
