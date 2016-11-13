function X=myFFT2(x)
[L,W] = size(x);
xRBO=zeros(L,W);
X=zeros(L,W);
%��һ��  ���ջ�2�㷨��ԭ�������� RBO reverse bit order
N = W;
M=N/2;
deep=0;
while M>1
    while deep <N
        for i=0:M-1                                    
            xRBO(:,i+deep+1)=x(:,2*i+deep+1); 
            xRBO(:,i+M+deep+1)=x(:,2*i+1+deep+1);  
        end
        deep=deep+2*M;
    end
    x=xRBO;
    deep=0;
    M=M/2;
end

%�ڶ�����������ִ�к����㷨
M=1;  
deep=0;

while M<=N/2        
    while deep<N       
        for u=1:M 

            Even=u+deep;    
            Odd=u+M+deep;  
 
            Wn=exp(-2j*pi*(u-1)/(2*M)); 
            %�����㷨
            X(:,Even)=xRBO(:,Even)+xRBO(:,Odd)*Wn; 
            X(:,Odd)=xRBO(:,Even)-xRBO(:,Odd)*Wn; 
        end        
        deep=deep+2*M;
    end   
    deep=0;
    xRBO=X;  
    M=2*M;
end