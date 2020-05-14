function Beta = SENFun(A)

Row = length(A)*(length(A) - 1)/2;

Q = [];

for ii = 1:length(A)-1
    
    Xi = A(ii);
    
    for jj = (ii+1):length(A)
        
        Xj = A(jj);
        
        Q_Temp((jj-ii),1) = (Xj - Xi)./(jj - ii);
        
    end
    
    Q = [Q;Q_Temp];%必须清除Q_Temp,否则行数不对
    
    clear Q_Temp 
    
end

if Row == size(Q,1)
    
    Beta = median(Q); %MATLAB按列求中位数
    
else
    
    disp('出现错误');
    
end
end