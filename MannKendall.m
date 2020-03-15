function [UF,UB]=MannKendall(timeseries)
N=length(timeseries);
UF=SMK(timeseries,N);
for i=1:N
    YY(i)=timeseries(N+1-i);
end
u_res=SMK(YY,N);
for i=1:N
    UB(i)=-u_res(N+1-i);
end

function u_res=SMK(Y,N)
m_res=zeros(N,1);md_res=zeros(N,1);u_res=zeros(N,1);
m_res(1)=0;
for i=2:N
    m_res(i)=0;
    md_res(i)=0;
    for j=1:i-1
        if Y(i)<Y(j)
            m_res(i)=m_res(i)+0;
        else
            m_res(i)=m_res(i)+1;
        end
        md_res(i)=md_res(i-1)+m_res(i);
    end
end
u_res(1)=0;
for i=2:N
    E=i*(i-1)/4;
    VAR=i*(i-1)*(2*i+5)/72;
    u_res(i)=(md_res(i)-E)/sqrt(VAR);
end