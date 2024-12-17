#ifndef JSON_JSON_H_INCLUDED
# define JSON_JSON_H_INCLUDED

# include "value.h"
# include "reader.h"
# include "writer.h"
void json_parse_file_or_die(const std::string& fname, Json::Value* out);


#endif // JSON_JSON_H_INCLUDED
