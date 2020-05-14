function Beta = SENFun(A)

Row = length(A)*(length(A) - 1)/2;

Q = [];

for ii = 1:length(A)-1
    
    Xi = A(ii);
    
    for jj = (ii+1):length(A)
        
        Xj = A(jj);
        
        Q_Temp((jj-ii),1) = (Xj - Xi)./(jj - ii);
        
    end
    
    Q = [Q;Q_Temp];%�������Q_Temp,������������
    
    clear Q_Temp 
    
end

if Row == size(Q,1)
    
    Beta = median(Q); %MATLAB��������λ��
    
else
    
    disp('���ִ���');
    
end
end