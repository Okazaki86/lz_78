function encode = lz78_encode(s)
x = char(s);    %��������ַ���ת��Ϊ�ַ�����
dict = '';      %�ʵ�

str = "";
for i = 1:length(x)
    str = str + string(x(i));
    if(~ismember(str, dict))        %�������ظ��Ӵ�����ʵ�
        dict = [dict, str];
        str = "";
    end
end

dict = dict(2:end);


encode = [];

for i = 1:length(dict)      %���ݴʵ���б���
    temp = char(dict(i));
    len = strlength(temp);      %�ʵ��е�ǰ�����ĳ���
    if(len==1)      %�����ǰ�����ĳ���Ϊ1����˵��û���ظ���ǰ׺�����Ϊ0
        str = strcat("(","0",",",string(temp(len)),")");
        encode = [encode; str];
        continue;
    end
    
    pos = find(ismember(dict, temp(1:len-1)));      %�ҵ�ǰ׺�Ӵ��ڴʵ��е�λ��
    str = strcat("(",string(pos),",",string(temp(len)),")");
    encode = [encode;str];
end
x2 = '';
for i=1:length(dict)        %���ʵ��еĴ�����ԭ���ַ���
    x2 = strcat(x2,dict(i));
end
if x2~=s        %�����ԭ���ַ���������������ַ�������˵�������һ������Ϊ���ʵ������еĴ�����ȫһ�����Ա�©����
    remain = x(strlength(x2)+1:length(x));      %�õ���©�����Ӵ�
    pos = find(dict==string(remain));       %�õ��������
    str = strcat("(",string(pos),",",")");
    encode = [encode;str];
end
