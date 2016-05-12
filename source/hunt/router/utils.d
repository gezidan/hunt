module hunt.router.utils;

import std.stdio;
import std.string;
import std.regex;

/// 构造正则表达式，类似上个版本的，把配置里的单独的表达式，构建成一个
string buildRegex(string reglist)
{
    string[] list = split(reglist, "/");
    string regexd;
    
    bool handleRegex(string str)
    {
        regexd ~= "(";
        auto site = indexOf(str,':');
        if(site < 0) return false;
        if(site > 0)
        {
            regexd ~= "?P<";
            regexd ~= str[0..site];
            regexd ~= ">";
        }
        regexd ~= str[(site + 1)..$];
        regexd ~= ")";
        return true;
    }
    
    bool regexBuild(string str)
    {
        regexd ~= r"\/";
        if(str.length == 0)
            return true;
        auto frist = indexOf(str,'{');
        auto last = lastIndexOf(str,"}");
        if(frist < 0 || last < 0) return false;
        if(frist > 0)  regexd ~= str[0..frist];

        if (!handleRegex(str[(frist+1)..last]) ) return false;
        if(last+1 < str.length)
            regexd ~= str[(last + 1)..$];
        return true;
    }
    
    foreach(ref str ; list)
    {
        if(!regexBuild(str)) return "";
    }
    return regexd;
}

unittest
{
    string reglist = "/{:[0-9a-z]{1}}/{d2:[0-9a-z]{2}}/{imagename:\\w+\\.\\w+}";
    string reg  = buildRegex(reglist);
    
    writeln("\n\n the regex is  : ", reg);
    auto r = regex(reg);
    writeln("this regex is : ", !r.empty);
    assert(reg.length > 0);
    
    reglist = "/{abc:[0-9a-z]{1}}/{imagename:\\w+\\.\\w+}";
    reg  = buildRegex(reglist);
    
    writeln("\n\n the regex is  : ", reg);
    r = regex(reg);
    writeln("this regex is : ", !r.empty);
    assert(reg.length > 0);
    
     reglist = "/{[0-9a-z]{1}}/{imagename:\\w+\\.\\w+}";
    reg  = buildRegex(reglist);
    
    writeln("\n\n the regex is  : ", reg);
    r = regex(reg);
    writeln("this regex is : ", !r.empty);
    assert(reg.length == 0);
    
    reglist = "/serew{:[0-9a-z]{1}}/{imagename:\\w+\\.\\w+}444";
    reg  = buildRegex(reglist);
    
    writeln("\n\n the regex is  : ", reg);
    r = regex(reg);
    writeln("this regex is : ", !r.empty);
    assert(reg.length > 0);
}





/// 判断URL中是否是正则表达式的 (是否有{字符)
bool isHaveRegex(string path)
{
    if(path.indexOf('{') < 0 && path.indexOf('}') < 0)
	return false;
    else
        return true;
}

/// file
/// 取出来地一个path： 例如： /file/ddd/f ; reurn = file,  lpath= /ddd/f;
string getFristPath(string fpath,out string lpath)
{
    if(fpath.length == 0) return "";
    if(fpath[0] == '/')
    {
	fpath = fpath[1..$];
    }

    auto sprit_pos = fpath.indexOf('/');
    
    if(sprit_pos < 0)
	return fpath;
    
    lpath = fpath[sprit_pos..$];
    return fpath[0..sprit_pos];
}

unittest
{
    string path = "/s/d/fwww/";
    string lpath;
    path = getFristPath(path,lpath);
    assert(path == "s");
    assert(lpath == "/d/fwww/");
    
    path = getFristPath(lpath,lpath);
    assert(path == "d");
    assert(lpath == "/fwww/");
    
    path = getFristPath(lpath,lpath);
    assert(path == "fwww");
    assert(lpath == "/");
    
    path = getFristPath(lpath,lpath);
    assert(path == "");
    assert(lpath == "");
}

