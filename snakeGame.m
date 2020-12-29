  function snakeGame

    diff=8;    %����,�i�]�m1~10(�e����s���W�v�^
    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    L=20;
    axis equal    %�]�m��٧��жb
    axis(0.5+[0 L 0 L])   %��?�ɭ��j�p   %�d��20 
    %gca:get current axis�i�^�ǨϥΤ����϶b
    set(gca,'xtick',[],'ytick',[])
    hold on


    % a=(randi([1 20],1); b=(randi([1 20],1);
    head=[10,10];  %�]�w�D�Y��l����
    direct=[1,0];   %�D�Y�¦V
    body=[10,10;9,10;8,10;7,10];    %�D����m����
    long=4;   %�D������
    food = randi(L,[1 2]);    %�H�����ͭ�����m   
    %scatter�O�ΥΨӵe���I�Ϫ����
    %�e�X�����M�D
    drawFood=scatter(food(1),food(2),150,'r');
    drawSnake=scatter(gca, body(:,  1), body(:, 2), 250, 'bs');



    set(gcf,'KeyPressFcn',@key);  %�O����L����

    game = timer('ExecutionMode', 'FixedRate', 'Period',1/diff, 'TimerFcn', @snakeGame);       %?�m�w?����??
    start(game)                               %?�l��?
    
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
                selection=questdlg('�C���Ȱ�','���i','�h�X�C��','�~��C��','�h�X�C��');
                if selection=='�~��C��'
                    start(game);
                elseif selection=='�h�X�C��'
                    close;
                end
        end
    end
    
    function snakeGame(~,~)
      head=head+direct;    %�D�Y���e���ʤ@�B
      body=[head;body];    %�s�W�Y����
      if length(body)>long
          body(end, : )=[];   %��D���̫�@�I�h��
      end
      
     if (sum(body(:, 1) ==body(1, 1)   & body(:, 2) == body(1, 2) )>1) 
              msgbox('�C������')
              close;
     end
      
     if (head(1, 1)>20)||(head(1, 1)<1)||(head(1, 2)>20)||(head(1, 2)<1)
              msgbox('�C������');
              close;
     end
      

      if head(1,1)==food(1) && head(1,2)==food(2)
          long=long+1;
          food = randi(L,[1 2]);  
      end
         
      set(drawFood, 'XData', food(1),  'YData', food(2));             %��?����s?��
      set(drawSnake, 'XData', body( : , 1), 'YData', body( : , 2));
    end
end