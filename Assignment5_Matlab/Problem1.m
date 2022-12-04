%โยนลูกเต๋า2ลูก ทั้งสองเป็นอิสระต่อกัน ให้X & Y
%เป็นRVsของตัวแปรสุ่มของลูกเต๋า1และ2ตามลำดับ
N=10000000; %จำนวนครั้งของการทดลอง
X=randi([1,6],[1,N]); %ให้Xแทนตัวแปรสุ่ม ค่าระหว่าง1-6 
Y=randi([1,6],[1,N]); %ให้Xแทนตัวแปรสุ่ม ค่าระหว่าง1-6 
for i=1:6
    dice1_Prob(i)=sum(X==i)/N;
    dice2_Prob(i)=sum(Y==i)/N;
end
for i=1:6 %ข้อ1.1 หา Joint PMF Pxy(x,y)
    for j=1:6
        dice_Prob(i,j)=dice1_Prob(i)*dice2_Prob(j); %Pxy(xy)=Px(x)Py(y)
    end
end

U=zeros(1,100); %ข้อ1.2 หา PMF Pu(u) ; U = X^2 +Y
for i=1:6
    for j=1:6
        k=i*i+j;
        A=U(k);
        U(k)=A+(dice_Prob(i,j));
    end
end

B=sum(X+Y>3); %หาConditional PMF Px|B(x);
for i=1:6
    dice_Condi_prob(i)=sum(X==i&X+Y>3)/B;
end

    

