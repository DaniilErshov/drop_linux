/*
 * stringFunctions.cpp
 *
 *  Created on: Jun 24, 2011
 *      Author: Laurence R. McGlashan
 */


#include "stringFunctions.h"
#include "boost/regex.hpp"
//#include "boost/algorithm/string.hpp"
#include <algorithm>
#include <string>

using namespace std;
using namespace boost;

string
IO::fileToString(const string& fileName)
{
    ifstream fin(fileName.c_str(), ios::in);

    string fileInString((istreambuf_iterator<char>(fin)),
                         istreambuf_iterator<char>());

    return convertToCaps(fileInString);
}

vector<string>
IO::fileToStrings(const string fileName)
{
    vector<string> lines;
    ifstream fin(fileName.c_str(), ios::in);
    string line;
    while (getline(fin, line)) {
        lines.push_back(convertToCaps(line));
    }
    return lines;
}

string
IO::regex_escape(const string& string_to_escape)
{
    static const regex re_boostRegexEscape("[\\^\\.\\$\\|\\(\\)\\[\\]\\*\\+\\?\\/\\\\]");
    const string rep("\\\\\\1&");
    string result = regex_replace(string_to_escape, re_boostRegexEscape, rep, match_default | format_sed);
    return result;
}


string
IO::replaceComments(const string& stringToReplace)
{
    regex commentRegex("(!.*?)\\n|(!.*?)$");
    string format_string = " \n";
    string result = regex_replace(stringToReplace, commentRegex, format_string, match_default | format_sed);
    return result;
}

string
IO::convertToCaps(const string& str)
{
    string str_copy(str);
    std::transform(str_copy.begin(), str_copy.end(), str_copy.begin(), ::toupper);
    return str_copy;
}

vector<string>
IO::convertToCaps(const vector<string>& str)
{
    for (size_t i=0; i<str.size(); ++i)
    {
        convertToCaps(str[i]);
    }
    return str;
}

void
IO::splitString(const std::string& str, std::vector<std::string>& v, const char* delims) {
    string val = IO::trimCopy(str);
    v.clear();
    if (val.empty()) {
        // In this case, prefer v to be empty instead of split's behavior of
        // returning a vector with one element that is the empty string.
        return;
    }
    int length = val.length() + 1;

    char* val_chr = new char[length];
#ifdef WIN32
    strcpy_s(val_chr, length, val.c_str());

    char* next_token = NULL;
    char* token = strtok_s(val_chr, delims, &next_token);
    while (token) {
        v.push_back(token);
        token = strtok_s(NULL, delims, &next_token);
    } // while
#else
    strcpy(val_chr, val.c_str());

    char* token = strtok(val_chr, delims);
    while (token) {
        v.push_back(token);
        token = strtok(NULL, delims);
    } // while
#endif

    delete[] val_chr;
}

/*
void
IO::tokenizeString(const string& in_val, vector<string>& v)
{
    string val = IO::trimCopy(in_val);
    v.clear();
    if (val.empty()) {
        // In this case, prefer v to be empty instead of split's behavior of
        // returning a vector with one element that is the empty string.
        return;
    }
    v = IO::splitString(val);
} */

string
IO::trimCopy(const string& strwithspaces) {
    size_t first = strwithspaces.find_first_not_of(' ');
    if (string::npos == first)
    {
        return string("");
    }
    size_t last = strwithspaces.find_last_not_of(' ');
    return strwithspaces.substr(first, (last - first + 1));
}

string
IO::eraseAll(const string& str, const string& chr) {
    string str_copy(str);
    int chr_sz = chr.size();

    while (str_copy.find(chr) != string::npos) {
        str_copy.erase(str_copy.find(chr), chr_sz);
    }

    return str_copy;
}

//! Check the format of the number.
void
IO::checkNumberFormat(std::string& t)
{
    const boost::regex numberFormatRegex("[A-CI-Z]");
    boost::smatch what;

    std::string::const_iterator start = t.begin();
    std::string::const_iterator end = t.end();

    if (boost::regex_search(start, end, what, numberFormatRegex))
    {
        throw std::runtime_error("from_string<> is complaining about the format"
                                 " of a string you've given it.");
    } else
    {
         // This is a bastard: Some numbers have D or G in them instead of E which
         // from_string can't deal with.
         boost::regex_replace(t, boost::regex("D"), "E");
         boost::regex_replace(t, boost::regex("F"), "E");
         boost::regex_replace(t, boost::regex("G"), "E");
         boost::regex_replace(t, boost::regex("H"), "E");
    }
}
