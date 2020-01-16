
x1 = zeros(201,1);
i = 1;
for n =-100:1:100
    if n >= 0 && n<=19
        x1(i) = 1;
    elseif n>=20 && n<=39
        x1(i) = 5;
    else
        x1(i) = 0;
    end
    i = i+1;
end
x2 = zeros(201,1);
i = 1;
for n =-100:1:100
    if abs(n) <= 5
        x2(i) = abs(n);
    else
        x2(i) = 0;
    end
    i = i+1;
end
%figure(1)
%Y1 = convolution(x1,x1);
%stem([-200:200],Y1);
%xlabel("n");
%ylabel("y[n]");
%title("x1[n] * x1[n]");
%figure(2)
%x2x2 = convolution(x2,x2);
%stem([-200:200],x2x2);
%xlabel("n");
%ylabel("y[n]");
%title("x2[n] * x2[n]");
%figure(3)
%x1x2 = convolution(x1,x2);
%stem([-200:200],x1x2);
%xlabel("n");
%ylabel("y[n]");
%title("x1[n] * x2[n]");
x1_2 = zeros(201,1);
x2_2 = zeros(201,1);
i = 1;
for n =-100:1:100
    x1_2(i) = heaviside(-2*n+4) - heaviside(-1*n-3);
    i = i+1;
end

i = 1;
for n =-100:1:100
    if n==10
        x2_2(i) = -14;
    elseif n == -10
        x2_2(i) = 7;
    end
    i = i+1;
end
%figure(1)
%Y1 = convolution(x1_2,x1_2);
%stem([-200:200],Y1);
%xlabel("n");
%ylabel("y[n]");
%title("x1[n] * x1[n]");
%figure(2)
%x2x2 = convolution(x2_2,x2_2);
%stem([-200:200],x2x2);
%xlabel("n");
%ylabel("y[n]");
%title("x2[n] * x2[n]");
%figure(3)
%x1x2 = convolution(x1_2,x2_2);
%stem([-200:200],x1x2);
%xlabel("n");
%ylabel("y[n]");
%title("x1[n] * x2[n]");



x1_3 = zeros(201,1);
x2_3 = zeros(201,1);
i = 1;
for n =-100:1:100
    if abs(n) <= 25
        x1_3(i) = 10*exp(-1*abs(n));
    else
        x1_3(i) = 0;
    end
    i = i+1;
end

i = 1;
for n =-100:1:100
    if abs(n) <= 25
        x1_3(i) = 10*exp(-1*abs(n));
    else
        x1_3(i) = 0;
    end
    i = i+1;
end

i = 1;
for n =-100:1:100
    if n== -3
        x2_3(i) = 4;
    elseif n == 0
        x2_3(i) = -8;
    elseif n==3
        x2_3(i) =4;
    end
    i = i+1;
end

figure(1)
Y1 = convolution(x1_3,x1_3);
stem([-200:200],Y1);
xlabel("n");
ylabel("y[n]");
title("x1[n] * x1[n]");
figure(2)
x2x2 = convolution(x2_3,x2_3);
stem([-200:200],x2x2);
xlabel("n");
ylabel("y[n]");
title("x2[n] * x2[n]");
figure(3)
x1x2 = convolution(x1_3,x2_3);
stem([-200:200],x1x2);
xlabel("n");
ylabel("y[n]");
title("x1[n] * x2[n]");
function Y = convolution(f,g)
    m = length(f);
    n = length(g);
    X=[f,zeros(n)];
    H=[g,zeros(m)];
    k =n+m-1;
    Y = zeros(k);
    for i = 1:k
        for j = 1:m
            if (i-j+1>0)
                Y(i) = Y(i)+X(j)*H(i-j+1);
            end
        end
    end
end

