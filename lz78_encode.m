function encode = lz78_encode(s)
x = char(s);    %将输入的字符串转换为字符数组
dict = '';      %词典

str = "";
for i = 1:length(x)
    str = str + string(x(i));
    if(~ismember(str, dict))        %将最大非重复子串放入词典
        dict = [dict, str];
        str = "";
    end
end

dict = dict(2:end);


encode = [];

for i = 1:length(dict)      %根据词典进行编码
    temp = char(dict(i));
    len = strlength(temp);      %词典中当前词条的长度
    if(len==1)      %如果当前词条的长度为1，则说明没有重复的前缀，序号为0
        str = strcat("(","0",",",string(temp(len)),")");
        encode = [encode; str];
        continue;
    end
    
    pos = find(ismember(dict, temp(1:len-1)));      %找到前缀子串在词典中的位置
    str = strcat("(",string(pos),",",string(temp(len)),")");
    encode = [encode;str];
end
x2 = '';
for i=1:length(dict)        %将词典中的词条复原成字符串
    x2 = strcat(x2,dict(i));
end
if x2~=s        %如果复原的字符串不等于输入的字符串，就说明最后有一个串因为跟词典中已有的词条完全一样所以被漏掉了
    remain = x(strlength(x2)+1:length(x));      %得到被漏掉的子串
    pos = find(dict==string(remain));       %得到它的序号
    str = strcat("(",string(pos),",",")");
    encode = [encode;str];
end
