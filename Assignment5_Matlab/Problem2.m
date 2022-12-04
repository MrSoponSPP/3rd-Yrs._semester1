%ธนาคารรับฝาก-ถอน มีเหตุการณ์ดังนี้ (หน่วยเวลา : นาที)
%1 ลูกค้าฝากเงิน ด้วยprob 0.3 โดยใช้เวลาในการฝากด้วยการแจกแจงแบบUniform 1-4
%2 ลูกค้าถอนเงิน ด้วยprob 0.6 โดยใช้เวลาถอนด้วยการแจกแจงแบบExpo E[X]= 3
%3 เมื่อถึงคิวไม่มีลูกค้า เกิดด้วยProb 0.1 เสียเวลา 0.5 

N=100000 ; %จำนวนครั้งของการทดลอง
Prob_of_Event=randi([1,10],[1,N]); %2.1 
for i = 1:N
    if(Prob_of_Event(i)<=3)
        event(i)=1;
        Time_of_Event(i)=1+3*rand(); % Uniform Distribution RV
    elseif(Prob_of_Event(i)<=9)
        event(i)=2;
        Time_of_Event(i)=(log(rand()))*(-3); % Exponential Distribution RV
    else
        event(i)=3; 
        Time_of_Event(i)=0.5; % Probability
    end
end

%2.2 Expected Value
E= sum(Time_of_Event)/N;
