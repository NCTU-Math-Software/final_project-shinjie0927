  
  function snakeGame(N)

    diff=N;    %難度,可設置1~10(畫面刷新的頻率）
    type=1;

    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    L=20;
    axis equal    %設置對稱坐標軸
    axis(0.5+[0 L 0 L])   
    hold on


    % a=(randi([1 20],1); b=(randi([1 20],1);
    head=[10,10];  %設定蛇頭初始坐標
    direct=[1,0];   %蛇頭朝向
    body=[10,10;9,10;8,10;7,10];    %蛇身位置坐標
    long=4;   %蛇的長度
    food = randi(L,[1 2]);    %隨機產生食物位置   
    %scatter是用用來畫散點圖的函數
    %畫出食物和蛇
    drawFood=scatter(food(1),food(2),150,'r');
    drawSnake=scatter(body(:,  1), body(:, 2), 250, 'bs');



    set(gcf,'KeyPressFcn',@key);  %記錄鍵盤按鍵

    game = timer('ExecutionMode', 'FixedRate', 'Period',1/diff, 'TimerFcn', @snakeGame);       %?置定?器的??
    start(game)                               %?始游?
    
        function key(~,event)
        switch event.Key
            case 'uparrow'
                if direct~=[0,-1]
                    direct=[0,1];
                end
            case 'downarrow'
                if direct~=[0,1]
                    direct=[0,-1];
                end
            case 'leftarrow'
                if direct~=[1,0]
                    direct=[-1,0];
                end
            case 'rightarrow'
                if direct~=[-1,0]
                    direct=[1,0];
                end
            case 'space'
                stop(game);
                selection1=questdlg('遊戲暫停','公告','退出遊戲','繼續遊戲','退出遊戲');
                switch selection1
                    case'繼續遊戲'
                        start(game);
                    case'退出遊戲'
                        close;
                end

        end
    end
    
    function snakeGame(~,~)
      head=head+direct;    %蛇頭往前移動一步
      body=[head;body];    %連上頭跟身體
      if length(body)>long
          body(end, : )=[];   %把蛇的最後一截去掉
      end
      
      if type==1
          if (sum(body(:, 1) ==body(1, 1)   & body(:, 2) == body(1, 2) )>1) 
              msgbox('遊戲結束')
              close;
          end
      elseif type==2
          if (sum(body(:, 1) ==body(1, 1)   & body(:, 2) == body(1, 2) )>1) 
          end
      end
  
     if (head(1, 1)>L)||(head(1, 1)<1)||(head(1, 2)>L)||(head(1, 2)<1)  %因為一開始加了0.5，因此只要滿足前面=碰到牆壁
              msgbox('遊戲結束');
              close;
     end
      

      if head(1,1)==food(1) && head(1,2)==food(2)
          long=long+1;
          food = randi(L,[1 2]);  
      end
         
      set(drawFood, 'XData', food(1),  'YData', food(2));             %不?的刷新?面
      set(drawSnake, 'XData', body( : , 1), 'YData', body( : , 2));
    end
end