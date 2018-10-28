clc
clear
close all
%%%%%%%%%%%%%
x = input('String to be encoded : ', 's');
phrases = [''];

str = '';
for i = 1:length(x)
    str = str + string(x(i));
    if(~ismember(str, phrases))
        phrases = [phrases, str];
        str = '';
    end
end

phrases = phrases(2:end);
disp("String Parsing : ")
disp(phrases)

encode = [];

for i = 1:length(phrases)
    temp = char(phrases(i));
    len = strlength(temp);
    if(strlength(temp)==1)
        str = strcat("(","0",",",string(temp(len)),")");
        encode = [encode, str];
        continue
    end
    
    pos = find(ismember(phrases, temp(1:len-1)));
    str = strcat("(",string(pos),",",string(temp(len)),")");
    encode = [encode,str];
end
disp('Encoding :')
disp(encode)