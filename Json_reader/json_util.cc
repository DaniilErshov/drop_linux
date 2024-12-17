
#include "json.h"
#include <fstream>
using namespace std;

void json_parse_file_or_die(const string& fname, Json::Value* out)
{
    Json::Reader reader;
    ifstream infile(fname);
    string line, content = "";
    if (infile.is_open())
    {
        while (getline(infile, line)) {
            content.append(line);
        }
    }
    else {
        cout << "Unable to open file";
    }
    //out->clear();
    //read_file_or_die(fname.c_str(), &content);
    if (!reader.parse(content.c_str(), *out)) {
        cout << "In json_parse_file " << reader.getFormatedErrorMessages();
    }
    infile.close();
}
