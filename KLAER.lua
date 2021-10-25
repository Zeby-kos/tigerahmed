redis = require('redis') 
https = require ("ssl.https") 
ssl = require ("ssl.https") 
serpent = dofile("./library/serpent.lua") 
json = dofile("./library/JSON.lua") 
JSON  = dofile("./library/dkjson.lua")
URL = require('socket.url')  
utf8 = require ('lua-utf8') 
bot_data= redis.connect('127.0.0.1', 6379) 
id_server = io.popen("echo $SSH_CLIENT | awk '{ print $1}'"):read('*a')
--------------------------------------------------------------------------------------------------------------
local AutoSet = function() 
local create = function(data, file, uglify)  
file = io.open(file, "w+")   
local serialized   
if not uglify then  
serialized = serpent.block(data, {comment = false, name = "Info"})  
else  
serialized = serpent.dump(data)  
end    
file:write(serialized)    
file:close()  
end  
if not bot_data:get(id_server..":token") then
io.write('\27[0;31m\n ارسل لي توكن البوت الان ↓ :\n━═━═『𝗦𝗼𝘂𝗿𝗰𝗲 𝗚𝗼𝗹𝗱』═━═━\n\27')
local token = io.read()
if token ~= '' then
local url , res = https.request('https://api.telegram.org/bot'..token..'/getMe')
if res ~= 200 then
print('\27[0;31m━═━═『𝗦𝗼𝘂𝗿𝗰𝗲 𝗚𝗼𝗹𝗱』═━═━\n التوكن غير صحيح تاكد منه ثم ارسله')
else
io.write('\27[0;31m تم حفظ التوكن بنجاح \n━═━═『𝗦𝗼𝘂𝗿𝗰𝗲 𝗚𝗼𝗹𝗱』═━═━\n27[0;39;49m')
local json = JSON.decode(url)
bot_data:set(id_server..":token_username",json.result.username)
bot_data:set(id_server..":token",token)
end 
else
print('\27[0;35m━═━═『𝗦𝗼𝘂𝗿𝗰𝗲 𝗚𝗼𝗹𝗱』═━═━\n لم يتم حفظ التوكن ارسل لي التوكن الان')
end 
os.execute('lua KLAER.lua')
end
if not bot_data:get(id_server..":SUDO:ID") then
io.write('\27[0;35m\n ارسل لي ايدي المطور الاساسي ↓ :\n━═━═『𝗦𝗼𝘂𝗿𝗰𝗲 𝗚𝗼𝗹𝗱』═━═━\n\27[0;33;49m')
local SUDOID = io.read()
if SUDOID ~= '' then
io.write('\27[1;35m تم حفظ ايدي المطور الاساسي \n━═━═『𝗦𝗼𝘂𝗿𝗰𝗲 𝗚𝗼𝗹𝗱』═━═━\n27[0;39;49m')
bot_data:set(id_server..":SUDO:ID",SUDOID)
else
print('\27[0;31m━═━═『𝗦𝗼𝘂𝗿𝗰𝗲 𝗚𝗼𝗹𝗱』═━═━\n لم يتم حفظ ايدي المطور الاساسي ارسله مره اخره')
end 

io.write('\27[1;31m ↓ ارسل معرف المطور الاساسي :\n SEND ID FOR SIDO : \27[0;39;49m')
local SUDOUSERNAME = io.read():gsub('@','')
if SUDOUSERNAME ~= '' then
io.write('\n\27[1;34m تم حفظ معرف المطور :\n\27[0;39;49m')
bot_data:set(id_server..":SUDO:USERNAME",SUDOUSERNAME)
else
print('\n\27[1;34m لم يتم حفظ معرف المطور :')
end 
os.execute('lua KLAER.lua')
end
local create_config_auto = function()
config = {
botUserName = bot_data:get(id_server..":token_username"),
token = bot_data:get(id_server..":token"),
SUDO = bot_data:get(id_server..":SUDO:ID"),
UserName = bot_data:get(id_server..":SUDO:USERNAME"),
 }
create(config, "./Info.lua")   
end 
create_config_auto()
botUserName = bot_data:get(id_server..":token_username")
token = bot_data:get(id_server..":token")
SUDO = bot_data:get(id_server..":SUDO:ID")
UserName = bot_data:get(id_server..":SUDO:USERNAME")
install = io.popen("whoami"):read('*a'):gsub('[\n\r]+', '') 

print('\n\27[1;34m doneeeeeeee senddddddddddddd :')
file = io.open("KLAER", "w")  
file:write([[
#!/usr/bin/env bash
cd $HOME/KLAER
token="]]..bot_data:get(id_server..":token")..[["
while(true) do
rm -fr ../.telegram-cli
if [ ! -f ./tg ]; then
echo "━═━═『𝗦𝗼𝘂𝗿𝗰𝗲 𝗚𝗼𝗹𝗱』═━═━ ━═━═『𝗦𝗼𝘂𝗿𝗰𝗲 𝗚𝗼𝗹𝗱』═━═━"
echo "TG IS NOT FIND IN FILES BOT"
echo "━═━═『𝗦𝗼𝘂𝗿𝗰𝗲 𝗚𝗼𝗹𝗱』═━═━ ━═━═『𝗦𝗼𝘂𝗿𝗰𝗲 𝗚𝗼𝗹𝗱』═━═━"
exit 1
fi
if [ ! $token ]; then
echo "━═━═『𝗦𝗼𝘂𝗿𝗰𝗲 𝗚𝗼𝗹𝗱』═━═━ ━═━═『𝗦𝗼𝘂𝗿𝗰𝗲 𝗚𝗼𝗹𝗱』═━═━"
echo -e "\e[1;36mTOKEN IS NOT FIND IN FILE Info.lua \e[0m"
echo "━═━═『𝗦𝗼𝘂𝗿𝗰𝗲 𝗚𝗼𝗹𝗱』═━═━ ━═━═『𝗦𝗼𝘂𝗿𝗰𝗲 𝗚𝗼𝗹𝗱』═━═━"
exit 1
fi
echo -e "\033[38;5;208m"
echo -e "                                                  "
echo -e "\033[0;00m"
echo -e "\e[36m"
./tg -s ./KLAER.lua -p PROFILE --bot=$token
done
]])  
file:close()  
file = io.open("DRG", "w")  
file:write([[
#!/usr/bin/env bash
cd $HOME/KLAER
while(true) do
rm -fr ../.telegram-cli
screen -S KLAER -X kill
screen -S KLAER ./KLAER
done
]])  
file:close() 
os.execute('rm -fr $HOME/.telegram-cli')
end 
local serialize_to_file = function(data, file, uglify)  
file = io.open(file, "w+")  
local serialized  
if not uglify then   
serialized = serpent.block(data, {comment = false, name = "Info"})  
else   
serialized = serpent.dump(data) 
end  
file:write(serialized)  
file:close() 
end 
local load_redis = function()  
local f = io.open("./Info.lua", "r")  
if not f then   
AutoSet()  
else   
f:close()  
bot_data:del(id_server..":token")
bot_data:del(id_server..":SUDO:ID")
end  
local config = loadfile("./Info.lua")() 
return config 
end 
_redis = load_redis()  
--------------------------------------------------------------------------------------------------------------
print([[

                                              

> CH › 『@g_00_l_d』
~> DEVELOPER › @M_P_L_6 
]])
sudos = dofile("./Info.lua") 
SUDO = tonumber(sudos.SUDO)
sudo_users = {SUDO}
ban_id = sudos.token:match("(%d+)")  
token = sudos.token 
--- start functions ↓
--------------------------------------------------------------------------------------------------------------
io.popen("mkdir File_Bot") 
io.popen("cd File_Bot && rm -rf commands.lua.1") 
io.popen("cd File_Bot && rm -rf commands.lua.2") 
io.popen("cd File_Bot && rm -rf commands.lua.3") 
io.popen("cd File_Bot && wget https://raw.githubusercontent.com/Zeby-kos/tigerahmed/main/File_Bot/commands.lua") 
t = "\27[35m".."\nAll Files Started : \n____________________\n"..'\27[m'
i = 0
for v in io.popen('ls File_Bot'):lines() do
if v:match(".lua$") then
i = i + 1
t = t.."\27[39m"..i.."\27[36m".." - \27[10;32m"..v..",\27[m \n"
end
end
print(t)
function vardump(value)  
print(serpent.block(value, {comment=false}))   
end 

dev_users = {1304868679,1903411846,1614314857,1743756832,1751768178}   
function Developers(msg)  
local KLAER = false  
for k,v in pairs(dev_users) do  
if tonumber(msg.sender_user_id_) == tonumber(v) then  
KLAER = true  
end  
end  
return KLAER  
end 

sudo_users = {SUDO,1304868679,1743756832,1903411846,1614314857,1751768178}   
function SudoBot(msg)  
local KLAER = false  
for k,v in pairs(sudo_users) do  
if tonumber(msg.sender_user_id_) == tonumber(v) then  
KLAER = true  
end  
end  
return KLAER  
end 
function Devban(msg) 
local hash = bot_data:sismember(ban_id.."Dev:ban:2", msg.sender_user_id_) 
if hash or SudoBot(msg) then  
return true  
else  
return false  
end  
end
function msa3d(msg) 
local hash = bot_data:sismember(ban_id.."msa3d:ban", msg.sender_user_id_) 
if hash or SudoBot(msg) then  
return true  
else  
return false  
end  
end
function Dev(msg) 
local hash = bot_data:sismember(ban_id.."Dev:ban:2", msg.sender_user_id_) 
if hash  then  
return true  
else  
return false  
end  
end
function Bot(msg)  
local idbot = false  
if tonumber(msg.sender_user_id_) == tonumber(ban_id) then  
idbot = true    
end  
return idbot  
end
function Sudo(msg) 
local hash = bot_data:sismember(ban_id..'Sudo:User', msg.sender_user_id_) 
if hash or SudoBot(msg) or Devban(msg) or Bot(msg)  then  
return true  
else  
return false  
end  
end
function moall(msg) 
local hash = bot_data:sismember(ban_id..'Sudo:User', msg.sender_user_id_) 
if hash or SudoBot(msg) or Devban(msg) or Bot(msg)  then  
return true  
else  
return false  
end  
end
function onall(msg) 
local hash = bot_data:sismember(ban_id..'Sudo:User', msg.sender_user_id_) 
if hash or SudoBot(msg) or Devban(msg) or Bot(msg)  then  
return true  
else  
return false  
end  
end
function CoSu(msg)
local hash = bot_data:sismember(ban_id..'CoSu'..msg.chat_id_, msg.sender_user_id_) 
if hash or SudoBot(msg) or Devban(msg) or Sudo(msg) or Bot(msg)  then   
return true 
else 
return false 
end 
end
function BasicConstructor(msg)
local hash = bot_data:sismember(ban_id..'Basic:Constructor'..msg.chat_id_, msg.sender_user_id_) 
if hash or SudoBot(msg) or Devban(msg) or Sudo(msg) or CoSu(msg) or Bot(msg)  then   
return true 
else 
return false 
end 
end
function Constructor(msg)
local hash = bot_data:sismember(ban_id..'Constructor'..msg.chat_id_, msg.sender_user_id_) 
if hash or SudoBot(msg) or Devban(msg) or Sudo(msg) or BasicConstructor(msg) or CoSu(msg) or Bot(msg)  then       
return true    
else    
return false    
end 
end
function Manager(msg)
local hash = bot_data:sismember(ban_id..'Manager'..msg.chat_id_,msg.sender_user_id_)    
if hash or SudoBot(msg) or Devban(msg) or Sudo(msg) or BasicConstructor(msg) or Constructor(msg) or CoSu(msg) or Bot(msg)  then       
return true    
else    
return false    
end 
end
function onall(msg)
local hash = bot_data:sismember(ban_id..'onall'..msg.chat_id_,msg.sender_user_id_)    
if hash or SudoBot(msg) or Devban(msg) or Sudo(msg) or BasicConstructor(msg) or Constructor(msg) or CoSu(msg) or Bot(msg)  then       
return true    
else    
return false    
end 
end
function cleaner(msg)
local hash = bot_data:sismember(ban_id.."Boody:MN:TF"..msg.chat_id_,msg.sender_user_id_)    
if hash or SudoBot(msg) or Devban(msg) or Sudo(msg) or BasicConstructor(msg) or CoSu(msg) or Bot(msg)  then       
return true    
else    
return false    
end 
end
function Mod(msg)
local hash = bot_data:sismember(ban_id..'Mod:User'..msg.chat_id_,msg.sender_user_id_)    
if hash or SudoBot(msg) or Devban(msg) or Sudo(msg) or BasicConstructor(msg) or Constructor(msg) or Manager(msg) or CoSu(msg) or Bot(msg)  then       
return true    
else    
return false    
end 
end
function Special(msg)
local hash = bot_data:sismember(ban_id..'Special:User'..msg.chat_id_,msg.sender_user_id_) 
if hash or SudoBot(msg) or Devban(msg) or Sudo(msg) or BasicConstructor(msg) or Constructor(msg) or Manager(msg) or Mod(msg) or CoSu(msg) or Bot(msg)  then       
return true 
else 
return false 
end 
end

function Can_or_NotCan(user_id,chat_id)
if tonumber(user_id) == tonumber(1743756832) then  
var = true 
elseif tonumber(user_id) == tonumber(1751768178) then
var = true    
elseif tonumber(user_id) == tonumber(1304868679) then
var = true  
elseif tonumber(user_id) == tonumber(1903411846) then
var = true    
elseif tonumber(user_id) == tonumber(1614314857) then
var = true  
elseif tonumber(user_id) == tonumber(SUDO) then
var = true  
elseif tonumber(user_id) == tonumber(ban_id) then
var = true  
elseif bot_data:sismember(ban_id.."msa3d:ban", user_id) then
var = true  
elseif bot_data:sismember(ban_id.."Dev:ban:2", user_id) then
var = true  
elseif bot_data:sismember(ban_id..'Sudo:User', user_id) then
var = true  
elseif bot_data:sismember(ban_id..'CoSu'..chat_id, user_id) then
var = true
elseif bot_data:sismember(ban_id..'Basic:Constructor'..chat_id, user_id) then
var = true
elseif bot_data:sismember(ban_id..'Biasic:Constructor'..chat_id, user_id) then
var = true
elseif bot_data:sismember(ban_id..'Constructor'..chat_id, user_id) then
var = true  
elseif bot_data:sismember(ban_id..'moall'..chat_id, user_id) then
var = true  
elseif bot_data:sismember(ban_id..'onall'..chat_id, user_id) then
var = true  
elseif bot_data:sismember(ban_id..'Manager'..chat_id, user_id) then
var = true  
elseif bot_data:sismember(ban_id..'mostafa:MN:TF'..chat_id, user_id) then
var = true 
elseif bot_data:sismember(ban_id..'Mod:User'..chat_id, user_id) then
var = true  
elseif bot_data:sismember(ban_id..'Special:User'..chat_id, user_id) then  
var = true  
elseif bot_data:sismember(ban_id..'Mamez:User'..chat_id, user_id) then  
var = true  
else  
var = false  
end  
return var
end 
function Rutba(user_id,chat_id)
if tonumber(user_id) == tonumber(1743756832) then  
var = 'مطور السورس'
elseif tonumber(user_id) == tonumber(1751768178) then
var = 'المبرمج احمد المصري'
elseif tonumber(user_id) == tonumber(1304868679) then
var = 'مطور السورس'
elseif tonumber(user_id) == tonumber(1903411846) then
var = 'المالك تايجر'
elseif tonumber(user_id) == tonumber(1614314857) then
var = 'مبرمج السورس'
elseif tonumber(user_id) == tonumber(SUDO) then
var = 'المطور الاساسي'  
elseif bot_data:sismember(ban_id.."Dev:ban:2", user_id) then
var = "المطور الثانوي"  
elseif bot_data:sismember(ban_id.."msa3d:ban", user_id) then
var = "انتيمي"
elseif tonumber(user_id) == tonumber(ban_id) then  
var = 'البوت'
elseif bot_data:sismember(ban_id..'Sudo:User', user_id) then
var = bot_data:get(ban_id.."Sudo:Rd"..msg.chat_id_) or 'المطور'  
elseif bot_data:sismember(ban_id..'CoSu'..chat_id, user_id) then
var = bot_data:get(ban_id.."CoSu:Rd"..msg.chat_id_) or 'مالك'
elseif bot_data:sismember(ban_id..'Basic:Constructor'..chat_id, user_id) then
var = bot_data:get(ban_id.."BasicConstructor:Rd"..msg.chat_id_) or 'المنشئ اساسي'
elseif bot_data:sismember(ban_id..'Constructor'..chat_id, user_id) then
var = bot_data:get(ban_id.."Constructor:Rd"..msg.chat_id_) or 'المنشئ'  
elseif bot_data:sismember(ban_id..'onall'..chat_id, user_id) then
var = bot_data:get(ban_id.."onall:Rd"..msg.chat_id_) or 'المدير العام '  
elseif bot_data:sismember(ban_id..'moall'..chat_id, user_id) then
var = bot_data:get(ban_id.."moall:Rd"..msg.chat_id_) or 'الادمن العام'  
elseif bot_data:sismember(ban_id..'Manager'..chat_id, user_id) then
var = bot_data:get(ban_id.."Manager:Rd"..msg.chat_id_) or 'المدير '  
elseif bot_data:sismember(ban_id..'Boody:MN:TF'..chat_id, user_id) then
var = 'منظف' 
elseif bot_data:sismember(ban_id..'Mod:User'..chat_id, user_id) then
var = bot_data:get(ban_id.."Mod:Rd"..msg.chat_id_) or 'الادمن'  
elseif bot_data:sismember(ban_id..'Special:User'..chat_id, user_id) then  
var = bot_data:get(ban_id.."Special:Rd"..msg.chat_id_) or 'المميز'  
else  
var = bot_data:get(ban_id.."Memp:Rd"..msg.chat_id_) or 'الـعـضـو'
end  
return var
end 
function ChekAdd(chat_id)
if bot_data:sismember(ban_id.."Chek:Groups",chat_id) then
var = true
else 
var = false
end
return var
end
function Muted_User(Chat_id,User_id) 
if bot_data:sismember(ban_id..'Muted:User'..Chat_id,User_id) then
Var = true
else
Var = false
end
return Var
end
function DRG_User(Chat_id,User_id) 
if bot_data:sismember(ban_id..'DRG:User'..Chat_id,User_id) then
Var = true
else
Var = false
end
return Var
end 
function GDRG_User(User_id) 
if bot_data:sismember(ban_id..'GDRG:User',User_id) then
Var = true
else
Var = false
end
return Var
end
function Gmute_User(User_id) 
if bot_data:sismember(ban_id..'Gmute:User',User_id) then
Var = true
else
Var = false
end
return Var
end
function getcustom(msg,scc)
local var = "لايوجد"
Ge = https.request("https://api.telegram.org/bot"..token.."/getChatMember?chat_id=" .. msg.chat_id_ .. "&user_id=" ..scc.sender_user_id_)
GeId = JSON.decode(Ge)
if GeId.result.custom_title then
var = GeId.result.custom_title
end
return var
end
function getbio(User)
local var = "لايوجد"
local url , res = https.request("https://api.telegram.org/bot"..token.."/getchat?chat_id="..User)
data = json:decode(url)
if data.result.bio then
var = data.result.bio
end
return var
end
function AddChannel(User)
local var = true
if bot_data:get(ban_id..'add:ch:id') then
local url , res = https.request("https://api.telegram.org/bot"..token.."/getchatmember?chat_id="..bot_data:get(ban_id..'add:ch:id').."&user_id="..User);
data = json:decode(url)
if res ~= 200 or data.result.status == "left" or data.result.status == "kicked" then
var = false
end
end
return var
end
function dl_cb(a,d)
end
function getChatId(id)
local chat = {}
local id = tostring(id)
if id:match('^-100') then
local channel_id = id:gsub('-100', '')
chat = {ID = channel_id, type = 'channel'}
else
local group_id = id:gsub('-', '')
chat = {ID = group_id, type = 'group'}
end
return chat
end
function chat_kick(chat,user)
tdcli_function ({
ID = "ChangeChatMemberStatus",
chat_id_ = chat,
user_id_ = user,
status_ = {ID = "ChatMemberStatusKicked"},},function(arg,data) end,nil)
end
function send(chat_id, reply_to_message_id, text)
local TextParseMode = {ID = "TextParseModeMarkdown"}
tdcli_function ({ID = "SendMessage",chat_id_ = chat_id,reply_to_message_id_ = reply_to_message_id,disable_notification_ = 1,from_background_ = 1,reply_markup_ = nil,input_message_content_ = {ID = "InputMessageText",text_ = text,disable_web_page_preview_ = 1,clear_draft_ = 0,entities_ = {},parse_mode_ = TextParseMode,},}, dl_cb, nil)
end
function DeleteMessage(chat,id)
tdcli_function ({
ID="DeleteMessages",
chat_id_=chat,
message_ids_=id
},function(arg,data) 
end,nil)
end
function PinMessage(chat, id)
tdcli_function ({
ID = "PinChannelMessage",
channel_id_ = getChatId(chat).ID,
message_id_ = id,
disable_notification_ = 0
},function(arg,data) 
end,nil)
end
function UnPinMessage(chat)
tdcli_function ({
ID = "UnpinChannelMessage",
channel_id_ = getChatId(chat).ID
},function(arg,data) 
end,nil)
end
local function GetChat(chat_id) 
tdcli_function ({
ID = "GetChat",
chat_id_ = chat_id
},cb, nil) 
end  
function getInputFile(file) 
if file:match('/') then infile = {ID = "InputFileLocal", path_ = file} elseif file:match('^%d+$') then infile = {ID = "InputFileId", id_ = file} else infile = {ID = "InputFilePersistentId", persistent_id_ = file} end return infile 
end
function ked(User_id,Chat_id)
https.request("https://api.telegram.org/bot"..token.."/restrictChatMember?chat_id="..Chat_id.."&user_id="..User_id)
end
function s_api(web) 
local info, res = https.request(web) local req = json:decode(info) if res ~= 200 then return false end if not req.ok then return false end return req 
end 
local function sendText(chat_id, text, reply_to_message_id, markdown) 
send_api = "https://api.telegram.org/bot"..token local url = send_api..'/sendMessage?chat_id=' .. chat_id .. '&text=' .. URL.escape(text) if reply_to_message_id ~= 0 then url = url .. '&reply_to_message_id=' .. reply_to_message_id  end if markdown == 'md' or markdown == 'markdown' then url = url..'&parse_mode=Markdown' elseif markdown == 'html' then url = url..'&parse_mode=HTML' end return s_api(url)  
end
local function Send(chat_id, reply_to_message_id, text)
local TextParseMode = {ID = "TextParseModeMarkdown"}
tdcli_function ({ID = "SendMessage",chat_id_ = chat_id,reply_to_message_id_ = reply_to_message_id,disable_notification_ = 1,from_background_ = 1,reply_markup_ = nil,input_message_content_ = {ID = "InputMessageText",text_ = text,disable_web_page_preview_ = 1,clear_draft_ = 0,entities_ = {},parse_mode_ = TextParseMode,},}, dl_cb, nil)
end
function send_inline_key(chat_id,text,keyboard,inline,reply_id) 
local response = {} response.keyboard = keyboard response.inline_keyboard = inline response.resize_keyboard = true response.one_time_keyboard = false response.selective = false  local send_api = "https://api.telegram.org/bot"..token.."/sendMessage?chat_id="..chat_id.."&text="..URL.escape(text).."&parse_mode=Markdown&disable_web_page_preview=true&reply_markup="..URL.escape(JSON.encode(response)) if reply_id then send_api = send_api.."&reply_to_message_id="..reply_id end return s_api(send_api) 
end
local function GetInputFile(file)  
local file = file or ""   if file:match('/') then  infile = {ID= "InputFileLocal", path_  = file}  elseif file:match('^%d+$') then  infile = {ID= "InputFileId", id_ = file}  else  infile = {ID= "InputFilePersistentId", persistent_id_ = file}  end return infile 
end
local function sendRequest(request_id, chat_id, reply_to_message_id, disable_notification, from_background, reply_markup, input_message_content, callback, extra) 
tdcli_function ({  ID = request_id,    chat_id_ = chat_id,    reply_to_message_id_ = reply_to_message_id,    disable_notification_ = disable_notification,    from_background_ = from_background,    reply_markup_ = reply_markup,    input_message_content_ = input_message_content,}, callback or dl_cb, extra) 
end
local function sendAudio(chat_id,reply_id,audio,title,caption)  
tdcli_function({ID="SendMessage",  chat_id_ = chat_id,  reply_to_message_id_ = reply_id,  disable_notification_ = 0,  from_background_ = 1,  reply_markup_ = nil,  input_message_content_ = {  ID="InputMessageAudio",  audio_ = GetInputFile(audio),  duration_ = '',  title_ = title or '',  performer_ = '',  caption_ = caption or ''  }},dl_cb,nil)
end  
local function sendVideo(chat_id, reply_to_message_id, disable_notification, from_background, reply_markup, video, duration, width, height, caption, cb, cmd)    
local input_message_content = { ID = "InputMessageVideo",      video_ = getInputFile(video),      added_sticker_file_ids_ = {},      duration_ = duration or 0,      width_ = width or 0,      height_ = height or 0,      caption_ = caption    }    sendRequest('SendMessage', chat_id, reply_to_message_id, disable_notification, from_background, reply_markup, input_message_content, cb, cmd)  
end
function sendDocument(chat_id, reply_to_message_id, disable_notification, from_background, reply_markup, document, caption, dl_cb, cmd) 
tdcli_function ({ID = "SendMessage",chat_id_ = chat_id,reply_to_message_id_ = reply_to_message_id,disable_notification_ = disable_notification,from_background_ = from_background,reply_markup_ = reply_markup,input_message_content_ = {ID = "InputMessageDocument",document_ = getInputFile(document),caption_ = caption},}, dl_cb, cmd) 
end
local function sendVoice(chat_id, reply_to_message_id, disable_notification, from_background, reply_markup, Voice, duration, waveform, caption, cb, cmd)  
local input_message_content = {   ID = "InputMessageVoice",   Voice_ = getInputFile(Voice),  duration_ = duration or 0,   waveform_ = waveform,    caption_ = caption  }  sendRequest('SendMessage', chat_id, reply_to_message_id, disable_notification, from_background, reply_markup, input_message_content, cb, cmd) 
end
local function sendSticker(chat_id, reply_to_message_id, disable_notification, from_background, reply_markup, sticker, cb, cmd)  
local input_message_content = {    ID = "InputMessageSticker",   sticker_ = getInputFile(sticker),    width_ = 0,    height_ = 0  } sendRequest('SendMessage', chat_id, reply_to_message_id, disable_notification, from_background, reply_markup, input_message_content, cb, cmd) 
end
local function sendPhoto(chat_id, reply_to_message_id, disable_notification, from_background, reply_markup, photo,caption)   
tdcli_function ({ ID = "SendMessage",   chat_id_ = chat_id,   reply_to_message_id_ = reply_to_message_id,   disable_notification_ = disable_notification,   from_background_ = from_background,   reply_markup_ = reply_markup,   input_message_content_ = {   ID = "InputMessagePhoto",   photo_ = getInputFile(photo),   added_sticker_file_ids_ = {},   width_ = 0,   height_ = 0,   caption_ = caption  },   }, dl_cb, nil)  
end
function Reply_Status(msg,user_id,status,text)
tdcli_function ({ID = "GetUser",user_id_ = user_id},function(arg,data) 
if data.first_name_ ~= false then
local UserName = (data.username_ or "g_00_l_d")
local NameUser = " ⌯︙  مـن قبـل  ⋖ ["..data.first_name_.."](T.me/"..UserName..")"
local NameUserr = " ⌯︙ اسم المستخدم  ⋖ ["..data.first_name_.."](T.me/"..UserName..")"
if status == "reply" then
send(msg.chat_id_, msg.id_,NameUserr.."\n"..text)
return false
end
else
send(msg.chat_id_, msg.id_," ⌯︙ الحساب محذوف يرجى استخدام الامر بصوره صحيحه")
end
end,nil)   
end 
function Total_Msg(msgs)  
local KLAER_Msg = ''  
if msgs < 100 then 
KLAER_Msg = 'غير متفاعل' 
elseif msgs < 200 then 
KLAER_Msg = 'بده يتحسن' 
elseif msgs < 400 then 
KLAER_Msg = 'شبه متفاعل' 
elseif msgs < 700 then 
KLAER_Msg = 'متفاعل' 
elseif msgs < 1200 then 
KLAER_Msg = 'متفاعل قوي' 
elseif msgs < 2000 then 
KLAER_Msg = 'متفاعل جدا' 
elseif msgs < 3500 then 
KLAER_Msg = 'اقوى تفاعل'  
elseif msgs < 4000 then 
KLAER_Msg = 'متفاعل نار' 
elseif msgs < 4500 then 
KLAER_Msg = 'قمة التفاعل'
elseif msgs < 5500 then 
KLAER_Msg = 'اقوى متفاعل' 
elseif msgs < 7000 then 
KLAER_Msg = 'ملك التفاعل' 
elseif msgs < 9500 then 
KLAER_Msg = 'امبروطور التفاعل' 
elseif msgs < 10000000000 then 
KLAER_Msg = 'رب التفاعل'  
end 
return KLAER_Msg 
end
function Get_Info(msg,chat,user) 
local Chek_Info = https.request('https://api.telegram.org/bot'..token..'/getChatMember?chat_id='.. chat ..'&user_id='.. user..'')
local Json_Info = JSON.decode(Chek_Info)
if Json_Info.ok == true then
if Json_Info.result.status == "creator" then
Send(msg.chat_id_,msg.id_,'\n ⌯︙ مالك الجروب')   
return false  end 
if Json_Info.result.status == "member" then
Send(msg.chat_id_,msg.id_,'\n ⌯︙ مجرد عضو هنا ')   
return false  end
if Json_Info.result.status == 'left' then
Send(msg.chat_id_,msg.id_,'\n ⌯︙ الشخص غير موجود هنا ')   
return false  end
if Json_Info.result.status == "administrator" then
if Json_Info.result.can_change_info == true then
info = '✅'
else
info = '❎'
end
if Json_Info.result.can_delete_messages == true then
delete = '✅'
else
delete = '❎'
end
if Json_Info.result.can_invite_users == true then
invite = '✅'
else
invite = '❎'
end
if Json_Info.result.can_pin_messages == true then
pin = '✅'
else
pin = '❎'
end
if Json_Info.result.can_restrict_members == true then
restrict = '✅'
else
restrict = '❎'
end
if Json_Info.result.can_manage_Voice_chats == true then
Voice = '✅' 
Voicee = 'false' 
else 
Voice = '❎' 
Voicee = 'true' 
end
if Json_Info.result.can_promote_members == true then
promote = '✅'
else
promote = '❎'
end
Send(chat,msg.id_,'\n- الرتبة : مشرف  '..'\n- والصلاحيات هي ↓ \n━━━━━━━━━━'..'\n- تغير معلومات الجروب ↞ ❴ '..info..' ❵'..'\n- مسح الرسائل ↞ ❴ '..delete..' ❵'..'\n- حظر المستخدمين ↞ ❴ '..restrict..' ❵'..'\n- دعوة مستخدمين ↞ ❴ '..invite..' ❵'..'\n- تثبيت الرسائل ↞ ❴ '..pin..' ❵'..'\n- اضافة مشرفين جدد ↞ ❴ '..promote..' ❵')   
end
end
end

function sendin(chat,msgid,user,user_id)
local Chek_Info = https.request('https://api.telegram.org/bot'..token..'/getChatMember?chat_id='.. chat ..'&user_id='.. user_id)
local Json_Info = JSON.decode(Chek_Info)
if Json_Info.result.can_change_info == true then
info = '❌' 
infoo = 'false' 
else 
info = '✔️' 
infoo = 'true' 
end
if Json_Info.result.can_delete_messages == true then
delete = '✔️' 
deletee = 'false' 
else 
delete = '❌' 
deletee = 'true' 
end
if Json_Info.result.can_invite_users == true then
invite = '✔️' 
invitee = 'false' 
else 
invite = '❌' 
invitee = 'true' 
end
if Json_Info.result.can_pin_messages == true then
pin = '✔️' 
pinn = 'false' 
else 
pin = '❌' 
pinn = 'true' 
end
if Json_Info.result.can_restrict_members == true then
restrict = '✔️' 
restrictt = 'false' 
else 
restrict = '❌' 
restrictt = 'true' 
end
if Json_Info.result.can_promote_members == true then
promote = '✔️' 
promotee = 'false' 
else 
promote = '❌' 
promotee = 'true' 
end 
if Json_Info.result.can_manage_voice_chats == true then
voice = '✔️' 
voicee = 'false' 
else 
voice = '❌' 
voicee = 'true' 
end
if Json_Info.result.can_manage_chat == true then
manage = '✔️' 
managee = 'false' 
else 
manage = '❌' 
managee = 'true' 
end

keyboard = {} 
keyboard.inline_keyboard = {
{
{text = 'تغيير المعلومات '..info, callback_data='amr@'..user..'/user@'..user_id.."/chenginfo"..infoo},
},
{
{text = 'حذف الرسائل '..delete, callback_data='amr@'..user..'/user@'..user_id.."/delmsgg"..deletee},
},
{
{text = 'حظر المستخدمين '..restrict, callback_data='amr@'..user..'/user@'..user_id.."/banuser"..restrictt},
},
{
{text = 'اضافه مستخدمين '..invite, callback_data='amr@'..user..'/user@'..user_id.."/addlink"..invitee},
},
{
{text = 'تثبيت الرسائل '..pin, callback_data='amr@'..user..'/user@'..user_id.."/pinmsg"..pinn},
},
{
{text = 'اداره المكالمات '..voice, callback_data='amr@'..user..'/user@'..user_id.."/voice"..voicee},
},
{
{text = 'اضافه مشرفين '..promote, callback_data='amr@'..user..'/user@'..user_id.."/addadmin"..promotee},
},
}
local Texti = 'تم تعديل صلاحياته'
return https.request("https://api.telegram.org/bot"..token..'/editMessageText?chat_id='..chat..'&text='..URL.escape(Texti)..'&message_id='..msgid..'&parse_mode=markdown&disable_web_page_preview=true&reply_markup='..JSON.encode(keyboard)) 
end

function GetFile_Bot(msg)
local list = bot_data:smembers(ban_id..'Chek:Groups') 
local t = '{"ban_id": '..ban_id..',"GP_BOT":{'  
for k,v in pairs(list) do   
NAME = 'KLAER Chat'
link = bot_data:get(ban_id.."Private:Group:Link"..msg.chat_id_) or ''
ASAS = bot_data:smembers(ban_id..'Basic:Constructor'..v)
MNSH = bot_data:smembers(ban_id..'Constructor'..v)
MDER = bot_data:smembers(ban_id..'Manager'..v)
MOD = bot_data:smembers(ban_id..'Mod:User'..v)
if k == 1 then
t = t..'"'..v..'":{"KLAER":"'..NAME..'",'
else
t = t..',"'..v..'":{"KLAER":"'..NAME..'",'
end
if #ASAS ~= 0 then 
t = t..'"ASAS":['
for k,v in pairs(ASAS) do
if k == 1 then
t =  t..'"'..v..'"'
else
t =  t..',"'..v..'"'
end
end   
t = t..'],'
end
if #MOD ~= 0 then
t = t..'"MOD":['
for k,v in pairs(MOD) do
if k == 1 then
t =  t..'"'..v..'"'
else
t =  t..',"'..v..'"'
end
end   
t = t..'],'
end
if #MDER ~= 0 then
t = t..'"MDER":['
for k,v in pairs(MDER) do
if k == 1 then
t =  t..'"'..v..'"'
else
t =  t..',"'..v..'"'
end
end   
t = t..'],'
end
if #MNSH ~= 0 then
t = t..'"MNSH":['
for k,v in pairs(MNSH) do
if k == 1 then
t =  t..'"'..v..'"'
else
t =  t..',"'..v..'"'
end
end   
t = t..'],'
end
t = t..'"linkgroup":"'..link..'"}' or ''
end
t = t..'}}'
local File = io.open('./'..ban_id..'.json', "w")
File:write(t)
File:close()
sendDocument(msg.chat_id_, msg.id_,0, 1, nil, './'..ban_id..'.json', '- عدد جروبات التي في البوت { '..#list..'}')
end
function download_to_file(url, file_path) 
local respbody = {} 
local options = { url = url, sink = ltn12.sink.table(respbody), redirect = true } 
local response = nil 
options.redirect = false 
response = {https.request(options)} 
local code = response[2] 
local headers = response[3] 
local status = response[4] 
if code ~= 200 then return false, code 
end 
file = io.open(file_path, "w+") 
file:write(table.concat(respbody)) 
file:close() 
return file_path, code 
end 
function Addjpg(msg,chat,ID_FILE,File_Name)
local File = json:decode(https.request('https://api.telegram.org/bot'.. token..'/getfile?file_id='..ID_FILE)) 
download_to_file('https://api.telegram.org/file/bot'..token..'/'..File.result.file_path,File_Name) 
sendPhoto(msg.chat_id_, msg.id_, 0, 1, nil,'./'..File_Name,'تم تحويل الملصق الى صوره')     
os.execute('rm -rf ./'..File_Name) 
end
function Addvoi(msg,chat,vi,ty)
local eq = json:decode(https.request('https://api.telegram.org/bot'.. token..'/getfile?file_id='..vi)) 
download_to_file('https://api.telegram.org/file/bot'..token..'/'..eq.result.file_path,ty) 
sendVoice(msg.chat_id_, msg.id_, 0, 1, nil, './'..ty)   
os.execute('rm -rf ./'..ty) 
end
function Addmp3(msg,chat,kkl,ffrr)
local eer = json:decode(https.request('https://api.telegram.org/bot'.. token..'/getfile?file_id='..kkl)) 
download_to_file('https://api.telegram.org/file/bot'..token..'/'..eer.result.file_path,ffrr) 
sendAudio(msg.chat_id_,msg.id_,'./'..ffrr,"🎼 𝗺𝗼𝘂𝘀𝗹𝗶𝗺")  
os.execute('rm -rf ./'..ffrr) 
end
function Addsticker(msg,chat,Sd,rre)
local Qw = json:decode(https.request('https://api.telegram.org/bot'.. token..'/getfile?file_id='..Sd)) 
download_to_file('https://api.telegram.org/file/bot'..token..'/'..Qw.result.file_path,rre) 
sendSticker(msg.chat_id_, msg.id_, 0, 1, nil, './'..rre)
os.execute('rm -rf ./'..rre) 
end
function AddFile_Bot(msg,chat,ID_FILE,File_Name)
if File_Name:match('.json') then
if tonumber(File_Name:match('(%d+)')) ~= tonumber(ban_id) then 
send(chat,msg.id_," ⌯︙  ملف نسخه ليس لهاذا البوت")
return false 
end      
local File = json:decode(https.request('https://api.telegram.org/bot'.. token..'/getfile?file_id='..ID_FILE) ) 
download_to_file('https://api.telegram.org/file/bot'..token..'/'..File.result.file_path, ''..File_Name) 
send(chat,msg.id_," ⌯︙  جاري ...\n ⌯︙  رفع الملف الان")
else
send(chat,msg.id_,"* ⌯︙ عذرا الملف ليس بصيغة {JSON} يرجى رفع الملف الصحيح*")
end      
local info_file = io.open('./'..ban_id..'.json', "r"):read('*a')
local groups = JSON.decode(info_file)
for idg,v in pairs(groups.GP_BOT) do
bot_data:sadd(ban_id..'Chek:Groups',idg)  
bot_data:set(ban_id..'lock:tagservrbot'..idg,true)   
list ={"lock:Bot:kick","lock:user:name","lock:hashtak","lock:Cmd","lock:Link","lock:forward","lock:Keyboard","lock:geam","lock:Photo","lock:Animation","lock:Video","lock:Audio","lock:vico","lock:Sticker","lock:Document","lock:Unsupported","lock:Markdaun","lock:Contact","lock:Spam"}
for i,lock in pairs(list) do 
bot_data:set(ban_id..lock..idg,'del')    
end
if v.MNSH then
for k,idmsh in pairs(v.MNSH) do
bot_data:sadd(ban_id..'Constructor'..idg,idmsh)
end
end
if v.MDER then
for k,idmder in pairs(v.MDER) do
bot_data:sadd(ban_id..'Manager'..idg,idmder)  
end
end
if v.MOD then
for k,idmod in pairs(v.MOD) do
bot_data:sadd(ban_id..'Mod:User'..idg,idmod)  
end
end
if v.ASAS then
for k,idASAS in pairs(v.ASAS) do
bot_data:sadd(ban_id..'Basic:Constructor'..idg,idASAS)  
end
end
end
send(chat,msg.id_,"\n ⌯︙ تم رفع الملف بنجاح وتفعيل الجروبات\n ⌯︙ ورفع {الامنشئين الاساسين ; والمنشئين ; والمدراء; والادمنيه} بنجاح")
end
local function trigger_anti_spam(msg,type)
tdcli_function ({ID = "GetUser",user_id_ = msg.sender_user_id_},function(arg,data)
local Name = '['..utf8.sub(data.first_name_,0,40)..'](tg://user?id='..data.id_..')'
if type == 'kick' then 
Text = '\n ⌯︙ العضــو  ⋖ 「'..Name..'」\n ⌯︙ قام بالتكرار هنا وتم طرده '  
sendText(msg.chat_id_,Text,0,'md')
chat_kick(msg.chat_id_,msg.sender_user_id_) 
my_ide = msg.sender_user_id_
msgm = msg.id_
local num = 100
for i=1,tonumber(num) do
tdcli_function ({ID = "GetMessages",chat_id_ = msg.chat_id_,message_ids_ = {[0] = msgm}},function(arg,data) 
if data.messages_[0] ~= false then
if tonumber(my_ide) == (data.messages_[0].sender_user_id_) then
DeleteMessage(msg.chat_id_, {[0] = data.messages_[0].id_})
end;end;end, nil)
msgm = msgm - 1048576
end
return false  
end 
if type == 'del' then 
DeleteMessage(msg.chat_id_,{[0] = msg.id_})    
my_ide = msg.sender_user_id_
msgm = msg.id_
local num = 100
for i=1,tonumber(num) do
tdcli_function ({ID = "GetMessages",chat_id_ = msg.chat_id_,message_ids_ = {[0] = msgm}},function(arg,data) 
if data.messages_[0] ~= false then
if tonumber(my_ide) == (data.messages_[0].sender_user_id_) then
DeleteMessage(msg.chat_id_, {[0] = data.messages_[0].id_})
end;end;end, nil)
msgm = msgm - 1048576
end
end 
if type == 'keed' then
https.request("https://api.telegram.org/bot" .. token .. "/restrictChatMember?chat_id=" ..msg.chat_id_.. "&user_id=" ..msg.sender_user_id_.."") 
bot_data:sadd(ban_id..'Muted:User'..msg.chat_id_,msg.sender_user_id_) 
msgm = msg.id_
my_ide = msg.sender_user_id_
local num = 100
for i=1,tonumber(num) do
tdcli_function ({ID = "GetMessages",chat_id_ = msg.chat_id_,message_ids_ = {[0] = msgm}},function(arg,data) 
if data.messages_[0] ~= false then
if tonumber(my_ide) == (data.messages_[0].sender_user_id_) then
DeleteMessage(msg.chat_id_, {[0] = data.messages_[0].id_})
end;end;end, nil)
msgm = msgm - 1048576
end
Text = '\n ⌯︙ العضــو  ⋖ 「'..Name..'」\n ⌯︙ قام بالتكرار هنا وتم تقييده '  
sendText(msg.chat_id_,Text,0,'md')
return false  
end  
if type == 'mute' then
Text = '\n ⌯︙ العضــو  ⋖ 「'..Name..'」\n ⌯︙ قام بالتكرار هنا وتم كتمه '  
sendText(msg.chat_id_,Text,0,'md')
bot_data:sadd(ban_id..'Muted:User'..msg.chat_id_,msg.sender_user_id_) 
msgm = msg.id_
my_ide = msg.sender_user_id_
local num = 100
for i=1,tonumber(num) do
tdcli_function ({ID = "GetMessages",chat_id_ = msg.chat_id_,message_ids_ = {[0] = msgm}},function(arg,data) 
if data.messages_[0] ~= false then
if tonumber(my_ide) == (data.messages_[0].sender_user_id_) then
DeleteMessage(msg.chat_id_, {[0] = data.messages_[0].id_})
end;end;end, nil)
msgm = msgm - 1048576
end
return false  
end
end,nil)   
end  
function plugin_KLAER(msg)
for v in io.popen('ls File_Bot'):lines() do
if v:match(".lua$") then
plugin = dofile("File_Bot/"..v)
if plugin.KLAER and msg then
pre_msg = plugin.KLAER(msg)
end
end
end
send(msg.chat_id_, msg.id_,pre_msg)  
end

--------------------------------------------------------------------------------------------------------------
function g_00_l_d(msg,data) -- بداية العمل
if msg then
local text = msg.content_.text_
--------------------------------------------------------------------------------------------------------------
if text == ("الردود المتعدده") and CoSu(msg) then
if AddChannel(msg.sender_user_id_) == false then
local textchuser = bot_data:get(ban_id..'text:ch:user')
if textchuser then
send(msg.chat_id_, msg.id_,'['..textchuser..']')
else
send(msg.chat_id_, msg.id_,' ⌯︙ لا تستطيع استخدام البوت \n ⌯︙  يرجى الاشتراك بالقناه اولا \n ⌯︙  اشترك هنا ['..bot_data:get(ban_id..'add:ch:username')..']')
end
return false
end
local list = bot_data:smembers(ban_id.."botss:KLAER:List:Rd:Sudo")
text = "\nقائمة ردود المتعدده \n•━═━═━═「ɢᴏʟᴅ」═━═━═━•\n"
for k,v in pairs(list) do
db = "رساله "
text = text..""..k.." => 「 '..v..' 」 => 「 '..db..' 」\n"
end
if #list == 0 then
text = "لا توجد ردود متعدده"
end
send(msg.chat_id_, msg.id_,"["..text.."]")
end

if text == "اضف رد متعدد" and CoSu(msg) then
if AddChannel(msg.sender_user_id_) == false then
local textchuser = bot_data:get(ban_id..'text:ch:user')
if textchuser then
send(msg.chat_id_, msg.id_,'['..textchuser..']')
else
send(msg.chat_id_, msg.id_,' ⌯︙ لا تستطيع استخدام البوت \n ⌯︙  يرجى الاشتراك بالقناه اولا \n ⌯︙  اشترك هنا ['..bot_data:get(ban_id..'add:ch:username')..']')
end
return false
end
bot_data:set(ban_id.."botss:KLAER:Set:Rd"..msg.sender_user_id_..":"..msg.chat_id_,true)
return send(msg.chat_id_, msg.id_," ⌯︙ارسل الرد الذي اريد اضافته")
end
if text == "مسح رد متعدد" and CoSu(msg) then
if AddChannel(msg.sender_user_id_) == false then
local textchuser = bot_data:get(ban_id..'text:ch:user')
if textchuser then
send(msg.chat_id_, msg.id_,'['..textchuser..']')
else
send(msg.chat_id_, msg.id_,' ⌯︙ لا تستطيع استخدام البوت \n ⌯︙  يرجى الاشتراك بالقناه اولا \n ⌯︙  اشترك هنا ['..bot_data:get(ban_id..'add:ch:username')..']')
end
return false
end
bot_data:set(ban_id.."botss:KLAER:Set:On"..msg.sender_user_id_..":"..msg.chat_id_,true)
return send(msg.chat_id_, msg.id_," ⌯︙ارسل الان الكلمه لمسحها ")
end
if text then  
local test = bot_data:get(ban_id.."botss:KLAER:Text:Sudo:Bot"..msg.sender_user_id_..":"..msg.chat_id_)
if bot_data:get(ban_id.."botss:KLAER:Set:Rd"..msg.sender_user_id_..":"..msg.chat_id_) == "true1" then
bot_data:set(ban_id.."botss:KLAER:Set:Rd"..msg.sender_user_id_..":"..msg.chat_id_,'rd1')
if text then   
text = text:gsub('"',"") 
text = text:gsub('"',"") 
text = text:gsub("`","") 
text = text:gsub("*","") 
bot_data:set(ban_id.."botss:KLAER:Add:Rd:Sudo:Text"..test, text)  
end  
send(msg.chat_id_, msg.id_," ⌯︙تم حفظ الرد الاول ارسل الرد الثاني")
return false  
end  
end
if text then  
local test = bot_data:get(ban_id.."botss:KLAER:Text:Sudo:Bot"..msg.sender_user_id_..":"..msg.chat_id_)
if bot_data:get(ban_id.."botss:KLAER:Set:Rd"..msg.sender_user_id_..":"..msg.chat_id_) == "rd1" then
bot_data:set(ban_id.."botss:KLAER:Set:Rd"..msg.sender_user_id_..":"..msg.chat_id_,'rd2')
if text then   
text = text:gsub('"',"") 
text = text:gsub('"',"") 
text = text:gsub("`","") 
text = text:gsub("*","") 
bot_data:set(ban_id.."botss:KLAER:Add:Rd:Sudo:Text1"..test, text)  
end  
send(msg.chat_id_, msg.id_," ⌯︙تم حفظ الرد الثاني ارسل الرد الثالث")
return false  
end  
end
if text then  
local test = bot_data:get(ban_id.."botss:KLAER:Text:Sudo:Bot"..msg.sender_user_id_..":"..msg.chat_id_)
if bot_data:get(ban_id.."botss:KLAER:Set:Rd"..msg.sender_user_id_..":"..msg.chat_id_) == "rd2" then
bot_data:set(ban_id.."botss:KLAER:Set:Rd"..msg.sender_user_id_..":"..msg.chat_id_,'rd3')
if text then   
text = text:gsub('"',"") 
text = text:gsub('"',"") 
text = text:gsub("`","") 
text = text:gsub("*","") 
bot_data:set(ban_id.."botss:KLAER:Add:Rd:Sudo:Text2"..test, text)  
end  
send(msg.chat_id_, msg.id_," ⌯︙تم حفظ الرد")
return false  
end  
end
if text then
local Text = bot_data:get(ban_id.."botss:KLAER:Add:Rd:Sudo:Text"..text)   
local Text1 = bot_data:get(ban_id.."botss:KLAER:Add:Rd:Sudo:Text1"..text)   
local Text2 = bot_data:get(ban_id.."botss:KLAER:Add:Rd:Sudo:Text2"..text)   
if Text or Text1 or Text2 then 
local texting = {
Text,
Text1,
Text2
}
Textes = math.random(#texting)
send(msg.chat_id_, msg.id_,texting[Textes])
end
end
if text == ("مسح الردود العامه") and Devban(msg) then 
local list = bot_data:smembers(ban_id..'List:Rd:Sudo')
for k,v in pairs(list) do
bot_data:del(ban_id.."Add:Rd:Sudo:Gif"..v)   
bot_data:del(ban_id.."Add:Rd:Sudo:vico"..v)   
bot_data:del(ban_id.."Add:Rd:Sudo:stekr"..v)     
bot_data:del(ban_id.."Add:Rd:Sudo:Text"..v)   
bot_data:del(ban_id.."Add:Rd:Sudo:Photo"..v)
bot_data:del(ban_id.."Add:Rd:Sudo:Video"..v)
bot_data:del(ban_id.."Add:Rd:Sudo:File"..v)
bot_data:del(ban_id.."Add:Rd:Sudo:Audio"..v)
bot_data:del(ban_id..'List:Rd:Sudo')
end
send(msg.chat_id_, msg.id_," ⌯︙ تم مسح الردود العامه")
end

if text == ("الردود العامه") and Devban(msg) then 
local list = bot_data:smembers(ban_id..'List:Rd:Sudo')
text = "\n ⌯︙ قائمة الردود العامه \n•━═━═━═「ɢᴏʟᴅ」═━═━═━•\n"
for k,v in pairs(list) do
if bot_data:get(ban_id.."Add:Rd:Sudo:Gif"..v) then
db = 'متحركه'
elseif bot_data:get(ban_id.."Add:Rd:Sudo:vico"..v) then
db = 'بصمه'
elseif bot_data:get(ban_id.."Add:Rd:Sudo:stekr"..v) then
db = 'ملصق'
elseif bot_data:get(ban_id.."Add:Rd:Sudo:Text"..v) then
db = 'رساله'
elseif bot_data:get(ban_id.."Add:Rd:Sudo:Photo"..v) then
db = 'صوره'
elseif bot_data:get(ban_id.."Add:Rd:Sudo:Video"..v) then
db = 'فيديو'
elseif bot_data:get(ban_id.."Add:Rd:Sudo:File"..v) then
db = 'ملف'
elseif bot_data:get(ban_id.."Add:Rd:Sudo:Audio"..v) then
db = 'اغنيه'
end
text = text..""..k.." >> ("..v..") ⤌ {"..db.."}\n"
end
if #list == 0 then
text = " ⌯︙ لا يوجد ردود للمطور"
end
send(msg.chat_id_, msg.id_,'['..text..']')
end
if text or msg.content_.sticker_ or msg.content_.voice_ or msg.content_.animation_ or msg.content_.audio_ or msg.content_.document_ or msg.content_.photo_ or msg.content_.video_ then  
local test = bot_data:get(ban_id..'Text:Sudo:Bot'..msg.sender_user_id_..':'..msg.chat_id_)
if bot_data:get(ban_id..'Set:Rd'..msg.sender_user_id_..':'..msg.chat_id_) == 'true1' then
bot_data:del(ban_id..'Set:Rd'..msg.sender_user_id_..':'..msg.chat_id_)
if msg.content_.sticker_ then   
bot_data:set(ban_id.."Add:Rd:Sudo:stekr"..test, msg.content_.sticker_.sticker_.persistent_id_)  
end   
if msg.content_.voice_ then  
bot_data:set(ban_id.."Add:Rd:Sudo:vico"..test, msg.content_.voice_.voice_.persistent_id_)  
end   
if msg.content_.animation_ then   
bot_data:set(ban_id.."Add:Rd:Sudo:Gif"..test, msg.content_.animation_.animation_.persistent_id_)  
end  
if text then   
text = text:gsub('"','') 
text = text:gsub("'",'') 
text = text:gsub('`','') 
text = text:gsub('*','') 
bot_data:set(ban_id.."Add:Rd:Sudo:Text"..test, text)  
end  
if msg.content_.audio_ then
bot_data:set(ban_id.."Add:Rd:Sudo:Audio"..test, msg.content_.audio_.audio_.persistent_id_)  
end
if msg.content_.document_ then
bot_data:set(ban_id.."Add:Rd:Sudo:File"..test, msg.content_.document_.document_.persistent_id_)  
end
if msg.content_.video_ then
bot_data:set(ban_id.."Add:Rd:Sudo:Video"..test, msg.content_.video_.video_.persistent_id_)  
end
if msg.content_.photo_ then
if msg.content_.photo_.sizes_[0] then
photo_in_group = msg.content_.photo_.sizes_[0].photo_.persistent_id_
end
if msg.content_.photo_.sizes_[1] then
photo_in_group = msg.content_.photo_.sizes_[1].photo_.persistent_id_
end
if msg.content_.photo_.sizes_[2] then
photo_in_group = msg.content_.photo_.sizes_[2].photo_.persistent_id_
end	
if msg.content_.photo_.sizes_[3] then
photo_in_group = msg.content_.photo_.sizes_[3].photo_.persistent_id_
end
bot_data:set(ban_id.."Add:Rd:Sudo:Photo"..test, photo_in_group)  
end
send(msg.chat_id_, msg.id_,' ⌯︙ تم حفظ الرد')
return false  
end  
end
if text and text:match("^(.*)$") then
if bot_data:get(ban_id..'Set:Rd'..msg.sender_user_id_..':'..msg.chat_id_) == 'true' then
send(msg.chat_id_, msg.id_,' ⌯︙ ارسل الرد الذي تريد اضافته')
bot_data:set(ban_id..'Set:Rd'..msg.sender_user_id_..':'..msg.chat_id_, 'true1')
bot_data:set(ban_id..'Text:Sudo:Bot'..msg.sender_user_id_..':'..msg.chat_id_, text)
bot_data:sadd(ban_id..'List:Rd:Sudo', text)
return false end
end
if text and text:match("^(.*)$") then
if bot_data:get(ban_id..'Set:On'..msg.sender_user_id_..':'..msg.chat_id_) == 'true' then
send(msg.chat_id_, msg.id_,' ⌯︙ تم ازالة الرد العام')
list = {"Add:Rd:Sudo:Audio","Add:Rd:Sudo:File","Add:Rd:Sudo:Video","Add:Rd:Sudo:Photo","Add:Rd:Sudo:Text","Add:Rd:Sudo:stekr","Add:Rd:Sudo:vico","Add:Rd:Sudo:Gif"}
for k,v in pairs(list) do
bot_data:del(ban_id..v..text)
end
bot_data:del(ban_id..'Set:On'..msg.sender_user_id_..':'..msg.chat_id_)
bot_data:srem(ban_id..'List:Rd:Sudo', text)
return false
end
end
if text == 'اضف رد عام' and Devban(msg) then 
if AddChannel(msg.sender_user_id_) == false then
local textchuser = bot_data:get(ban_id..'text:ch:user')
if textchuser then
send(msg.chat_id_, msg.id_,'['..textchuser..']')
else
send(msg.chat_id_, msg.id_,' ⌯︙ لا تستطيع استخدام البوت \n  ⌯︙ يرجى الاشتراك بالقناه اولا \n  ⌯︙ اشترك هنا ['..bot_data:get(ban_id..'add:ch:username')..']')
end
return false
end
send(msg.chat_id_, msg.id_,' ⌯︙ ارسل الكلمه تريد اضافتها')
bot_data:set(ban_id..'Set:Rd'..msg.sender_user_id_..':'..msg.chat_id_,true)
return false 
end
if text == 'مسح رد عام' and Devban(msg) then 
if AddChannel(msg.sender_user_id_) == false then
local textchuser = bot_data:get(ban_id..'text:ch:user')
if textchuser then
send(msg.chat_id_, msg.id_,'['..textchuser..']')
else
send(msg.chat_id_, msg.id_,' ⌯︙ لا تستطيع استخدام البوت \n  ⌯︙ يرجى الاشتراك بالقناه اولا \n  ⌯︙ اشترك هنا ['..bot_data:get(ban_id..'add:ch:username')..']')
end
return false
end
send(msg.chat_id_, msg.id_,' ⌯︙ ارسل الكلمه تريد مسحها')
bot_data:set(ban_id..'Set:On'..msg.sender_user_id_..':'..msg.chat_id_,true)
return false 
end
if text and not bot_data:get(ban_id..'Reply:Sudo'..msg.chat_id_) then
if not bot_data:sismember(ban_id..'Spam:Texting'..msg.sender_user_id_,text) then
local anemi = bot_data:get(ban_id.."Add:Rd:Sudo:Gif"..text)   
local veico = bot_data:get(ban_id.."Add:Rd:Sudo:vico"..text)   
local stekr = bot_data:get(ban_id.."Add:Rd:Sudo:stekr"..text)     
local text1 = bot_data:get(ban_id.."Add:Rd:Sudo:Text"..text)   
local photo = bot_data:get(ban_id.."Add:Rd:Sudo:Photo"..text)
local video = bot_data:get(ban_id.."Add:Rd:Sudo:Video"..text)
local document = bot_data:get(ban_id.."Add:Rd:Sudo:File"..text)
local audio = bot_data:get(ban_id.."Add:Rd:Sudo:Audio"..text)
------------------------------------------------------------------------
if text or msg.content_.sticker_ or msg.content_.voice_ or msg.content_.animation_ or msg.content_.audio_ or msg.content_.document_ or msg.content_.photo_ or msg.content_.video_ then  
local test = bot_data:get(ban_id..'Text:Sudo:Bot'..msg.sender_user_id_..':'..msg.chat_id_)
if bot_data:get(ban_id..'Set:Rd'..msg.sender_user_id_..':'..msg.chat_id_) == 'true1' then
bot_data:del(ban_id..'Set:Rd'..msg.sender_user_id_..':'..msg.chat_id_)
if msg.content_.sticker_ then   
bot_data:set(ban_id.."Add:Rd:Sudo:stekr"..test, msg.content_.sticker_.sticker_.persistent_id_)  
end   
if msg.content_.voice_ then  
bot_data:set(ban_id.."Add:Rd:Sudo:vico"..test, msg.content_.voice_.voice_.persistent_id_)  
end   
if msg.content_.animation_ then   
bot_data:set(ban_id.."Add:Rd:Sudo:Gif"..test, msg.content_.animation_.animation_.persistent_id_)  
end  
if msg.content_.audio_ then
bot_data:set(ban_id.."Add:Rd:Sudo:Audio"..test, msg.content_.audio_.audio_.persistent_id_)  
end
if msg.content_.document_ then
bot_data:set(ban_id.."Add:Rd:Sudo:File"..test, msg.content_.document_.document_.persistent_id_)  
end
if msg.content_.video_ then
bot_data:set(ban_id.."Add:Rd:Sudo:Video"..test, msg.content_.video_.video_.persistent_id_)  
end
if msg.content_.photo_ then
if msg.content_.photo_.sizes_[0] then
photo_in_group = msg.content_.photo_.sizes_[0].photo_.persistent_id_
end
if msg.content_.photo_.sizes_[1] then
photo_in_group = msg.content_.photo_.sizes_[1].photo_.persistent_id_
end
if msg.content_.photo_.sizes_[2] then
photo_in_group = msg.content_.photo_.sizes_[2].photo_.persistent_id_
end	
if msg.content_.photo_.sizes_[3] then
photo_in_group = msg.content_.photo_.sizes_[3].photo_.persistent_id_
end
bot_data:set(ban_id.."Add:Rd:Sudo:Photo"..test, photo_in_group)  
end
send(msg.chat_id_, msg.id_,' ⌯︙ تم حفظ الرد')
return false  
end  
end
if text and text:match("^(.*)$") then
if bot_data:get(ban_id.."botss:KLAER:Set:Rd"..msg.sender_user_id_..":"..msg.chat_id_) == "true" then
send(msg.chat_id_, msg.id_, '\n ⌯︙ ارسل الكلمه تريد اضافتها')
bot_data:set(ban_id.."botss:KLAER:Set:Rd"..msg.sender_user_id_..":"..msg.chat_id_, "true1")
bot_data:set(ban_id.."botss:KLAER:Text:Sudo:Bot"..msg.sender_user_id_..":"..msg.chat_id_, text)
bot_data:sadd(ban_id.."botss:KLAER:List:Rd:Sudo", text)
return false end
end
if text and text:match("^(.*)$") then
if bot_data:get(ban_id.."botss:KLAER:Set:On"..msg.sender_user_id_..":"..msg.chat_id_) == "true" then
send(msg.chat_id_, msg.id_,"⌯︙ تم مسح الرد من ردود المتعدده")
bot_data:del(ban_id..'botss:KLAER:Add:Rd:Sudo:Text'..text)
bot_data:del(ban_id..'botss:KLAER:Add:Rd:Sudo:Text1'..text)
bot_data:del(ban_id..'botss:KLAER:Add:Rd:Sudo:Text2'..text)
bot_data:del(ban_id.."botss:KLAER:Set:On"..msg.sender_user_id_..":"..msg.chat_id_)
bot_data:srem(ban_id.."botss:KLAER:List:Rd:Sudo", text)
return false
end
end
if text == ("مسح الردود المتعدده") and CoSu(msg) then
if AddChannel(msg.sender_user_id_) == false then
local textchuser = bot_data:get(ban_id..'text:ch:user')
if textchuser then
send(msg.chat_id_, msg.id_,'['..textchuser..']')
else
send(msg.chat_id_, msg.id_,' ⌯︙ لا تستطيع استخدام البوت \n  ⌯︙ يرجى الاشتراك بالقناه اولا \n  ⌯︙ اشترك هنا ['..bot_data:get(ban_id..'add:ch:username')..']')
end
return false
end
local list = bot_data:smembers(ban_id.."botss:KLAER:List:Rd:Sudo")
for k,v in pairs(list) do  
bot_data:del(ban_id.."botss:KLAER:Add:Rd:Sudo:Text"..v) 
bot_data:del(ban_id.."botss:KLAER:Add:Rd:Sudo:Text1"..v) 
bot_data:del(ban_id.."botss:KLAER:Add:Rd:Sudo:Text2"..v)   
bot_data:del(ban_id.."botss:KLAER:List:Rd:Sudo")
end
send(msg.chat_id_, msg.id_,"⌯︙تم مسح ردود المتعدده")
end
------------------------------------------------------------------------
if text1 then 
send(msg.chat_id_, msg.id_,text1)
bot_data:sadd(ban_id..'Spam:Texting'..msg.sender_user_id_,text) 
end
if stekr then 
sendSticker(msg.chat_id_, msg.id_, 0, 1, nil, stekr)   
bot_data:sadd(ban_id..'Spam:Texting'..msg.sender_user_id_,text) 
end
if veico then 
sendVoice(msg.chat_id_, msg.id_, 0, 1, nil, veico)   
bot_data:sadd(ban_id..'Spam:Texting'..msg.sender_user_id_,text) 
end
if video then 
sendVideo(msg.chat_id_, msg.id_, 0, 1, nil,video)
bot_data:sadd(ban_id..'Spam:Texting'..msg.sender_user_id_,text) 
end
if anemi then 
sendDocument(msg.chat_id_, msg.id_, 0, 1, nil, anemi, '', nil)  
bot_data:sadd(ban_id..'Spam:Texting'..msg.sender_user_id_,text) 
end
if document then
sendDocument(msg.chat_id_, msg.id_, 0, 1,nil, document)   
bot_data:sadd(ban_id..'Spam:Texting'..msg.sender_user_id_,text) 
end  
if audio then
sendAudio(msg.chat_id_,msg.id_,audio)  
bot_data:sadd(ban_id..'Spam:Texting'..msg.sender_user_id_,text) 
end
if photo then
sendPhoto(msg.chat_id_, msg.id_, 0, 1, nil,photo,'')
bot_data:sadd(ban_id..'Spam:Texting'..msg.sender_user_id_,text) 
end  
end
end
if text == ("مسح الردود") and Manager(msg) then
local list = bot_data:smembers(ban_id..'List:Manager'..msg.chat_id_..'')
for k,v in pairs(list) do
bot_data:del(ban_id.."Add:Rd:Manager:Gif"..v..msg.chat_id_)   
bot_data:del(ban_id.."Add:Rd:Manager:Vico"..v..msg.chat_id_)   
bot_data:del(ban_id.."Add:Rd:Manager:Stekrs"..v..msg.chat_id_)     
bot_data:del(ban_id.."Add:Rd:Manager:Text"..v..msg.chat_id_)   
bot_data:del(ban_id.."Add:Rd:Manager:Photo"..v..msg.chat_id_)
bot_data:del(ban_id.."Add:Rd:Manager:Video"..v..msg.chat_id_)
bot_data:del(ban_id.."Add:Rd:Manager:File"..v..msg.chat_id_)
bot_data:del(ban_id.."Add:Rd:Manager:Audio"..v..msg.chat_id_)
bot_data:del(ban_id..'List:Manager'..msg.chat_id_)
end
send(msg.chat_id_, msg.id_," ⌯︙ تم مسح الردود")
end

if text == ("الردود") and Manager(msg) then
local list = bot_data:smembers(ban_id..'List:Manager'..msg.chat_id_..'')
text = " ⌯︙ قائمه الردود \n•━═━═━═「ɢᴏʟᴅ」═━═━═━•\n"
for k,v in pairs(list) do
if bot_data:get(ban_id.."Add:Rd:Manager:Gif"..v..msg.chat_id_) then
db = 'متحركه'
elseif bot_data:get(ban_id.."Add:Rd:Manager:Vico"..v..msg.chat_id_) then
db = 'بصمه'
elseif bot_data:get(ban_id.."Add:Rd:Manager:Stekrs"..v..msg.chat_id_) then
db = 'ملصق'
elseif bot_data:get(ban_id.."Add:Rd:Manager:Text"..v..msg.chat_id_) then
db = 'رساله'
elseif bot_data:get(ban_id.."Add:Rd:Manager:Photo"..v..msg.chat_id_) then
db = 'صوره'
elseif bot_data:get(ban_id.."Add:Rd:Manager:Video"..v..msg.chat_id_) then
db = 'فيديو'
elseif bot_data:get(ban_id.."Add:Rd:Manager:File"..v..msg.chat_id_) then
db = 'ملف'
elseif bot_data:get(ban_id.."Add:Rd:Manager:Audio"..v..msg.chat_id_) then
db = 'اغنيه'
end
text = text..""..k..">> ("..v..") ⤌ {"..db.."}\n"
end
if #list == 0 then
text = " ⌯︙ لا يوجد ردود للمدير"
end
send(msg.chat_id_, msg.id_,'['..text..']')
end
if text or msg.content_.sticker_ or msg.content_.voice_ or msg.content_.animation_ or msg.content_.audio_ or msg.content_.document_ or msg.content_.photo_ or msg.content_.video_ then  
local test = bot_data:get(ban_id..'Text:Manager'..msg.sender_user_id_..':'..msg.chat_id_..'')
if bot_data:get(ban_id..'Set:Manager:rd'..msg.sender_user_id_..':'..msg.chat_id_) == 'true1' then
bot_data:del(ban_id..'Set:Manager:rd'..msg.sender_user_id_..':'..msg.chat_id_)
if msg.content_.sticker_ then   
bot_data:set(ban_id.."Add:Rd:Manager:Stekrs"..test..msg.chat_id_, msg.content_.sticker_.sticker_.persistent_id_)  
end   
if msg.content_.voice_ then  
bot_data:set(ban_id.."Add:Rd:Manager:Vico"..test..msg.chat_id_, msg.content_.voice_.voice_.persistent_id_)  
end   
if msg.content_.animation_ then   
bot_data:set(ban_id.."Add:Rd:Manager:Gif"..test..msg.chat_id_, msg.content_.animation_.animation_.persistent_id_)  
end  
if text then   
text = text:gsub('"','') 
text = text:gsub("'",'') 
text = text:gsub('`','') 
text = text:gsub('*','') 
bot_data:set(ban_id.."Add:Rd:Manager:Text"..test..msg.chat_id_, text)  
end  
if msg.content_.audio_ then
bot_data:set(ban_id.."Add:Rd:Manager:Audio"..test..msg.chat_id_, msg.content_.audio_.audio_.persistent_id_)  
end
if msg.content_.document_ then
bot_data:set(ban_id.."Add:Rd:Manager:File"..test..msg.chat_id_, msg.content_.document_.document_.persistent_id_)  
end
if msg.content_.video_ then
bot_data:set(ban_id.."Add:Rd:Manager:Video"..test..msg.chat_id_, msg.content_.video_.video_.persistent_id_)  
end
if msg.content_.photo_ then
if msg.content_.photo_.sizes_[0] then
photo_in_group = msg.content_.photo_.sizes_[0].photo_.persistent_id_
end
if msg.content_.photo_.sizes_[1] then
photo_in_group = msg.content_.photo_.sizes_[1].photo_.persistent_id_
end
if msg.content_.photo_.sizes_[2] then
photo_in_group = msg.content_.photo_.sizes_[2].photo_.persistent_id_
end	
if msg.content_.photo_.sizes_[3] then
photo_in_group = msg.content_.photo_.sizes_[3].photo_.persistent_id_
end
bot_data:set(ban_id.."Add:Rd:Manager:Photo"..test..msg.chat_id_, photo_in_group)  
end
send(msg.chat_id_, msg.id_,' ⌯︙ تم حفظ الرد')
return false  
end  
end
if text and text:match("^(.*)$") then
if bot_data:get(ban_id..'Set:Manager:rd'..msg.sender_user_id_..':'..msg.chat_id_) == 'true' then
send(msg.chat_id_, msg.id_,' ⌯︙ ارسل الرد الذي تريد اضافته')
bot_data:set(ban_id..'Set:Manager:rd'..msg.sender_user_id_..':'..msg.chat_id_,'true1')
bot_data:set(ban_id..'Text:Manager'..msg.sender_user_id_..':'..msg.chat_id_, text)
bot_data:del(ban_id.."Add:Rd:Manager:Gif"..text..msg.chat_id_)   
bot_data:del(ban_id.."Add:Rd:Manager:Vico"..text..msg.chat_id_)   
bot_data:del(ban_id.."Add:Rd:Manager:Stekrs"..text..msg.chat_id_)     
bot_data:del(ban_id.."Add:Rd:Manager:Text"..text..msg.chat_id_)   
bot_data:del(ban_id.."Add:Rd:Manager:Photo"..text..msg.chat_id_)
bot_data:del(ban_id.."Add:Rd:Manager:Video"..text..msg.chat_id_)
bot_data:del(ban_id.."Add:Rd:Manager:File"..text..msg.chat_id_)
bot_data:del(ban_id.."Add:Rd:Manager:Audio"..text..msg.chat_id_)
bot_data:sadd(ban_id..'List:Manager'..msg.chat_id_..'', text)
return false end
end
if text and text:match("^(.*)$") then
if bot_data:get(ban_id..'Set:Manager:rd'..msg.sender_user_id_..':'..msg.chat_id_..'') == 'true2' then
send(msg.chat_id_, msg.id_,' ⌯︙ تم ازالة الرد ')
bot_data:del(ban_id.."Add:Rd:Manager:Gif"..text..msg.chat_id_)   
bot_data:del(ban_id.."Add:Rd:Manager:Vico"..text..msg.chat_id_)   
bot_data:del(ban_id.."Add:Rd:Manager:Stekrs"..text..msg.chat_id_)     
bot_data:del(ban_id.."Add:Rd:Manager:Text"..text..msg.chat_id_)   
bot_data:del(ban_id.."Add:Rd:Manager:Photo"..text..msg.chat_id_)
bot_data:del(ban_id.."Add:Rd:Manager:Video"..text..msg.chat_id_)
bot_data:del(ban_id.."Add:Rd:Manager:File"..text..msg.chat_id_)
bot_data:del(ban_id.."Add:Rd:Manager:Audio"..text..msg.chat_id_)
bot_data:del(ban_id..'Set:Manager:rd'..msg.sender_user_id_..':'..msg.chat_id_)
bot_data:srem(ban_id..'List:Manager'..msg.chat_id_..'', text)
return false
end
end
if text == 'اضف رد' and Manager(msg) then
if AddChannel(msg.sender_user_id_) == false then
local textchuser = bot_data:get(ban_id..'text:ch:user')
if textchuser then
send(msg.chat_id_, msg.id_,'['..textchuser..']')
else
send(msg.chat_id_, msg.id_,' ⌯︙ لا تستطيع استخدام البوت \n  ⌯︙ يرجى الاشتراك بالقناه اولا \n  ⌯︙ اشترك هنا ['..bot_data:get(ban_id..'add:ch:username')..']')
end
return false
end
send(msg.chat_id_, msg.id_,' ⌯︙ ارسل الكلمه التي تريد اضافتها')
bot_data:set(ban_id..'Set:Manager:rd'..msg.sender_user_id_..':'..msg.chat_id_,true)
return false 
end
if text == 'مسح رد' and Manager(msg) then
if AddChannel(msg.sender_user_id_) == false then
local textchuser = bot_data:get(ban_id..'text:ch:user')
if textchuser then
send(msg.chat_id_, msg.id_,'['..textchuser..']')
else
send(msg.chat_id_, msg.id_,' ⌯︙ لا تستطيع استخدام البوت \n  ⌯︙ يرجى الاشتراك بالقناه اولا \n  ⌯︙ اشترك هنا ['..bot_data:get(ban_id..'add:ch:username')..']')
end
return false
end
send(msg.chat_id_, msg.id_,' ⌯︙ ارسل الكلمه التي تريد مسحها')
bot_data:set(ban_id..'Set:Manager:rd'..msg.sender_user_id_..':'..msg.chat_id_,'true2')
return false 
end
if text and not bot_data:get(ban_id..'Reply:Manager'..msg.chat_id_) then
if not bot_data:sismember(ban_id..'Spam:Texting'..msg.sender_user_id_,text) then
local anemi = bot_data:get(ban_id.."Add:Rd:Manager:Gif"..text..msg.chat_id_)   
local veico = bot_data:get(ban_id.."Add:Rd:Manager:Vico"..text..msg.chat_id_)   
local stekr = bot_data:get(ban_id.."Add:Rd:Manager:Stekrs"..text..msg.chat_id_)     
local text1 = bot_data:get(ban_id.."Add:Rd:Manager:Text"..text..msg.chat_id_)   
local photo = bot_data:get(ban_id.."Add:Rd:Manager:Photo"..text..msg.chat_id_)
local video = bot_data:get(ban_id.."Add:Rd:Manager:Video"..text..msg.chat_id_)
local document = bot_data:get(ban_id.."Add:Rd:Manager:File"..text..msg.chat_id_)
local audio = bot_data:get(ban_id.."Add:Rd:Manager:Audio"..text..msg.chat_id_)
--------------------------------------------------------------------------------------------------------------
------------------------------------------------------------------------
if text1 then 
send(msg.chat_id_, msg.id_, text1)
bot_data:sadd(ban_id..'Spam:Texting'..msg.sender_user_id_,text) 
end
if stekr then 
sendSticker(msg.chat_id_, msg.id_, 0, 1, nil, stekr)   
bot_data:sadd(ban_id..'Spam:Texting'..msg.sender_user_id_,text) 
end
if veico then 
sendVoice(msg.chat_id_, msg.id_, 0, 1, nil, veico)   
bot_data:sadd(ban_id..'Spam:Texting'..msg.sender_user_id_,text) 
end
if video then 
sendVideo(msg.chat_id_, msg.id_, 0, 1, nil,video)
bot_data:sadd(ban_id..'Spam:Texting'..msg.sender_user_id_,text) 
end
if anemi then 
sendDocument(msg.chat_id_, msg.id_, 0, 1,nil, anemi)   
bot_data:sadd(ban_id..'Spam:Texting'..msg.sender_user_id_,text) 
end
if document then
sendDocument(msg.chat_id_, msg.id_, 0, 1,nil, document)   
bot_data:sadd(ban_id..'Spam:Texting'..msg.sender_user_id_,text) 
end  
if audio then
sendAudio(msg.chat_id_,msg.id_,audio)  
bot_data:sadd(ban_id..'Spam:Texting'..msg.sender_user_id_,text) 
end
if photo then
sendPhoto(msg.chat_id_, msg.id_, 0, 1, nil,photo,photo_caption)
bot_data:sadd(ban_id..'Spam:Texting'..msg.sender_user_id_,text) 
end  
end
end

-------------------------------
if msg.chat_id_ then
local id = tostring(msg.chat_id_)
if id:match("-100(%d+)") then
bot_data:incr(ban_id..'Msg_User'..msg.chat_id_..':'..msg.sender_user_id_) 
Chat_Type = 'GroupBot' 
elseif id:match("^(%d+)") then
bot_data:sadd(ban_id..'User_Bot',msg.sender_user_id_)  
Chat_Type = 'UserBot' 
else
Chat_Type = 'GroupBot' 
end
end
if bot_data:get(ban_id.."Bc:Grops:Pin" .. msg.chat_id_ .. ":" .. msg.sender_user_id_) then 
if text == "الغاء" or text == "الغاء ⌯︙" then   
send(msg.chat_id_, msg.id_," ⌯︙ تم الغاء الاذاعه")
bot_data:del(ban_id.."Bc:Grops:Pin" .. msg.chat_id_ .. ":" .. msg.sender_user_id_) 
return false
end 
local list = bot_data:smembers(ban_id.."Chek:Groups") 
if msg.content_.text_ then
for k,v in pairs(list) do 
send(v, 0,"["..msg.content_.text_.."]")  
bot_data:set(ban_id..'Msg:Pin:Chat'..v,msg.content_.text_) 
end
elseif msg.content_.photo_ then
if msg.content_.photo_.sizes_[0] then
photo = msg.content_.photo_.sizes_[0].photo_.persistent_id_
elseif msg.content_.photo_.sizes_[1] then
photo = msg.content_.photo_.sizes_[1].photo_.persistent_id_
end
for k,v in pairs(list) do 
sendPhoto(v, 0, photo,(msg.content_.caption_ or ""))
bot_data:set(ban_id..'Msg:Pin:Chat'..v,photo) 
end 
elseif msg.content_.animation_ then
for k,v in pairs(list) do 
sendDocument(v, 0, msg.content_.animation_.animation_.persistent_id_,(msg.content_.caption_ or "")) 
bot_data:set(ban_id..'Msg:Pin:Chat'..v,msg.content_.animation_.animation_.persistent_id_)
end 
elseif msg.content_.sticker_ then
for k,v in pairs(list) do 
sendSticker(v, 0, msg.content_.sticker_.sticker_.persistent_id_)   
bot_data:set(ban_id..'Msg:Pin:Chat'..v,msg.content_.sticker_.sticker_.persistent_id_) 
end 
end
send(msg.chat_id_, msg.id_," ⌯︙ تمت الاذاعه الى *~ "..#list.." ~* جروب ")
bot_data:del(ban_id.."Bc:Grops:Pin" .. msg.chat_id_ .. ":" .. msg.sender_user_id_) 
return false
end

------by-Boody--
if Chat_Type == 'UserBot' then
if text == '/start' or text == '「رجوع」' then 
if Devban(msg) then
if not msa3d(msg) then
local bl = '⌯︙انت الان المطور الثانوي في البوت \n⌯︙ سورس جولد\n ⌯︙يمكنك تحكم في البوتات من الكيبورد أسفل \n[تابع جديدنا](t.me/g_00_l_d)'
local keyboard = {
{'الاحصائيات'},
{'المطور','انتيمي'},
{'معلومات الكيبورد'},
{'「تواصل لسورس」','「اوامر اضف」'},
{'「اوامر التفعيل」','「اوامر الحمايه」'},
{'جلب المشتركين','جلب النسخه'},
{'جلب المطورين'},
{'تحديث السورس ','الاصدار'},
{'الغاء'},
}
send_inline_key(msg.chat_id_,bl,keyboard)
end
end
end
end
if text == "/start" then
if not msa3d(msg) then
if not Devban(msg) then
local Namebot = (bot_data:get(ban_id..'Name:Bot') or 'جولد') 
local KLAER_Msg = { 
' ـــــــــــــــــــــــــــــــــــــــــــــــ\n   🤖╖ أهلآ بك عزيزي أنا بوت  '..Namebot..'\n🌐╢ وظيفتي حماية المجموعات\n✅╢ لتفعيل البوت عليك اتباع مايلي \n⌯︙╢ أضِف البوت إلى مجموعتك\n⚡️╢ ارفعهُ » مشرف\n⬆️╜ سيتم ترقيتك مالك في البوت\nــــــــــــــــــــــــــــــــــــــــــــــــــــ ',
} 
Namebot = KLAER_Msg[math.random(#KLAER_Msg)] 
local msg_id = msg.id_/2097152/0.5  
keyboard = {} 
keyboard.inline_keyboard = {
{
{text = 'معلومات📚', callback_data="/change-hhh"},{text = 'السورس🌎', callback_data="/change-siusr"},
},
{
{text = 'الابراج🔮', callback_data="/zDRGd"},{text = 'الالعاب🎮', callback_data="/add"},
},
{
{text = '𝗗𝗲𝘃 𝗕𝗼𝘁 ➪.', url="http://t.me/"..sudos.UserName},
},
{
{text = 'اضغط لاضافه البوت لمجموعتك☑️' ,url="t.me/"..dofile("./Info.lua").botUserName.."?startgroup=start"},
},
}
local function getpro(extra, result, success) 
if result.photos_[0] then 
https.request("https://api.telegram.org/bot"..token..'/sendPhoto?chat_id=' .. msg.chat_id_ .. '&photo='..result.photos_[0].sizes_[1].photo_.persistent_id_..'&caption=' .. URL.escape(Namebot).."&photo="..msg_id.."&parse_mode=markdown&disable_web_page_preview=true&reply_markup="..JSON.encode(keyboard)) 
else 
send(msg.chat_id_, msg.id_,Namebot, 1, 'md') 
end 
end 
tdcli_function ({ ID = "GetUserProfilePhotos", user_id_ = ban_id, offset_ = 0, limit_ = 1 }, getpro, nil) 
end
end
end
--------------------------------------------------------------------------------------------------------------

if Chat_Type == 'UserBot' then
if text == '/start' or text == '「رجوع」' then  
if msa3d(msg) then
local bl = '⌯︙انت الان المطور الاساسي في البوت \n⌯︙ سورس جولد\n ⌯︙يمكنك تحكم في البوتات من الكيبورد أسفل \n[تابع جديدنا](t.me/g_00_l_d)'
local keyboard = {
{'ضع اسم للبوت','معلومات الكيبورد'},
{'المطور','الانتيمي'},
{'الاحصائيات'},
{'「تواصل لسورس」'},
{'「اوامر الاذاعه」','「اوامر اضف」'},
{'「اوامر التفعيل」','「اوامر الحمايه」'},
{'جلب المشتركين','جلب النسخه'},
{'جلب المطورين','جلب التوكن'},
{'تحديث السورس ','الاصدار'},
{'معلومات السيرفر'},
{'الغاء'},
}
send_inline_key(msg.chat_id_,bl,keyboard)
end
end

if not Devban(msg) and not bot_data:sismember(ban_id..'DRG:User_Bot',msg.sender_user_id_) and not bot_data:get(ban_id..'Tuasl:Bots') then
send(msg.sender_user_id_, msg.id_,'  ')
tdcli_function ({ID = "ForwardMessages", chat_id_ = SUDO,    from_chat_id_ = msg.sender_user_id_,    message_ids_ = {[0] = msg.id_},    disable_notification_ = 1,    from_background_ = 1 },function(arg,data) 
tdcli_function ({ID = "GetUser",user_id_ = msg.sender_user_id_},function(arg,ta) 
vardump(data)
if data and data.messages_[0].content_.sticker_ then
local Name = '['..string.sub(ta.first_name_,0, 40)..'](tg://user?id='..ta.id_..')'
local Text = ' ⌯︙تم ارسال الملصق من ↓\n - '..Name
sendText(SUDO,Text,0,'md')
end 
end,nil) 
end,nil)
end
if Devban(msg) and msg.reply_to_message_id_ ~= 0  then    
tdcli_function({ID = "GetMessage",chat_id_ = msg.chat_id_,message_id_ = tonumber(msg.reply_to_message_id_)},function(extra, result, success) 
if result.forward_info_.sender_user_id_ then     
id_user = result.forward_info_.sender_user_id_    
end     
tdcli_function ({ID = "GetUser",user_id_ = id_user},function(arg,data) 
if text == 'حظر' then
local Name = '['..string.sub(data.first_name_,0, 40)..'](tg://user?id='..id_user..')'
local Text = ' ⌯︙المستخدم ⋖ 「'..Name..'」\n ⌯︙تم حظره من التواصل'
sendText(SUDO,Text,msg.id_/2097152/0.5,'md')
bot_data:sadd(ban_id..'DRG:User_Bot',data.id_)  
return false  
end 
if text =='الغاء الحظر' then
local Name = '['..string.sub(data.first_name_,0, 40)..'](tg://user?id='..id_user..')'
local Text = ' ⌯︙المستخدم ⋖ 「'..Name..'」\n ⌯︙تم الغاء حظره من التواصل'
sendText(SUDO,Text,msg.id_/2097152/0.5,'md')
bot_data:srem(ban_id..'DRG:User_Bot',data.id_)  
return false  
end 

tdcli_function({ID='GetChat',chat_id_ = id_user},function(arg,dataq)
tdcli_function ({ ID = "SendChatAction",chat_id_ = id_user, action_ = {  ID = "SendMessageTypingAction", progress_ = 100} },function(arg,ta) 
if ta.code_ == 400 or ta.code_ == 5 then
local KLAER_Msg = '\n ⌯︙قام الشخص بحظر البوت'
send(msg.chat_id_, msg.id_,KLAER_Msg) 
return false  
end 
if text then    
send(id_user,msg.id_,text)    
local Name = '['..string.sub(data.first_name_,0, 40)..'](tg://user?id='..id_user..')'
local Text = ' ⌯︙المستخدم ⋖ 「'..Name..'」\n ⌯︙تم ارسال الرساله اليه'
sendText(SUDO,Text,msg.id_/2097152/0.5,'md')
return false
end    
if msg.content_.ID == 'MessageSticker' then    
sendSticker(id_user, msg.id_, 0, 1, nil, msg.content_.sticker_.sticker_.persistent_id_)   
local Name = '['..string.sub(data.first_name_,0, 40)..'](tg://user?id='..id_user..')'
local Text = ' ⌯︙المستخدم ⋖ 「'..Name..'」\n ⌯︙تم ارسال الرساله اليه'
sendText(SUDO,Text,msg.id_/2097152/0.5,'md')
return false
end      
if msg.content_.ID == 'MessagePhoto' then    
sendPhoto(id_user, msg.id_, 0, 1, nil,msg.content_.photo_.sizes_[0].photo_.persistent_id_,(msg.content_.caption_ or ''))    
local Name = '['..string.sub(data.first_name_,0, 40)..'](tg://user?id='..id_user..')'
local Text = ' ⌯︙المستخدم ⋖ 「'..Name..'」\n ⌯︙تم ارسال الرساله اليه'
sendText(SUDO,Text,msg.id_/2097152/0.5,'md')
return false
end     
if msg.content_.ID == 'MessageAnimation' then    
sendDocument(id_user, msg.id_, 0, 1,nil, msg.content_.animation_.animation_.persistent_id_)    
local Name = '['..string.sub(data.first_name_,0, 40)..'](tg://user?id='..id_user..')'
local Text = ' ⌯︙المستخدم ⋖ 「'..Name..'」\n ⌯︙تم ارسال الرساله اليه'
sendText(SUDO,Text,msg.id_/2097152/0.5,'md')
return false
end     
if msg.content_.ID == 'MessageVoice' then    
sendVoice(id_user, msg.id_, 0, 1, nil, msg.content_.Voice_.Voice_.persistent_id_)    
local Name = '['..string.sub(data.first_name_,0, 40)..'](tg://user?id='..id_user..')'
local Text = ' ⌯︙المستخدم ⋖ 「'..Name..'」\n ⌯︙تم ارسال الرساله اليه'
sendText(SUDO,Text,msg.id_/2097152/0.5,'md')
return false
end     
end,nil)
end,nil)
end,nil)
end,nil)
end 

if text == 'تفعيل التواصل ' and Devban(msg) then  
if bot_data:get(ban_id..'Tuasl:Bots') then
bot_data:del(ban_id..'Tuasl:Bots') 
Text = '\n ⌯︙ تم تفعيل التواصل ' 
else
Text = '\n ⌯︙ بالتاكيد تم تفعيل التواصل '
end
send(msg.chat_id_, msg.id_,Text) 
end
if text == 'تعطيل التواصل ' and Devban(msg) then  
if not bot_data:get(ban_id..'Tuasl:Bots') then
bot_data:set(ban_id..'Tuasl:Bots',true) 
Text = '\n ⌯︙ تم تعطيل التواصل' 
else
Text = '\n ⌯︙ بالتاكيد تم تعطيل التواصل'
end
send(msg.chat_id_, msg.id_,Text) 
end
if text == 'تفعيل البوت الخدمي ' and Devban(msg) then  
if bot_data:get(ban_id..'Free:Bots') then
bot_data:del(ban_id..'Free:Bots') 
Text = '\n ⌯︙ تم تفعيل البوت الخدمي ' 
else
Text = '\n ⌯︙ بالتاكيد تم تفعيل البوت الخدمي '
end
send(msg.chat_id_, msg.id_,Text) 
end
if text == 'تعطيل البوت الخدمي ' and Devban(msg) then  
if not bot_data:get(ban_id..'Free:Bots') then
bot_data:set(ban_id..'Free:Bots',true) 
Text = '\n ⌯︙ تم تعطيل البوت الخدمي' 
else
Text = '\n ⌯︙ بالتاكيد تم تعطيل البوت الخدمي'
end
send(msg.chat_id_, msg.id_,Text) 
end
if text and bot_data:get(ban_id..'Start:Bots') then
if text == 'الغاء' or text == 'الغاء' then   
send(msg.chat_id_, msg.id_,' ⌯︙ الغاء حفظ كليشه ستارت')
bot_data:del(ban_id..'Start:Bots') 
return false
end
bot_data:set(ban_id.."Start:Bot",text)  
send(msg.chat_id_, msg.id_,' ⌯︙ تم حفظ كليشه ستارت')
bot_data:del(ban_id..'Start:Bots') 
return false
end
if text == 'اضف رد استارت' and Devban(msg) then 
bot_data:set(ban_id..'Tuasl:Bots',true) 
send(msg.chat_id_, msg.id_,' ⌯︙ ارسل لي رد الان')
return false
end
if text == 'مسح رد استارت' and Devban(msg) then 
bot_data:del(ban_id..'Tuasl:Bots') 
send(msg.chat_id_, msg.id_,' ⌯︙ تم مسح رد استارت')
end
if text == 'ضع كليشه ستارت' and Devban(msg) then 
bot_data:set(ban_id..'Start:Bots',true) 
send(msg.chat_id_, msg.id_,' ⌯︙ ارسل لي الكليشه الان')
return false
end
if text == 'مسح كليشه ستارت' and Devban(msg) then 
bot_data:del(ban_id..'Start:Bot') 
send(msg.chat_id_, msg.id_,' ⌯︙ تم مسح كليشه ستارت')
end
if text == 'معلومات السيرفر' and msa3d(msg) then 
send(msg.chat_id_, msg.id_, io.popen([[
linux_version=`lsb_release -ds`
memUsedPrc=`free -m | awk 'NR==2{printf "%sMB/%sMB {%.2f%}\n", $3,$2,$3*100/$2 }'`
HardDisk=`df -lh | awk '{if ($6 == "/") { print $3"/"$2" ~ {"$5"}" }}'`
CPUPer=`top -b -n1 | grep "Cpu(s)" | awk '{print $2 + $4}'`
uptime=`uptime | awk -F'( |,|:)+' '{if ($7=="min") m=$6; else {if ($7~/^day/) {d=$6;h=$8;m=$9} else {h=$6;m=$7}}} {print d+0,"days,",h+0,"hours,",m+0,"minutes."}'`
echo '📟l •⊱ 「 نظام التشغيل 」 ⊰•\n* '"$linux_version"'*' 
echo '•━═━═━═「ɢᴏʟᴅ」═━═━═━•\n 🖨️l •⊱ 「 الذاكره العشوائيه 」  ⊰•\n「* '"$memUsedPrc"'*」'
echo '•━═━═━═「ɢᴏʟᴅ」═━═━═━•\n 💾l •⊱ 「 وحـده الـتـخـزيـن 」  ⊰•\n「* '"$HardDisk"'*」'
echo '•━═━═━═「ɢᴏʟᴅ」═━═━═━•\n 🖥️l •⊱ 「 موقـع الـسـيـرفـر 」 ⊰•\n「*»» '`curl http://th3boss.com/ip/location`'*」'
echo '•━═━═━═「ɢᴏʟᴅ」═━═━═━•\n 🕹️l •⊱ 「 الـمــعــالــج 」  ⊰•\n「* '"`grep -c processor /proc/cpuinfo`""Core ~ 「$CPUPer%」 "'*」'
echo '•━═━═━═「ɢᴏʟᴅ」═━═━═━•\n 👨🏾‍🔧l •⊱ 「 الــدخــول 」  ⊰•\n「* '`whoami`'*」'
echo '•━═━═━═「ɢᴏʟᴅ」═━═━═━•\n 🔌l •⊱ 「 مـده تـشغيـل الـسـيـرفـر 」 ⊰•\n「* '"$uptime"'*」'
]]):read('*all'))  
end
if text == 'تحديث السورس ' and DevSoFi(msg) then 
os.execute('rm -rf KLAER.lua')
os.execute('wget https://raw.githubusercontent.com/Zeby-kos/tigerahmed/main/KLAER.lua')
send(msg.chat_id_, msg.id_,'💞  تم تحديث السورس')
dofile('KLAER.lua')  
end
if text == 'جلب المشتركين' and Devban(msg) then 
local list = bot_data:smembers(ban_id..'User_Bot') 
local t = '{"users":['   
for k,v in pairs(list) do 
if k == 1 then 
t =  t..'"'..v..'"' 
else 
t =  t..',"'..v..'"' 
end 
end 
t = t..']}' 
local File = io.open('./users.json', "w") 
File:write(t) 
File:close() 
sendDocument(msg.chat_id_, msg.id_,0, 1, nil, './users.json', ' عدد المشتركين { '..#list..'}') 
end

if text == 'رفع المشتركين' and Devban(msg) then 
function by_reply(extra, result, success)    
if result.content_.document_ then  
local ID_FILE = result.content_.document_.document_.persistent_id_  
local File_Name = result.content_.document_.file_name_ 
local File = json:decode(https.request('https://api.telegram.org/bot'.. token..'/getfile?file_id='..ID_FILE) )  
download_to_file('https://api.telegram.org/file/bot'..token..'/'..File.result.file_path, ''..File_Name)  
local info_file = io.open('./users.json', "r"):read('*a') 
local users = JSON.decode(info_file) 
for k,v in pairs(users.users) do 
bot_data:sadd(ban_id..'User_Bot',v)  
end 
send(msg.chat_id_,msg.id_,'تم رفع المشتركين ') 
end    
end 
tdcli_function ({ ID = "GetMessage", chat_id_ = msg.chat_id_, message_id_ = tonumber(msg.reply_to_message_id_) }, by_reply, nil) 
end

if text == '「تواصل لسورس」' and Devban(msg) then 
local Text = 'قسم مطورين السورس لدخول الي حسابتهم'
local Key = {
{'⇣───「 قـناه المطورين」───⇣'},
{'قناة السورس','التواصل'},
{'「رجوع」'},
}
send_inline_key(msg.chat_id_,Text,Key)
end 
if text == '「اوامر اضف」' and Devban(msg) then 
local Text = 'قسم مسح واضف مثلا اضف رد عام مسح رد عام'
local Key = {
{'اضف رد عام','مسح رد عام'},
{'مسح رد استارت','اضف رد استارت'},
{'اضف رد متعدد','مسح رد متعدد'},
{'مسح الردود','مسح الردود المتعدده'},
{'مسح الثانوين'},
{'ضع كليشه ستارت','مسح كليشه ستارت'},
{'ضع قناة الاشتراك','مسح رساله الاشتراك'},
{'「رجوع」'},
}
send_inline_key(msg.chat_id_,Text,Key)
end 


if text == '「اوامر التفعيل」' and Devban(msg) then 
local Text = 'قسم التفعيل والتعطيل لتفعيل كل شئ في البوت'
local Key = {
{'تعطيل الاذاعه','تفعيل الاذاعه'},
{'تعطيل المغادره','تفعيل المغادره'},
{'تعطيل التواصل ','تفعيل التواصل '},
{'تعطيل النسخه التلقائيه','تفعيل النسخه التلقائيه'},
{'تفعيل الاشتراك الاجباري','تعطيل الاشتراك الاجباري'},
{'تفعيل البوت الخدمي ','تعطيل البوت الخدمي '},
{'「رجوع」'},
}
send_inline_key(msg.chat_id_,Text,Key)
end 
if text == '「اوامر الحمايه」' and Devban(msg) then 
local Text = 'قسم الحمايه يوجد في المطورين والثانوين والخ...'
local Key = {
{'قائمه الكتم العام','المطورين','قائمه العام'},
{'المشتركين','الجروبات ','الردود العامه'},
{'الثانوين','الردود المتعدده'},
{'تنظيف الجروبات ','تنظيف المشتركين'},
{'تغير رساله الاشتراك ','الاشتراك الاجباري','تغير الاشتراك'},
{'「رجوع」'},
}
send_inline_key(msg.chat_id_,Text,Key)
end 
if text == '「اوامر الاذاعه」' and Devban(msg) then 
local Text = 'قسم الاذاعات لعمل اذاعه في البوت'
local Key = {
{'اذاعه ','اذاعه خاص '},
{'اذاعه بالتثبيت '},
{'اذاعه بالتوجيه ','اذاعه بالتوجيه خاص '},
{'「رجوع」'},
}
send_inline_key(msg.chat_id_,Text,Key)
end 


if text == 'جلب المطورين' and Devban(msg) then  
local list = bot_data:smembers(ban_id..'Sudo:User') 
local t = '{"users":['   
for k,v in pairs(list) do 
if k == 1 then 
t =  t..'"'..v..'"' 
else 
t =  t..',"'..v..'"' 
end 
end 
t = t..']}' 
local File = io.open('./sudos3.json', "w") 
File:write(t) 
File:close() 
sendDocument(msg.chat_id_, msg.id_,0, 1, nil, './sudos3.json', ' عدد المطورين { '..#list..'}') 
end 
if text == 'رفع المطورين' and Devban(msg) then 
function by_reply(extra, result, success)    
if result.content_.document_ then  
local ID_FILE = result.content_.document_.document_.persistent_id_  
local File_Name = result.content_.document_.file_name_ 
local File = json:decode(https.request('https://api.telegram.org/bot'.. token..'/getfile?file_id='..ID_FILE) )  
download_to_file('https://api.telegram.org/file/bot'..token..'/'..File.result.file_path, ''..File_Name)  
local info_file = io.open('./sudos3.json', "r"):read('*a') 
local users = JSON.decode(info_file) 
for k,v in pairs(users.users) do 
bot_data:sadd(ban_id..'Sudo:User',v)  
end 
send(msg.chat_id_,msg.id_,'تم رفع المطورين ') 
end    
end 
tdcli_function ({ ID = "GetMessage", chat_id_ = msg.chat_id_, message_id_ = tonumber(msg.reply_to_message_id_) }, by_reply, nil) 
end
if text == 'الاصدار' and Devban(msg) then 
bot_data:del(ban_id..'Srt:Bot') 
send(msg.chat_id_, msg.id_,' ⌯︙ اصدار سورس جولد{ S:1✓}')
end
if text == '⇣───「 قـناه المطورين」───⇣' then
local Text = [[ 
قناه مطورين السورس 🍂
محتاج تنصب بوت حمايه ببلاش تواصل معانا✅
]]
keyboard = {}  
keyboard.inline_keyboard = { 
{{text = 'مطورين السورس⚙', url="t.me/Dv_Gold"}}, 
} 
local msg_id = msg.id_/2097152/0.5 
https.request("https://api.telegram.org/bot"..token..'/sendPhoto?chat_id=' .. msg.chat_id_ .. '&photo=https://t.me/aslak8/34&caption=' .. URL.escape(Text).."&reply_to_message_id="..msg_id.."&parse_mode=markdown&disable_web_page_preview=true&reply_markup="..JSON.encode(keyboard)) 
end


if text == 'معلومات الكيبورد' and Devban(msg) then
bot_data:del(ban_id..'Srt:Bot') 
local Text = [[ 
[CH](t.me/g_00_l_d)مرحبا بك مطوري سأشرح لك كل شئ في لوحه الاوامر بالتفصيل
1• الاحصائيات { لعرض عدد المجموعات، والمشتركين في البوت
 2• تفعيل التواصل{ لتفعيل التواصل عبر البوت خاص بك} 
 3• تعطيل التواصل{ لتعطيل التواصل عبر البوت خاص بك } 
 4• قائمه العام { لعرض المحظورين عام في البوت }
 5• المطورين { لعرض المطورين في بوتك }
8• اذاعه { ارسال رساله لجميع الجروبات في بوتك }
9• اذاعه خاص { ارسال رساله لجميع مشتركين بوتك!} 
10• تعطيل الاشتراك الاجباري { لتعطيل الاشتراك جباري خاص بوتك}
11• تفعيل الاشتراك الاجباري { لتفعيل الاشتراك الاجباري بوتك }
12•اذاعه بالتوجيه { ارسال رساله بالتوجيه الي جميع المجموعات }
13• اذاعه بالتوجيه خاص { ارسال رساله بالتوجيه الي جميع المشتركين }
14• تفعيل البوت الخدمي { يمكن هاذا امر ان منشئ الجروب يفعل البوت م̷ـــِْن دون حتياجه ل𝗗𝗲𝘃 𝗕𝗼𝘁
15• تعطيل البوت الخدمي { يمك هل خاصيه ان تفعيل البوت اله مطورين البوت فقط }
16• تنظيف المشتركين { يمكنك ازاله المشتركين الوهمين عبر هل امر }
17• تنظيف الجروبات { يمكن ازاله المجموعات الوهميه عبر عل امر }
18• جلب نسخه احتياطيه { لعرض ملف المجموعات بوتك }
19• تحديث السورس { لتحديث السورس خاص بوتك 
20• الغاء { للغاء الامر الذي طلبته }
]] 
keyboard = {}  
keyboard.inline_keyboard = { 
{{text = 'قناه السورس', url="t.me/g_00_l_d"}}, 
} 
local msg_id = msg.id_/2097152/0.5 
https.request("https://api.telegram.org/bot"..token..'/sendMessage?chat_id=' .. msg.chat_id_ .. '&text=' .. URL.escape(Text).."&reply_to_message_id="..msg_id.."&parse_mode=markdown&disable_web_page_preview=true&reply_markup="..JSON.encode(keyboard)) 
end
if text == "توكن البوت" and Developers(msg) or text == 'جلب التوكن' and Developers(msg) then 
if not SudoBot(msg) then
send(msg.chat_id_, msg.id_,'هذا الامر يخص المطور الاساسي فقط')
return false
end
local msg_id = msg.id_/2097152/0.5 
https.request("https://api.telegram.org/bot"..token..'/sendmessage?chat_id=' .. msg.sender_user_id_ .. '&text=' ..token) 
send(msg.chat_id_, msg.id_,' ') 
end
if text == 'قناه السورس' and Devban(msg) then
bot_data:del(ban_id..'Srt:Bot') 
local Text = [[ 
 ⌯︙ من أحسن السورسات على التليجرام سورس جولد ⌯︙
بجد سورس أمان جدا وفي مميزات جامده
تع نصب بوتك عندنا لو محظور
خش على تواصل هيدخلك لروم التواصل 
]] 
keyboard = {}  
keyboard.inline_keyboard = { 
{{text = '𝐓𝐞𝐚𝐦 𝐆𝐨𝐥𝐝', url="t.me/g_00_l_d"}}, 
} 
local msg_id = msg.id_/2097152/0.5 
https.request("https://api.telegram.org/bot"..token..'/sendPhoto?chat_id=' .. msg.chat_id_ .. '&photo=https://t.me/aslak8/43=' .. URL.escape(Text).."&photo="..msg_id.."&parse_mode=markdown&disable_web_page_preview=true&reply_markup="..JSON.encode(keyboard)) 
end

if text == "ضع اسم للبوت" and msa3d(msg) then  
bot_data:setex(ban_id..'Set:Name:Bot'..msg.sender_user_id_,300,true) 
send(msg.chat_id_, msg.id_," ⌯︙ ارسل اليه الاسم الان ")
return false
end
if text == ("الثانوين") and SudoBot(msg) then
local list = bot_data:smembers(ban_id.."Dev:ban:2")
t = "\n ⌯︙ قائمة مطورين الثانويين للبوت \n•━═━═━═「ɢᴏʟᴅ」═━═━═━•\n"
for k,v in pairs(list) do
local username = bot_data:get(ban_id.."user:Name" .. v)
if username then
t = t..""..k.."- ([@"..username.."])\n"
else
t = t..""..k.."- (`"..v.."`)\n"
end
end
if #list == 0 then
t = " ⌯︙ لا يوجد مطورين ثانويين"
end
send(msg.chat_id_, msg.id_, t)
end
if text == 'المشتركين' and msa3d(msg) then 
local Groups = bot_data:scard(ban_id..'Chek:Groups')  
local Users = bot_data:scard(ban_id..'User_Bot')  
Text = '\n ⌯︙ المشتركين ⋖{`'..Users..'`}'
send(msg.chat_id_, msg.id_,Text) 
return false
end
if text == 'الجروبات ' and msa3d(msg) then 
local Groups = bot_data:scard(ban_id..'Chek:Groups')  
local Users = bot_data:scard(ban_id..'User_Bot')  
Text = '\n ⌯︙ الجروبات ⋖{`'..Groups..'`}'
send(msg.chat_id_, msg.id_,Text) 
return false
end
if text == ("المطورين") and msa3d(msg) then
local list = bot_data:smembers(ban_id..'Sudo:User')
t = "\n ⌯︙ قائمة المطورين \n•━═━═━═「ɢᴏʟᴅ」═━═━═━•\n"
for k,v in pairs(list) do
local username = bot_data:get(ban_id.."user:Name" .. v)
if username then
t = t..""..k.."- ([@"..username.."])\n"
else
t = t..""..k.."- 「 '..v..' 」\n"
end
end
if #list == 0 then
t = " ⌯︙ لا يوجد مطورين"
end
send(msg.chat_id_, msg.id_, t)
end
if text == ("قائمه العام") and msa3d(msg) then
local list = bot_data:smembers(ban_id..'GDRG:User')
t = "\n ⌯︙ قائمه المحظورين عام \n•━═━═━═「ɢᴏʟᴅ」═━═━═━•\n"
for k,v in pairs(list) do
local username = bot_data:get(ban_id.."user:Name" .. v)
if username then
t = t..""..k.."- ([@"..username.."])\n"
else
t = t..""..k.."- 「 '..v..' 」\n"
end
end
if #list == 0 then
t = " ⌯︙ لا يوجد محظورين عام"
end
send(msg.chat_id_, msg.id_, t)
return false
end
if text == ("قائمه الكتم العام") and msa3d(msg) then
local list = bot_data:smembers(ban_id..'Gmute:User')
t = "\n ⌯︙ قائمة المكتومين عام \n•━═━═━═「ɢᴏʟᴅ」═━═━═━•\n"
for k,v in pairs(list) do
local username = bot_data:get(ban_id.."user:Name" .. v)
if username then
t = t..""..k.."- ([@"..username.."])\n"
else
t = t..""..k.."- 「 '..v..' 」\n"
end
end
if #list == 0 then
t = " ⌯︙ لا يوجد مكتومين عام"
end
send(msg.chat_id_, msg.id_, t)
return false
end
if text=="اذاعه خاص " and msg.reply_to_message_id_ == 0 and msa3d(msg) then 
bot_data:setex(ban_id.."Send:Bc:Pv" .. msg.chat_id_ .. ":" .. msg.sender_user_id_, 600, true) 
send(msg.chat_id_, msg.id_," ⌯︙ ارسل الان اذاعتك؟ \n ⌯︙ للخروج ارسل الغاء ")
return false
end 
if text=="اذاعه " and msg.reply_to_message_id_ == 0 and msa3d(msg) then 
bot_data:setex(ban_id.."Send:Bc:Grops" .. msg.chat_id_ .. ":" .. msg.sender_user_id_, 600, true) 
send(msg.chat_id_, msg.id_," ⌯︙ ارسل الان اذاعتك؟ \n ⌯︙ للخروج ارسل الغاء ")
return false
end  
if text=="اذاعه بالتوجيه " and msg.reply_to_message_id_ == 0  and msa3d(msg) then 
bot_data:setex(ban_id.."Send:Fwd:Grops" .. msg.chat_id_ .. ":" .. msg.sender_user_id_, 600, true) 
send(msg.chat_id_, msg.id_," ⌯︙ ارسل لي التوجيه الان")
return false
end 
if text=="اذاعه بالتوجيه خاص " and msg.reply_to_message_id_ == 0  and msa3d(msg) then 
bot_data:setex(ban_id.."Send:Fwd:Pv" .. msg.chat_id_ .. ":" .. msg.sender_user_id_, 600, true) 
send(msg.chat_id_, msg.id_," ⌯︙ ارسل لي التوجيه الان")
return false
end 
if text == 'جلب النسخه' and Devban(msg) then 
GetFile_Bot(msg)
end
if text == "تنظيف المشتركين " and msa3d(msg) then 
if AddChannel(msg.sender_user_id_) == false then
local textchuser = bot_data:get(ban_id..'text:ch:user')
if textchuser then
send(msg.chat_id_, msg.id_,'['..textchuser..']')
else
send(msg.chat_id_, msg.id_,'• اهلا بك عزيزي ⌯︙ •\n• لايمكنك استخدام البوت ⌯︙ •\n• عليك الاشتراك في القناة ⌯︙ •\n• اشترك اولا ['..bot_data:get(ban_id..'add:ch:username')..']')
end
return false
end
local pv = bot_data:smembers(ban_id.."User_Bot")
local sendok = 0
for i = 1, #pv do
tdcli_function({ID='GetChat',chat_id_ = pv[i]
},function(arg,dataq)
tdcli_function ({ ID = "SendChatAction",  
chat_id_ = pv[i], action_ = {  ID = "SendMessageTypingAction", progress_ = 100} 
},function(arg,data) 
if data.ID and data.ID == "Ok"  then
else
bot_data:srem(ban_id.."User_Bot",pv[i])
sendok = sendok + 1
end
if #pv == i then 
if sendok == 0 then
send(msg.chat_id_, msg.id_,' ⌯︙ لا يوجد مشتركين وهميين في البوت \n')   
else
local ok = #pv - sendok
send(msg.chat_id_, msg.id_,' ⌯︙ عدد المشتركين الان  ⋖ ( '..#pv..' )\n ⌯︙ تم ازالة  ⋖ ( '..sendok..' ) من المشتركين\n ⌯︙  الان عدد المشتركين الحقيقي  ⋖ ( '..ok..' ) مشترك \n')   
end
end
end,nil)
end,nil)
end
return false
end
if text == "تنظيف الجروبات " and SudoBot(msg) then 
if AddChannel(msg.sender_user_id_) == false then
local textchuser = bot_data:get(ban_id..'text:ch:user')
if textchuser then
send(msg.chat_id_, msg.id_,'['..textchuser..']')
else
send(msg.chat_id_, msg.id_,'• اهلا بك عزيزي ⌯︙ •\n• لايمكنك استخدام البوت ⌯︙ •\n• عليك الاشتراك في القناة ⌯︙ •\n• اشترك اولا ['..bot_data:get(ban_id..'add:ch:username')..']')
end
return false
end
local group = bot_data:smembers(ban_id..'Chek:Groups') 
local w = 0
local q = 0
for i = 1, #group do
tdcli_function({ID='GetChat',chat_id_ = group[i]
},function(arg,data)
if data and data.type_ and data.type_.channel_ and data.type_.channel_.status_ and data.type_.channel_.status_.ID == "ChatMemberStatusMember" then
bot_data:srem(ban_id..'Chek:Groups',group[i])  
tdcli_function ({ID = "ChangeChatMemberStatus",chat_id_=group[i],user_id_=ban_id,status_={ID = "ChatMemberStatusLeft"},},function(e,g) end, nil) 
w = w + 1
end
if data and data.type_ and data.type_.channel_ and data.type_.channel_.status_ and data.type_.channel_.status_.ID == "ChatMemberStatusLeft" then
bot_data:srem(ban_id..'Chek:Groups',group[i])  
q = q + 1
end
if data and data.type_ and data.type_.channel_ and data.type_.channel_.status_ and data.type_.channel_.status_.ID == "ChatMemberStatusKicked" then
bot_data:srem(ban_id..'Chek:Groups',group[i])  
q = q + 1
end
if data and data.code_ and data.code_ == 400 then
bot_data:srem(ban_id..'Chek:Groups',group[i])  
w = w + 1
end
if #group == i then 
if (w + q) == 0 then
send(msg.chat_id_, msg.id_,' ⌯︙ لا يوجد جروبات وهميه في البوت\n')   
else
local KLAER = (w + q)
local sendok = #group - KLAER
if q == 0 then
KLAER = ''
else
KLAER = '\n ⌯︙ تم ازالة  ⋖ 「 '..q..' 」 جروبات من البوت'
end
if w == 0 then
KLAERk = ''
else
KLAERk = '\n ⌯︙ تم ازالة  ⋖ 「 '..w..' 」 جروب لان البوت عضو'
end
send(msg.chat_id_, msg.id_,' ⌯︙  عدد الجروبات الان  ⋖ 「 '..#group..' 」'..KLAERk..''..KLAER..'\n ⌯︙  الان عدد الجروبات الحقيقي  ⋖ 「 '..sendok..' 」 جروبات\n')   
end
end
end,nil)
end
return false
end


if text and text:match("^رفع مطور @(.*)$") and msa3d(msg) then
local username = text:match("^رفع مطور @(.*)$")
if AddChannel(msg.sender_user_id_) == false then
local textchuser = bot_data:get(ban_id..'text:ch:user')
if textchuser then
send(msg.chat_id_, msg.id_,'['..textchuser..']')
else
send(msg.chat_id_, msg.id_,' ⌯︙ لا تستطيع استخدام البوت \n ⌯︙  يرجى الاشتراك بالقناه اولا \n ⌯︙  اشترك هنا ['..bot_data:get(ban_id..'add:ch:username')..']')
end
return false
end
function start_function(extra, result, success)
if result.id_ then
if (result and result.type_ and result.type_.ID == "ChannelChatInfo") then
send(msg.chat_id_,msg.id_," ⌯︙ عذرا عزيزي المستخدم هاذا معرف قناة يرجى استخدام الامر بصوره صحيحه !")
return false 
end      
bot_data:sadd(ban_id..'Sudo:User', result.id_)
usertext = '\n ⌯︙ الـعـضو   ⋖ ['..result.title_..'](t.me/'..(username or 'g_00_l_d')..')'
status  = '\n ⌯︙ تم ترقيته مطور'
texts = usertext..status
else
texts = ' ⌯︙ لا يوجد حساب بهاذا المعرف'
end
send(msg.chat_id_, msg.id_, texts)
end
tdcli_function ({ID = "SearchPublicChat",username_ = username}, start_function, nil)
return false 
end
if text and text:match("^رفع مطور (%d+)$") and msa3d(msg) then
local userid = text:match("^رفع مطور (%d+)$")
if AddChannel(msg.sender_user_id_) == false then
local textchuser = bot_data:get(ban_id..'text:ch:user')
if textchuser then
send(msg.chat_id_, msg.id_,'['..textchuser..']')
else
send(msg.chat_id_, msg.id_,' ⌯︙ لا تستطيع استخدام البوت \n ⌯︙  يرجى الاشتراك بالقناه اولا \n ⌯︙  اشترك هنا ['..bot_data:get(ban_id..'add:ch:username')..']')
end
return false
end
bot_data:sadd(ban_id..'Sudo:User', userid)
tdcli_function ({ID = "GetUser",user_id_ = userid},function(arg,data) 
if data.first_name_ then
usertext = '\n ⌯︙ الـعـضو   ⋖ ['..data.first_name_..'](t.me/'..(data.username_ or 'g_00_l_d')..')'
status  = '\n ⌯︙ تم ترقيته مطور'
send(msg.chat_id_, msg.id_, usertext..status)
else
usertext = '\n ⌯︙ الـعـضو   ⋖ '..userid..''
status  = '\n ⌯︙ تم ترقيته مطور'
send(msg.chat_id_, msg.id_, usertext..status)
end;end,nil)
return false 
end
if text and text:match("^تنزيل مطور @(.*)$") and msa3d(msg) then
local username = text:match("^تنزيل مطور @(.*)$")
if AddChannel(msg.sender_user_id_) == false then
local textchuser = bot_data:get(ban_id..'text:ch:user')
if textchuser then
send(msg.chat_id_, msg.id_,'['..textchuser..']')
else
send(msg.chat_id_, msg.id_,' ⌯︙ لا تستطيع استخدام البوت \n ⌯︙  يرجى الاشتراك بالقناه اولا \n ⌯︙  اشترك هنا ['..bot_data:get(ban_id..'add:ch:username')..']')
end
return false
end
function start_function(extra, result, success)
if result.id_ then
bot_data:srem(ban_id..'Sudo:User', result.id_)
usertext = '\n ⌯︙ الـعـضو   ⋖ ['..result.title_..'](t.me/'..(username or 'g_00_l_d')..')'
status  = '\n ⌯︙ تم تنزيله من المطورين'
texts = usertext..status
else
texts = ' ⌯︙ لا يوجد حساب بهاذا المعرف'
end
send(msg.chat_id_, msg.id_, texts)
end
tdcli_function ({ID = "SearchPublicChat",username_ = username}, start_function, nil)
return false
end  
if text and text:match("^تنزيل مطور (%d+)$") and msa3d(msg) then
local userid = text:match("^تنزيل مطور (%d+)$")
if AddChannel(msg.sender_user_id_) == false then
local textchuser = bot_data:get(ban_id..'text:ch:user')
if textchuser then
send(msg.chat_id_, msg.id_,'['..textchuser..']')
else
send(msg.chat_id_, msg.id_,' ⌯︙ لا تستطيع استخدام البوت \n ⌯︙  يرجى الاشتراك بالقناه اولا \n ⌯︙  اشترك هنا ['..bot_data:get(ban_id..'add:ch:username')..']')
end
return false
end
bot_data:srem(ban_id..'Sudo:User', userid)
tdcli_function ({ID = "GetUser",user_id_ = userid},function(arg,data) 
if data.first_name_ then
usertext = '\n ⌯︙ الـعـضو   ⋖ ['..data.first_name_..'](t.me/'..(data.username_ or 'g_00_l_d')..')'
status  = '\n ⌯︙ تم تنزيله من المطورين'
send(msg.chat_id_, msg.id_, usertext..status)
else
usertext = '\n ⌯︙ الـعـضو   ⋖ '..userid..''
status  = '\n ⌯︙ تم تنزيله من المطورين'
send(msg.chat_id_, msg.id_, usertext..status)
end;end,nil)
return false 
end

end
--------------------------------------------------------------------------------------------------------------
if text and not Special(msg) then  
local KLAER1_Msg = bot_data:get(ban_id.."KLAER1:Add:Filter:Rp2"..text..msg.chat_id_)   
if KLAER1_Msg then 
tdcli_function ({ID = "GetUser",user_id_ = msg.sender_user_id_},function(arg,data) 
send(msg.chat_id_, msg.id_,' ⌯︙ الـعـضو   ⋖ [「'..Rutba(msg.sender_user_id_,msg.chat_id_)..'」](T.ME/'..(data.username_ or 'g_00_l_d')..') \n ⌯︙ '..KLAER1_Msg)
DeleteMessage(msg.chat_id_, {[0] = msg.id_})     
return false
end,nil)
end
end
if bot_data:get(ban_id..'Set:Name:Bot'..msg.sender_user_id_) then 
if text == 'الغاء' or text == 'الغاء ' then   
send(msg.chat_id_, msg.id_," ⌯︙ تم الغاء حفظ اسم البوت")
bot_data:del(ban_id..'Set:Name:Bot'..msg.sender_user_id_) 
return false  
end 
bot_data:del(ban_id..'Set:Name:Bot'..msg.sender_user_id_) 
bot_data:set(ban_id..'Name:Bot',text) 
send(msg.chat_id_, msg.id_, " ⌯︙ تم حفظ الاسم")
return false
end 
if bot_data:get(ban_id.."Send:Bc:Pv" .. msg.chat_id_ .. ":" .. msg.sender_user_id_) then 
if text == 'الغاء' or text == 'الغاء ⌯︙' then   
send(msg.chat_id_, msg.id_," ⌯︙ تم الغاء الاذاعه للخاص")
bot_data:del(ban_id.."Send:Bc:Pv" .. msg.chat_id_ .. ":" .. msg.sender_user_id_) 
return false
end 
local list = bot_data:smembers(ban_id..'User_Bot') 
if msg.content_.text_ then
for k,v in pairs(list) do 
send(v, 0,'['..msg.content_.text_..']')  
end
elseif msg.content_.photo_ then
if msg.content_.photo_.sizes_[0] then
photo = msg.content_.photo_.sizes_[0].photo_.persistent_id_
elseif msg.content_.photo_.sizes_[1] then
photo = msg.content_.photo_.sizes_[1].photo_.persistent_id_
end
for k,v in pairs(list) do 
sendPhoto(v, 0, 0, 1, nil, photo,(msg.content_.caption_ or ''))
end 
elseif msg.content_.animation_ then
for k,v in pairs(list) do 
sendDocument(v, 0, 0, 1,nil, msg.content_.animation_.animation_.persistent_id_,(msg.content_.caption_ or ''))    
end 
elseif msg.content_.sticker_ then
for k,v in pairs(list) do 
sendSticker(v, 0, 0, 1, nil, msg.content_.sticker_.sticker_.persistent_id_)   
end 
end
send(msg.chat_id_, msg.id_," ⌯︙ تمت الاذاعه الى >>{"..#list.."} مشترك في البوت ")
bot_data:del(ban_id.."Send:Bc:Pv" .. msg.chat_id_ .. ":" .. msg.sender_user_id_) 
end
if bot_data:get(ban_id.."YYYBD_aza3h3" .. msg.chat_id_ .. ":" .. msg.sender_user_id_) then 
tdcli_function({ID="GetUser",user_id_=msg.sender_user_id_},function(extra,result,success)
local msa3d = bot_data:get(ban_id.."id:msa3d:ban")
if text == 'الغاء' or text == 'الغاء ⌯︙' then   
send(msg.chat_id_, msg.id_," ⌯︙ تم الغاء الرساله للمطور")
bot_data:del(ban_id.."YYYBD_aza3h3" .. msg.chat_id_ .. ":" .. msg.sender_user_id_) 
return false
end 
if text then
local textsudo = 'مرحبا عزيزي المطور الاساسي\n'..
'رساله من ['..result.first_name_..'](tg://user?id='..msg.sender_user_id_..')\n'..
'\n'..text
local textmsa3d = 'مرحبا عزيزي الانتيمي\n'..
'رساله من ['..result.first_name_..'](tg://user?id='..msg.sender_user_id_..')\n'..
'\n'..text
sendText(SUDO,textsudo,0,'md')
sendText(msa3d,textmsa3d,0,'md')
bot_data:del(ban_id.."YYYBD_aza3h3" .. msg.chat_id_ .. ":" .. msg.sender_user_id_) 
end
end,nil)
end
if bot_data:get(ban_id.."Send:Bc:Grops" .. msg.chat_id_ .. ":" .. msg.sender_user_id_) then 
if text == 'الغاء' or text == 'الغاء ⌯︙' then   
send(msg.chat_id_, msg.id_," ⌯︙ تم الغاء الاذاعه")
bot_data:del(ban_id.."Send:Bc:Grops" .. msg.chat_id_ .. ":" .. msg.sender_user_id_) 
return false
end 
local list = bot_data:smembers(ban_id..'Chek:Groups') 
if msg.content_.text_ then
for k,v in pairs(list) do 
send(v, 0,'['..msg.content_.text_..']')  
end
elseif msg.content_.photo_ then
if msg.content_.photo_.sizes_[0] then
photo = msg.content_.photo_.sizes_[0].photo_.persistent_id_
elseif msg.content_.photo_.sizes_[1] then
photo = msg.content_.photo_.sizes_[1].photo_.persistent_id_
end
for k,v in pairs(list) do 
sendPhoto(v, 0, 0, 1, nil, photo,(msg.content_.caption_ or ''))
end 
elseif msg.content_.animation_ then
for k,v in pairs(list) do 
sendDocument(v, 0, 0, 1,nil, msg.content_.animation_.animation_.persistent_id_,(msg.content_.caption_ or ''))    
end 
elseif msg.content_.sticker_ then
for k,v in pairs(list) do 
sendSticker(v, 0, 0, 1, nil, msg.content_.sticker_.sticker_.persistent_id_)   
end 
end
send(msg.chat_id_, msg.id_," ⌯︙ تمت الاذاعه الى >>{"..#list.."} جروب في البوت ")
bot_data:del(ban_id.."Send:Bc:Grops" .. msg.chat_id_ .. ":" .. msg.sender_user_id_) 
end

if bot_data:get(ban_id.."Send:Fwd:Grops" .. msg.chat_id_ .. ":" .. msg.sender_user_id_) then 
if text == 'الغاء' or text == 'الغاء ⌯︙' then   
send(msg.chat_id_, msg.id_," ⌯︙ تم الغاء الاذاعه")
bot_data:del(ban_id.."Send:Fwd:Grops" .. msg.chat_id_ .. ":" .. msg.sender_user_id_) 
return false  
end 
if msg.forward_info_ then 
local list = bot_data:smembers(ban_id..'Chek:Groups')   
for k,v in pairs(list) do  
tdcli_function({ID="ForwardMessages",
chat_id_ = v,
from_chat_id_ = msg.chat_id_,
message_ids_ = {[0] = msg.id_},
disable_notification_ = 0,
from_background_ = 1},function(a,t) end,nil) 
end   
send(msg.chat_id_, msg.id_," ⌯︙ تمت الاذاعه الى >>{"..#list.."} جروبات في البوت ")
bot_data:del(ban_id.."Send:Fwd:Grops" .. msg.chat_id_ .. ":" .. msg.sender_user_id_) 
end 
end
if bot_data:get(ban_id.."Send:Fwd:Pv" .. msg.chat_id_ .. ":" .. msg.sender_user_id_) then 
if text == 'الغاء' or text == 'الغاء ⌯︙' then   
send(msg.chat_id_, msg.id_," ⌯︙ تم الغاء الاذاعه")
bot_data:del(ban_id.."Send:Fwd:Pv" .. msg.chat_id_ .. ":" .. msg.sender_user_id_) 
return false  
end 
if msg.forward_info_ then 
local list = bot_data:smembers(ban_id..'User_Bot')   
for k,v in pairs(list) do  
tdcli_function({ID="ForwardMessages",
chat_id_ = v,
from_chat_id_ = msg.chat_id_,
message_ids_ = {[0] = msg.id_},
disable_notification_ = 0,
from_background_ = 1},function(a,t) end,nil) 
end   
send(msg.chat_id_, msg.id_," ⌯︙ تمت الاذاعه الى >>{"..#list.."} مشترك في البوت ")
bot_data:del(ban_id.."Send:Fwd:Pv" .. msg.chat_id_ .. ":" .. msg.sender_user_id_) 
end 
end
if bot_data:get(ban_id.."add:ch:jm" .. msg.chat_id_ .. "" .. msg.sender_user_id_) then 
if text and text:match("^الغاء$") then 
send(msg.chat_id_, msg.id_, " ⌯︙ تم الغاء الامر ")
bot_data:del(ban_id.."add:ch:jm" .. msg.chat_id_ .. "" .. msg.sender_user_id_)  
return false  end 
bot_data:del(ban_id.."add:ch:jm" .. msg.chat_id_ .. "" .. msg.sender_user_id_)  
local username = string.match(text, "@[%a%d_]+") 
tdcli_function ({    
ID = "SearchPublicChat",    
username_ = username  
},function(arg,data) 
if data and data.message_ and data.message_ == "USERNAME_NOT_OCCUPIED" then 
send(msg.chat_id_, msg.id_, ' ⌯︙ المعرف لا يوجد فيه قناة')
return false  end
if data and data.type_ and data.type_.ID and data.type_.ID == 'PrivateChatInfo' then
send(msg.chat_id_, msg.id_, ' ⌯︙ عذا لا يمكنك وضع معرف حسابات في الاشتراك ')
return false  end
if data and data.type_ and data.type_.channel_ and data.type_.channel_.is_supergroup_ == true then
send(msg.chat_id_, msg.id_,' ⌯︙ عذا لا يمكنك وضع معرف جروب بالاشتراك ')
return false  end
if data and data.type_ and data.type_.channel_ and data.type_.channel_.is_supergroup_ == false then
if data and data.type_ and data.type_.channel_ and data.type_.channel_.ID and data.type_.channel_.status_.ID == 'ChatMemberStatusEditor' then
send(msg.chat_id_, msg.id_,' ⌯︙ البوت ادمن في القناة \n ⌯︙ تم تفعيل الاشتراك الاجباري في \n ⌯︙ ايدي القناة ('..data.id_..')\n ⌯︙ معرف القناة ([@'..data.type_.channel_.username_..'])')
bot_data:set(ban_id..'add:ch:id',data.id_)
bot_data:set(ban_id..'add:ch:username','@'..data.type_.channel_.username_)
else
send(msg.chat_id_, msg.id_,' ⌯︙ عذرآ البوت ليس ادمن بالقناه ')
end
return false  
end
end,nil)
end
if bot_data:get(ban_id.."textch:user" .. msg.chat_id_ .. "" .. msg.sender_user_id_) then 
if text and text:match("^الغاء$") then 
send(msg.chat_id_, msg.id_, " ⌯︙ تم الغاء الامر ")
bot_data:del(ban_id.."textch:user" .. msg.chat_id_ .. "" .. msg.sender_user_id_)  
return false  end 
bot_data:del(ban_id.."textch:user" .. msg.chat_id_ .. "" .. msg.sender_user_id_)  
local texxt = string.match(text, "(.*)") 
bot_data:set(ban_id..'text:ch:user',texxt)
send(msg.chat_id_, msg.id_,' ⌯︙ تم تغيير رسالة الاشتراك ')
end

if text == 'تفعيل' and Sudo(msg) then
if AddChannel(msg.sender_user_id_) == false then
local textchuser = bot_data :get(ban_id ..'text:ch:user')
if textchuser then
send(msg.chat_id_, msg.id_,'['..textchuser..']')
else
send(msg.chat_id_, msg.id_,' ⌯︙  لا تستطيع استخدام البوت \n  ⌯︙  يرجى الاشتراك بالقناه اولا \n  ⌯︙  اشترك هنا ['..bot_data :get(ban_id ..'add:ch:username')..']')
end
return false
end
if msg.can_be_deleted_ == false then 
send(msg.chat_id_, msg.id_,' ⌯︙  عذرا يرجى ترقيه البوت مشرف !')
return false  
end
tdcli_function ({ ID = "GetChannelFull", channel_id_ = getChatId(msg.chat_id_).ID }, function(arg,data)  
if tonumber(data.member_count_) < tonumber(bot_data :get(ban_id ..'Num:Add:Bot') or 0) and not DevSoFi(msg) then
send(msg.chat_id_, msg.id_,' ⌯︙  عدد اعضاء الجروب قليله يرجى جمع >> {'..(bot_data :get(ban_id ..'Num:Add:Bot') or 0)..'} عضو')
return false
end
tdcli_function ({ID = "GetUser",user_id_ = msg.sender_user_id_},function(extra,result,success)
tdcli_function({ID ="GetChat",chat_id_=msg.chat_id_},function(arg,chat)  
if bot_data :sismember(ban_id ..'Chek:Groups',msg.chat_id_) then
send(msg.chat_id_, msg.id_,' ⌯︙ الـجـروب مـفعـل مـن قبـل')
else
sendText(msg.chat_id_,'\n ⌯︙ مـن قبـل ↭ ['..string.sub(result.first_name_,0, 70)..'](tg://user?id='..result.id_..')\n ⌯︙تـم تـشغـيل الـبوت فـي الـجـروب  {'..chat.title_..'}',msg.id_/2097152/0.5,'md')
bot_data :sadd(ban_id ..'Chek:Groups',msg.chat_id_)
local Name = '['..result.first_name_..'](tg://user?id='..result.id_..')'
local NameChat = chat.title_
local IdChat = msg.chat_id_
local NumMember = data.member_count_
local linkgpp = json:decode(https.request('https://api.telegram.org/bot'..token..'/exportChatInviteLink?chat_id='..msg.chat_id_))
if linkgpp.ok == true then 
LinkGp = linkgpp.result
else
LinkGp = 'لا يوجد'
end
Text = '\n ⌯︙ تـم تـشغـيل الـبوت فـي الـجـروب جـديد'..
'\n ⌯︙بواسطة {「'..Name..'」}'..
'\n ⌯︙ايدي الجروب {'..IdChat..'}'..
'\n ⌯︙اسم الجروب {['..NameChat..']}'..
'\n ⌯︙الرابط {['..LinkGp..']}'
sendText(SUDO,Text,0,'md')
end
end,nil) 
end,nil) 
end,nil)
end
if text == 'تعطيل' and Sudo(msg) then
if AddChannel(msg.sender_user_id_) == false then
local textchuser = bot_data :get(ban_id ..'text:ch:user')
if textchuser then
send(msg.chat_id_, msg.id_,'['..textchuser..']')
else
send(msg.chat_id_, msg.id_,' ⌯︙  لا تستطيع استخدام البوت \n  ⌯︙  يرجى الاشتراك بالقناه اولا \n  ⌯︙  اشترك هنا ['..bot_data :get(ban_id ..'add:ch:username')..']')
end
return false
end
tdcli_function ({ID = "GetUser",user_id_ = msg.sender_user_id_},function(extra,result,success)
tdcli_function({ID ="GetChat",chat_id_=msg.chat_id_},function(arg,chat)  
if not bot_data :sismember(ban_id ..'Chek:Groups',msg.chat_id_) then
send(msg.chat_id_, msg.id_,' ⌯︙ الـبوت مـعطـل مـن قبـل')
else
sendText(msg.chat_id_,'\n ⌯︙ مـن قبـل ↭ ['..string.sub(result.first_name_,0, 70)..'](tg://user?id='..result.id_..')\n ⌯︙ تـم تـعـطيل الـبوت   {'..chat.title_..'}',msg.id_/2097152/0.5,'md')
bot_data :srem(ban_id ..'Chek:Groups',msg.chat_id_)  
local Name = '['..result.first_name_..'](tg://user?id='..result.id_..')'
local NameChat = chat.title_
local IdChat = msg.chat_id_
local AddPy = var
local linkgpp = json:decode(https.request('https://api.telegram.org/bot'..token..'/exportChatInviteLink?chat_id='..msg.chat_id_))
if linkgpp.ok == true then 
LinkGp = linkgpp.result
else
LinkGp = 'لا يوجد'
end
Text = '\n تـم تـعـطيل الـبوت مـن الـجـروب ⌯︙'..
'\n ⌯︙بواسطة {「'..Name..'」}'..
'\n ⌯︙ايدي الجروب {'..IdChat..'}'..
'\n ⌯︙اسم الجروب {['..NameChat..']}'..
'\n ⌯︙الرابط {['..LinkGp..']}'
sendText(SUDO,Text,0,'md')
end
end,nil) 
end,nil) 
end
if text == 'تفعيل' and not Sudo(msg) and not bot_data :get(ban_id ..'Free:Bots') then
if AddChannel(msg.sender_user_id_) == false then
local textchuser = bot_data :get(ban_id ..'text:ch:user')
if textchuser then
send(msg.chat_id_, msg.id_,'['..textchuser..']')
else
send(msg.chat_id_, msg.id_,' ⌯︙  لا تستطيع استخدام البوت \n  ⌯︙  يرجى الاشتراك بالقناه اولا \n  ⌯︙  اشترك هنا ['..bot_data :get(ban_id ..'add:ch:username')..']')
end
return false
end
if msg.can_be_deleted_ == false then 
send(msg.chat_id_, msg.id_,' ⌯︙  عذرا يرجى ترقيه البوت مشرف !')
return false  
end
tdcli_function ({ ID = "GetChannelFull", channel_id_ = getChatId(msg.chat_id_).ID }, function(arg,data)  
if tonumber(data.member_count_) < tonumber(bot_data :get(ban_id ..'Num:Add:Bot') or 0) and not DevSoFi(msg) then
send(msg.chat_id_, msg.id_,' ⌯︙  عدد اعضاء الجروب قليله يرجى جمع >> {'..(bot_data :get(ban_id ..'Num:Add:Bot') or 0)..'} عضو')
return false
end
tdcli_function ({ID = "GetUser",user_id_ = msg.sender_user_id_},function(extra,result,success)
tdcli_function({ID ="GetChat",chat_id_=msg.chat_id_},function(arg,chat)  
tdcli_function ({ID = "GetChatMember",chat_id_ = msg.chat_id_,user_id_ = msg.sender_user_id_},function(arg,da) 
if da and da.status_.ID == "ChatMemberStatusEditor" or da and da.status_.ID == "ChatMemberStatusCreator" then
if da and da.user_id_ == msg.sender_user_id_ then
if da.status_.ID == "ChatMemberStatusCreator" then
var = 'المالك'
elseif da.status_.ID == "ChatMemberStatusEditor" then
var = 'مشرف'
end
if bot_data :sismember(ban_id ..'Chek:Groups',msg.chat_id_) then
send(msg.chat_id_, msg.id_,' ⌯︙ الـجـروب مـفعـل مـن قبـل')
else
sendText(msg.chat_id_,'\n ⌯︙ مـن قبـل ↭ ['..string.sub(result.first_name_,0, 70)..'](tg://user?id='..result.id_..')\n ⌯︙تـم تـشغـيل الـبوت فـي الـجـروب  {'..chat.title_..'}',msg.id_/2097152/0.5,'md')
bot_data :sadd(ban_id ..'Chek:Groups',msg.chat_id_)  
bot_data :sadd(ban_id ..'CoSu'..msg.chat_id_, msg.sender_user_id_)
local Name = '['..result.first_name_..'](tg://user?id='..result.id_..')'
local NumMember = data.member_count_
local NameChat = chat.title_
local IdChat = msg.chat_id_
local AddPy = var
local linkgpp = json:decode(https.request('https://api.telegram.org/bot'..token..'/exportChatInviteLink?chat_id='..msg.chat_id_))
if linkgpp.ok == true then 
LinkGp = linkgpp.result
else
LinkGp = 'لا يوجد'
end
Text = '\n ⌯︙ تـم تـشغـيل الـبوت فـي الـجـروب جـديد'..
'\n ⌯︙بواسطة {「'..Name..'」}'..
'\n ⌯︙ايدي الجروب {'..IdChat..'}'..
'\n ⌯︙اسم الجروب {['..NameChat..']}'..
'\n ⌯︙الرابط {['..LinkGp..']}'
sendText(SUDO,Text,0,'md')
end
end
end
end,nil)   
end,nil) 
end,nil) 
end,nil)
end


if text ==("تفعيل") and Sudo(msg) then
tdcli_function ({ID = "GetChannelMembers",channel_id_ = msg.chat_id_:gsub("-100",""),filter_ = {ID = "ChannelMembersAdministrators"},offset_ = 0,limit_ = 100},function(arg,data) 
local num2 = 0
local admins = data.members_
for i=0 , #admins do
if data.members_[i].bot_info_ == false and data.members_[i].status_.ID == "ChatMemberStatusEditor" then
bot_data:sadd(ban_id.."Mod:User"..msg.chat_id_, admins[i].user_id_)
num2 = num2 + 1
tdcli_function ({ID = "GetUser",user_id_ = admins[i].user_id_},function(arg,b) 
if b.username_ == true then
end
if b.first_name_ == false then
bot_data:srem(ban_id.."Mod:User"..msg.chat_id_, admins[i].user_id_)
end
end,nil)   
else
bot_data:srem(ban_id.."Mod:User"..msg.chat_id_, admins[i].user_id_)
end
end
if num2 == 0 then
send(msg.chat_id_, msg.id_," ") 
else
send(msg.chat_id_, msg.id_,"⌯︙ تمت ترقيه ❮ "..num2.." ❯ من الادمنيه") 
end
end,nil)   
end
if text and text:match("^ضع عدد الاعضاء (%d+)$") and Devban(msg) then
local Num = text:match("ضع عدد الاعضاء (%d+)$") 
if AddChannel(msg.sender_user_id_) == false then
local textchuser = bot_data:get(ban_id..'text:ch:user')
if textchuser then
send(msg.chat_id_, msg.id_,'['..textchuser..']')
else
send(msg.chat_id_, msg.id_,' ⌯︙ لا تستطيع استخدام البوت \n ⌯︙  يرجى الاشتراك بالقناه اولا \n ⌯︙  اشترك هنا ['..bot_data:get(ban_id..'add:ch:username')..']')
end
return false
end
bot_data:set(ban_id..'Num:Add:Bot',Num) 
send(msg.chat_id_, msg.id_,' ⌯︙ تم تعيين عدد الاعضاء سيتم تفعيل الجروبات التي اعضائها اكثر من  >> {'..Num..'} عضو')
end
if text and text:match("^المطور$") or text and text:match("^مطور$") or text and text:match("^الدعم$") then
tdcli_function ({ID = "GetUser",user_id_ = msg.sender_user_id_},function(extra,result,success)
tdcli_function({ID ="GetChat",chat_id_=msg.chat_id_},function(arg,dp) 
local Name1 = result.first_name_
local Name1 = Name1:gsub('"',"") 
local Name1 = Name1:gsub("'","") 
local Name1 = Name1:gsub("`","") 
local Name1 = Name1:gsub("*","") 
local Name1 = Name1:gsub("{","") 
local Name1 = Name1:gsub("}","") 
local Name = '['..Name1..'](tg://user?id='..result.id_..')'
local NameChat = dp.title_
local NameChat = NameChat:gsub('"',"") 
local NameChat = NameChat:gsub("'","") 
local NameChat = NameChat:gsub("`","") 
local NameChat = NameChat:gsub("*","") 
local NameChat = NameChat:gsub("{","") 
local NameChat = NameChat:gsub("}","") 
local LinkGp = json:decode(https.request('https://api.telegram.org/bot'..token..'/exportChatInviteLink?chat_id='..msg.chat_id_))
if LinkGp.ok == true then 
LinkGroup = LinkGp.result
else
LinkGroup = 'لا يوجد'
end
sendText(SUDO,"⌯︙هناك من بحاجه الى انتيميه \n⌯︙الشخص  {"..Name.."}\n⌯︙اسم الجروب {"..NameChat.."}\n⌯︙ايدي الجروب {`"..msg.chat_id_.."`}\n⌯︙رابط الجروب \n ["..LinkGroup.."] ",0,'md')
end,nil)
end,nil)
end
if text and text:match("^احمد$") or text and text:match("^احمد المصري$") or text and text:match("^مبرمج السورس$") then
tdcli_function ({ID = "GetUser",user_id_ = msg.sender_user_id_},function(extra,result,success)
tdcli_function({ID ="GetChat",chat_id_=msg.chat_id_},function(arg,dp) 
local Name1 = result.first_name_
local Name1 = Name1:gsub('"',"") 
local Name1 = Name1:gsub("'","") 
local Name1 = Name1:gsub("`","") 
local Name1 = Name1:gsub("*","") 
local Name1 = Name1:gsub("{","") 
local Name1 = Name1:gsub("}","") 
local Name = '['..Name1..'](tg://user?id='..result.id_..')'
local NameChat = dp.title_
local NameChat = NameChat:gsub('"',"") 
local NameChat = NameChat:gsub("'","") 
local NameChat = NameChat:gsub("`","") 
local NameChat = NameChat:gsub("*","") 
local NameChat = NameChat:gsub("{","") 
local NameChat = NameChat:gsub("}","") 
local LinkGp = json:decode(https.request('https://api.telegram.org/bot'..token..'/exportChatInviteLink?chat_id='..msg.chat_id_))
if LinkGp.ok == true then 
LinkGroup = LinkGp.result
else
LinkGroup = 'لا يوجد'
end
sendText(1751768178,"●. هناك شخص يريدك يا سيدي  المبرمج احمد المصري \n●الشخص  {"..Name.."}\n●اسم الجروب {"..NameChat.."}\n●ايدي الجروب {`"..msg.chat_id_.."`}\n●رابط الجروب \n ["..LinkGroup.."] ",0,'md')
end,nil)
end,nil)
end
if text == 'احمد المصري' or text == 'احمد' or text == 'مبرمج السورس' then
local id = '1751768178'
local urrl = https.request('https://api.telegram.org/bot'..tokenget..'/getchat?chat_id='..id)
local json = JSON.decode(urrl)
local name = json.result.first_name
local user = json.result.username
local bio = json.result.bio
keyboard = {} 
keyboard.inline_keyboard = {{{text = name,url="t.me/"..user}},}
local msg_id = msg.id_/2097152/0.5
https.request("https://api.telegram.org/bot"..token..'/sendPhoto?chat_id=' .. msg.chat_id_ .. '&photo=https://t.me/'..user..'&caption=' .. URL.escape(bio).."&reply_to_message_id="..msg_id.."&disable_web_page_preview=true&reply_markup="..JSON.encode(keyboard)) 
end
if text and text:match("^تايجر$") or text and text:match("^مالك السورس$") or text and text:match("^رامي$") then
tdcli_function ({ID = "GetUser",user_id_ = msg.sender_user_id_},function(extra,result,success)
tdcli_function({ID ="GetChat",chat_id_=msg.chat_id_},function(arg,dp) 
local Name1 = result.first_name_
local Name1 = Name1:gsub('"',"") 
local Name1 = Name1:gsub("'","") 
local Name1 = Name1:gsub("`","") 
local Name1 = Name1:gsub("*","") 
local Name1 = Name1:gsub("{","") 
local Name1 = Name1:gsub("}","") 
local Name = '['..Name1..'](tg://user?id='..result.id_..')'
local NameChat = dp.title_
local NameChat = NameChat:gsub('"',"") 
local NameChat = NameChat:gsub("'","") 
local NameChat = NameChat:gsub("`","") 
local NameChat = NameChat:gsub("*","") 
local NameChat = NameChat:gsub("{","") 
local NameChat = NameChat:gsub("}","") 
local LinkGp = json:decode(https.request('https://api.telegram.org/bot'..token..'/exportChatInviteLink?chat_id='..msg.chat_id_))
if LinkGp.ok == true then 
LinkGroup = LinkGp.result
else
LinkGroup = 'لا يوجد'
end
sendText(1903411846,"●. هناك شخص يريدك يا سيدي  تايجر التيلي \n●الشخص  {"..Name.."}\n●اسم الجروب {"..NameChat.."}\n●ايدي الجروب {`"..msg.chat_id_.."`}\n●رابط الجروب \n ["..LinkGroup.."] ",0,'md')
end,nil)
end,nil)
end
if text == 'تايجر' or text == 'مالك السورس' or text == 'رامي' then
local id = '1304868679'
local urrl = https.request('https://api.telegram.org/bot'..tokenget..'/getchat?chat_id='..id)
local json = JSON.decode(urrl)
local name = json.result.first_name
local user = json.result.username
local bio = json.result.bio
keyboard = {} 
keyboard.inline_keyboard = {{{text = name,url="t.me/"..user}},}
local msg_id = msg.id_/2097152/0.5
https.request("https://api.telegram.org/bot"..token..'/sendPhoto?chat_id=' .. msg.chat_id_ .. '&photo=https://t.me/'..user..'&caption=' .. URL.escape(bio).."&reply_to_message_id="..msg_id.."&disable_web_page_preview=true&reply_markup="..JSON.encode(keyboard)) 
end
if text and text:match("^جافا$") or text and text:match("^مبرمج السورس2$") or text and text:match("^java$") then
tdcli_function ({ID = "GetUser",user_id_ = msg.sender_user_id_},function(extra,result,success)
tdcli_function({ID ="GetChat",chat_id_=msg.chat_id_},function(arg,dp) 
local Name1 = result.first_name_
local Name1 = Name1:gsub('"',"") 
local Name1 = Name1:gsub("'","") 
local Name1 = Name1:gsub("`","") 
local Name1 = Name1:gsub("*","") 
local Name1 = Name1:gsub("{","") 
local Name1 = Name1:gsub("}","") 
local Name = '['..Name1..'](tg://user?id='..result.id_..')'
local NameChat = dp.title_
local NameChat = NameChat:gsub('"',"") 
local NameChat = NameChat:gsub("'","") 
local NameChat = NameChat:gsub("`","") 
local NameChat = NameChat:gsub("*","") 
local NameChat = NameChat:gsub("{","") 
local NameChat = NameChat:gsub("}","") 
local LinkGp = json:decode(https.request('https://api.telegram.org/bot'..token..'/exportChatInviteLink?chat_id='..msg.chat_id_))
if LinkGp.ok == true then 
LinkGroup = LinkGp.result
else
LinkGroup = 'لا يوجد'
end
sendText(1614314857,"●. هناك شخص يريدك يا سيدي  المبرمج جافا  \n●الشخص  {"..Name.."}\n●اسم الجروب {"..NameChat.."}\n●ايدي الجروب {`"..msg.chat_id_.."`}\n●رابط الجروب \n ["..LinkGroup.."] ",0,'md')
end,nil)
end,nil)
end
if text == 'جافا' or text == 'مبرمج السورس2' or text == 'java' then
local id = '1614314857'
local urrl = https.request('https://api.telegram.org/bot'..tokenget..'/getchat?chat_id='..id)
local json = JSON.decode(urrl)
local name = json.result.first_name
local user = json.result.username
local bio = json.result.bio
keyboard = {} 
keyboard.inline_keyboard = {{{text = name,url="t.me/"..user}},}
local msg_id = msg.id_/2097152/0.5
https.request("https://api.telegram.org/bot"..token..'/sendPhoto?chat_id=' .. msg.chat_id_ .. '&photo=https://t.me/'..user..'&caption=' .. URL.escape(bio).."&reply_to_message_id="..msg_id.."&disable_web_page_preview=true&reply_markup="..JSON.encode(keyboard)) 
end
if text and text:match("^عبدو$") or text and text:match("^عبدالله$") or text and text:match("^مطور السورس$") then
tdcli_function ({ID = "GetUser",user_id_ = msg.sender_user_id_},function(extra,result,success)
tdcli_function({ID ="GetChat",chat_id_=msg.chat_id_},function(arg,dp) 
local Name1 = result.first_name_
local Name1 = Name1:gsub('"',"") 
local Name1 = Name1:gsub("'","") 
local Name1 = Name1:gsub("`","") 
local Name1 = Name1:gsub("*","") 
local Name1 = Name1:gsub("{","") 
local Name1 = Name1:gsub("}","") 
local Name = '['..Name1..'](tg://user?id='..result.id_..')'
local NameChat = dp.title_
local NameChat = NameChat:gsub('"',"") 
local NameChat = NameChat:gsub("'","") 
local NameChat = NameChat:gsub("`","") 
local NameChat = NameChat:gsub("*","") 
local NameChat = NameChat:gsub("{","") 
local NameChat = NameChat:gsub("}","") 
local LinkGp = json:decode(https.request('https://api.telegram.org/bot'..token..'/exportChatInviteLink?chat_id='..msg.chat_id_))
if LinkGp.ok == true then 
LinkGroup = LinkGp.result
else
LinkGroup = 'لا يوجد'
end
sendText(1304868679,"●. هناك شخص يريدك يا سيدي  مطور السورس \n●الشخص  {"..Name.."}\n●اسم الجروب {"..NameChat.."}\n●ايدي الجروب {`"..msg.chat_id_.."`}\n●رابط الجروب \n ["..LinkGroup.."] ",0,'md')
end,nil)
end,nil)
end
if text == 'عبدالله' or text == 'عبدو' or text == 'مطور السورس' then
local id = '1304868679'
local urrl = https.request('https://api.telegram.org/bot'..tokenget..'/getchat?chat_id='..id)
local json = JSON.decode(urrl)
local name = json.result.first_name
local user = json.result.username
local bio = json.result.bio
keyboard = {} 
keyboard.inline_keyboard = {{{text = name,url="t.me/"..user}},}
local msg_id = msg.id_/2097152/0.5
https.request("https://api.telegram.org/bot"..token..'/sendPhoto?chat_id=' .. msg.chat_id_ .. '&photo=https://t.me/'..user..'&caption=' .. URL.escape(bio).."&reply_to_message_id="..msg_id.."&disable_web_page_preview=true&reply_markup="..JSON.encode(keyboard)) 
end

local status_welcome = bot_data:get(ban_id..'Chek:Welcome'..msg.chat_id_)
if status_welcome and not bot_data:get(ban_id..'lock:tagservr'..msg.chat_id_) then
if msg.content_.ID == "MessageChatJoinByLink" then
tdcli_function({ID = "GetUser",user_id_=msg.sender_user_id_},function(extra,result) 
local GetWelcomeGroup = bot_data:get(ban_id..'Get:Welcome:Group'..msg.chat_id_)  
if GetWelcomeGroup then 
t = GetWelcomeGroup
else  
t = '\n• نورت حبي \n•  name \n• user' 
end 
t = t:gsub('name',result.first_name_) 
t = t:gsub('user',('@'..result.username_ or 'لا يوجد')) 
send(msg.chat_id_, msg.id_,'['..t..']')
end,nil) 
end 
end 
if msg.content_.ID == "MessageChatAddMembers" then 
if msg.content_.members_[0].id_ == tonumber(ban_id) then 
print("it is Bot")
N = (bot_data:get(ban_id.."Name:Bot") or "جولد")
tdcli_function ({ID = "GetUser",user_id_ = ban_id,},function(arg,data) 
tdcli_function ({ID = "GetUserProfilePhotos",user_id_ = ban_id,offset_ = 0,limit_ = 1},function(extra,result,success) 
if result.photos_[0] then
keyboard = {} 
keyboard.inline_keyboard = {
{
{text = '𝗗𝗲𝘃 𝗕𝗼𝘁 ➪.', url="http://t.me/"..sudos.UserName},
},
{
{text = 'اضغط لاضافه البوت لمجموعتك✅ ', url = "https://t.me/"..data.username_.."?startgroup=new"},
},
}
local msg_id = msg.id_/2097152/0.5
local Texti = "🤖╖ أهلآ بك عزيزي أنا بوت  "..N.." 🌐╢ وظيفتي حماية المجموعات\n✅╢ لتفعيل البوت عليك اتباع مايلي \n⌯︙╢ أضِف البوت إلى مجموعتك\n⚡️╢ ارفعهُ » مشرف\n⬆️╜ سيتم ترقيتك مالك في البوت"
https.request("https://api.telegram.org/bot"..token..'/sendPhoto?chat_id='..msg.chat_id_..'&caption='..URL.escape(Texti)..'&photo='..result.photos_[0].sizes_[1].photo_.persistent_id_..'&reply_to_message_id='..msg_id..'&disable_web_page_preview=true&reply_markup='..JSON.encode(keyboard)) 
end
end,nil)
end,nil)
end
end
if msg.content_.ID == "MessageChatJoinByLink" then
local Text =' '
keyboard = {} 
keyboard.inline_keyboard = {
{{text = 'اضف البوت في مجموعتك ✅' ,url="t.me/"..dofile("./Info.lua").botUserName.."?startgroup=start"}},
}
local msg_id = msg.id_/2097152/0.5
https.request("https://api.telegram.org/bot"..token..'/sendsticker?chat_id=' .. msg.chat_id_ .. '&sticker=https://t.me/aslak8/52&caption=' .. URL.escape(Text).."&reply_to_message_id="..msg_id.."&parse_mode=markdown&disable_web_page_preview=true&reply_markup="..JSON.encode(keyboard)) 
end  
--------------------------------------------------------------------------------------------------------------
if msg.content_.photo_ then  
if bot_data:get(ban_id..'Change:Chat:Photo'..msg.chat_id_..':'..msg.sender_user_id_) then 
if msg.content_.photo_.sizes_[3] then  
photo_id = msg.content_.photo_.sizes_[3].photo_.persistent_id_ 
else 
photo_id = msg.content_.photo_.sizes_[0].photo_.persistent_id_ 
end 
tdcli_function ({ID = "ChangeChatPhoto",chat_id_ = msg.chat_id_,photo_ = getInputFile(photo_id) }, function(arg,data)   
if data.code_ == 3 then
send(msg.chat_id_, msg.id_,' ⌯︙ عذرآ البوت ليس ادمن بالقناه ')
bot_data:del(ban_id..'Change:Chat:Photo'..msg.chat_id_..':'..msg.sender_user_id_) 
return false  end
if data.message_ == "CHAT_ADMIN_REQUIRED" then 
send(msg.chat_id_, msg.id_,' ⌯︙ … عذرآ البوت لايملك صلاحيات')
bot_data:del(ban_id..'Change:Chat:Photo'..msg.chat_id_..':'..msg.sender_user_id_) 
else
send(msg.chat_id_, msg.id_,' ⌯︙ تم تغيير صورة الجروب')
end
end, nil) 
bot_data:del(ban_id..'Change:Chat:Photo'..msg.chat_id_..':'..msg.sender_user_id_) 
end   
end
--------------------------------------------------------------------------------------------------------------
if bot_data:get(ban_id.."Set:Description" .. msg.chat_id_ .. "" .. msg.sender_user_id_) then  
if text == 'الغاء' then 
send(msg.chat_id_, msg.id_," ⌯︙ تم الغاء وضع الوصف")
bot_data:del(ban_id.."Set:Description" .. msg.chat_id_ .. "" .. msg.sender_user_id_)
return false  
end 
bot_data:del(ban_id.."Set:Description" .. msg.chat_id_ .. "" .. msg.sender_user_id_)   
https.request('https://api.telegram.org/bot'..token..'/setChatDescription?chat_id='..msg.chat_id_..'&description='..text) 
send(msg.chat_id_, msg.id_,' ⌯︙ تم تغيير وصف الجروب')
return false  
end 
--------------------------------------------------------------------------------------------------------------
if bot_data:get(ban_id.."Welcome:Group" .. msg.chat_id_ .. "" .. msg.sender_user_id_) then 
if text == 'الغاء' then 
send(msg.chat_id_, msg.id_," ⌯︙ تم الغاء حفظ الترحيب")
bot_data:del(ban_id.."Welcome:Group" .. msg.chat_id_ .. "" .. msg.sender_user_id_)  
return false  
end 
bot_data:del(ban_id.."Welcome:Group" .. msg.chat_id_ .. "" .. msg.sender_user_id_)  
bot_data:set(ban_id..'Get:Welcome:Group'..msg.chat_id_,text) 
send(msg.chat_id_, msg.id_,' ⌯︙ تم حفظ ترحيب الجروب')
return false   
end
--------------------------------------------------------------------------------------------------------------
if bot_data:get(ban_id.."Set:Priovate:Group:Link"..msg.chat_id_..""..msg.sender_user_id_) then
if text == 'الغاء' then
send(msg.chat_id_,msg.id_," ⌯︙ تم الغاء حفظ الرابط")
bot_data:del(ban_id.."Set:Priovate:Group:Link"..msg.chat_id_..""..msg.sender_user_id_) 
return false
end
if text and text:match("(https://telegram.me/joinchat/%S+)") or text and text:match("(https://t.me/joinchat/%S+)") then     
local Link = text:match("(https://telegram.me/joinchat/%S+)") or text and text:match("(https://t.me/joinchat/%S+)")   
bot_data:set(ban_id.."Private:Group:Link"..msg.chat_id_,Link)
send(msg.chat_id_,msg.id_," ⌯︙ تم حفظ الرابط بنجاح")
bot_data:del(ban_id.."Set:Priovate:Group:Link"..msg.chat_id_..""..msg.sender_user_id_) 
return false 
end
end 
--------------------------------------------------------------------------------------------------------------
if KLAER_Msg and not Special(msg) then  
local KLAER_Msg = bot_data:get(ban_id.."Add:Filter:Rp2"..text..msg.chat_id_)   
if KLAER_Msg then    
tdcli_function ({ID = "GetUser",user_id_ = msg.sender_user_id_},function(arg,data) 
if data.username_ ~= false then
send(msg.chat_id_,0," ⌯︙ الـعـضو  : {["..data.first_name_.."](T.ME/"..data.username_..")}\n ⌯︙ ["..KLAER_Msg.."] \n")
else
send(msg.chat_id_,0," ⌯︙ الـعـضو  : {["..data.first_name_.."](T.ME/g_00_l_d)}\n ⌯︙ ["..KLAER_Msg.."] \n")
end
end,nil)   
DeleteMessage(msg.chat_id_, {[0] = msg.id_})     
return false
end
end
--------------------------------------------------------------------------------------------------------------
if not Special(msg) and msg.content_.ID ~= "MessageChatAddMembers" and bot_data:hget(ban_id.."flooding:settings:"..msg.chat_id_,"flood") then 
floods = bot_data:hget(ban_id.."flooding:settings:"..msg.chat_id_,"flood") or 'nil'
NUM_MSG_MAX = bot_data:hget(ban_id.."flooding:settings:"..msg.chat_id_,"floodmax") or 5
TIME_CHECK = bot_data:hget(ban_id.."flooding:settings:"..msg.chat_id_,"floodtime") or 5
local post_count = tonumber(bot_data:get(ban_id..'floodc:「'..msg.sender_user_id_..'」:'..msg.chat_id_) or 0)
if post_count > tonumber(bot_data:hget(ban_id.."flooding:settings:"..msg.chat_id_,"floodmax") or 5) then 
local ch = msg.chat_id_
local type = bot_data:hget(ban_id.."flooding:settings:"..msg.chat_id_,"flood") 
trigger_anti_spam(msg,type)  
end
bot_data:setex(ban_id..'floodc:「'..msg.sender_user_id_..'」:'..msg.chat_id_, tonumber(bot_data:hget(ban_id.."flooding:settings:"..msg.chat_id_,"floodtime") or 3), post_count+1) 
local edit_id = data.text_ or 'nil'  
NUM_MSG_MAX = 5
if bot_data:hget(ban_id.."flooding:settings:"..msg.chat_id_,"floodmax") then
NUM_MSG_MAX = bot_data:hget(ban_id.."flooding:settings:"..msg.chat_id_,"floodmax") 
end
if bot_data:hget(ban_id.."flooding:settings:"..msg.chat_id_,"floodtime") then
TIME_CHECK = bot_data:hget(ban_id.."flooding:settings:"..msg.chat_id_,"floodtime") 
end 
end 
--------------------------------------------------------------------------------------------------------------
if text and bot_data:get(ban_id..'lock:Fshar'..msg.chat_id_) and not Special(msg) then 
list = {"كس","كسمك","كسختك","عير","كسخالتك","خرا بالله","عير بالله","كسخواتكم","كحاب","مناويج","مناويج","كحبه","ابن الكحبه","فرخ","فروخ","طيزك","طيزختك"}
for k,v in pairs(list) do
print(string.find(text,v))
if string.find(text,v) ~= nil then
DeleteMessage(msg.chat_id_,{[0] = msg.id_}) 
return false
end
end
end
if text and bot_data:get(ban_id..'lock:Fars'..msg.chat_id_) and not Special(msg) then 
list = {"ڄ","گ","که","پی","خسته","برم","راحتی","بیام","بپوشم","گرمه","چه","چ","ڬ","ٺ","چ","ڇ","ڿ","ڀ","ڎ","ݫ","ژ","ڟ","ݜ","ڸ","پ","۴","زدن","دخترا","دیوث","مک","زدن", "خالی بند","عزیزم خوبی","سلامت باشی","میخوام","سلام","خوببی","ميدم","کی اومدی","خوابیدین"}
for k,v in pairs(list) do
if string.find(text,v) ~= nil then
DeleteMessage(msg.chat_id_,{[0] = msg.id_}) 
return false
end
end
end
if text and bot_data:get(ban_id..'lock:Engilsh'..msg.chat_id_) and not Special(msg) then 
list = {'a','u','y','l','t','b','A','Q','U','J','K','L','B','D','L','V','Z','k','n','c','r','q','o','z','I','j','m','M','w','d','h','e'}
for k,v in pairs(list) do
if string.find(text,v) ~= nil then
DeleteMessage(msg.chat_id_,{[0] = msg.id_}) 
return false
end
end
end
if text and bot_data:get(ban_id..'lock:Fshar'..msg.chat_id_) and not Special(msg) then 
list = {"كس","كسمك","كسختك","عير","كسخالتك","خرا بالله","عير بالله","كسخواتكم","كحاب","مناويج","مناويج","كحبه","ابن الكحبه","فرخ","فروخ","طيزك","طيزختك","كسمك","يا ابن الخول","المتناك","شرموط","شرموطه","ابن الشرموطه","ابن الخول","ابن العرص","منايك","متناك","احا","ابن المتناكه","زبك","عرص","زبي","خول","لبوه","لباوي","ابن اللبوه","منيوك","كسمكك","متناكه","احو","احي","يا عرص","يا خول","قحبه","القحبه","شراميط","العلق","العلوق","العلقه","كسمك","يا ابن الخول","المتناك","شرموط","شرموطه","ابن الشرموطه","ابن الخول","االمنيوك","كسمككك","الشرموطه","ابن العرث","ابن الحيضانه","زبك","خول","زبي","قاحب"}
for k,v in pairs(list) do
print(string.find(text,v))
if string.find(text,v) ~= nil then
DeleteMessage(msg.chat_id_,{[0] = msg.id_}) 
return false
end
end
end
if text and bot_data:get(ban_id..'lock:Fars'..msg.chat_id_) and not Special(msg) then 
list = {"ڄ","گ","که","پی","خسته","برم","راحتی","بیام","بپوشم","گرمه","چه","چ","ڬ","ٺ","چ","ڇ","ڿ","ڀ","ڎ","ݫ","ژ","ڟ","ݜ","ڸ","پ","۴","زدن","دخترا","دیوث","مک","زدن"}
for k,v in pairs(list) do
if string.find(text,v) ~= nil then
DeleteMessage(msg.chat_id_,{[0] = msg.id_}) 
return false
end
end
end
if text and bot_data:get(ban_id..'lock:Azag'..msg.chat_id_) and not Special(msg) then 
list = {"كس","كسمك","كسختك","عير","كسخالتك","خرا بالله","عير بالله","كسخواتكم","كحاب","مناويج","مناويج","كحبه","ابن الكحبه","فرخ","فروخ","طيزك","طيزختك","كسمك","يا ابن الخول","المتناك","شرموط","شرموطه","ابن الشرموطه","ابن الخول","ابن العرص","منايك","متناك","احا","ابن المتناكه","زبك","عرص","زبي","خول","لبوه","لباوي","ابن اللبوه","منيوك","كسمكك","متناكه","احو","احي","يا عرص","يا خول","قحبه","القحبه","شراميط","العلق","العلوق","العلقه","كسمك","يا ابن الخول","المتناك","شرموط","شرموطه","ابن الشرموطه","ابن الخول","االمنيوك","كسمككك","الشرموطه","ابن العرث","ابن الحيضانه","زبك","خول","زبي","قاحب"}
for k,v in pairs(list) do
print(string.find(text,v))
if string.find(text,v) ~= nil then
DeleteMessage(msg.chat_id_,{[0] = msg.id_}) 
return false
end
end
end
if text and bot_data:get(ban_id..'lock:Azag'..msg.chat_id_) and not Special(msg) then 
list = {"ڄ","گ","که","پی","خسته","برم","راحتی","بیام","بپوشم","گرمه","چه","چ","ڬ","ٺ","چ","ڇ","ڿ","ڀ","ڎ","ݫ","ژ","ڟ","ݜ","ڸ","پ","۴","زدن","دخترا","دیوث","مک","زدن"}
for k,v in pairs(list) do
if string.find(text,v) ~= nil then
DeleteMessage(msg.chat_id_,{[0] = msg.id_}) 
return false
end
end
end
if text and bot_data:get(ban_id..'lock:Azag'..msg.chat_id_) and not Special(msg) then 
list = {"ڄ","گ","که","پی","خسته","برم","راحتی","بیام","بپوشم","گرمه","چه","چ","ڬ","ٺ","چ","ڇ","ڿ","ڀ","ڎ","ݫ","ژ","ڟ","ݜ","ڸ","پ","۴","زدن","دخترا","دیوث","مک","زدن","اصل","پ","پی","لطفا","سکوت","نیومدم","گم","كس","كحبه","تبادل","جهات","سني","شيعي","ياسعودي","ياعراكي","كسمك"}
for k,v in pairs(list) do
print(string.find(text,v))
if string.find(text,v) ~= nil then
DeleteMessage(msg.chat_id_,{[0] = msg.id_}) 
return false
end
end
end
if text and bot_data:get(ban_id..'lock:mahn'..msg.chat_id_) and not Special(msg) then 
list = {"بحبك","مح","مواح","متيجي","ينوحي","يتي","متجيب مح","يا روحي","قلبي","بيف"}
for k,v in pairs(list) do
print(string.find(text,v))
if string.find(text,v) ~= nil then
DeleteMessage(msg.chat_id_,{[0] = msg.id_}) 
return false
end
end
end
if text and bot_data:get(ban_id..'lock:Azag'..msg.chat_id_) and not Special(msg) then 
list = {"ربج","خرب دينك","خرب دينج","عير بربك","جهات","كس ربك","رب الكواد","كسم ربك","خرب دينك","خرب دينج","عير بربك","سكسي","كس ربك","خرب الله","صوج الله","خرب محمد","الله الكواد","صوج الله","كسخت الله","ربك"}
for k,v in pairs(list) do
print(string.find(text,v))
if string.find(text,v) ~= nil then
DeleteMessage(msg.chat_id_,{[0] = msg.id_}) 
return false
end
end
end
if text and bot_data:get(ban_id..'lock:Azag'..msg.chat_id_) and not Special(msg) then 
list = {"زيج","عفطه","نيجه","مصه","لحسه","العبي","ابن التنيج","ارد اتنايج","خره بالعراق","انعل رب العراق","كسربك","كسج","كسي","تنيج","69","عير","كيري","مبعوص","كسختك","بعبصتكم","موشريفه","ابن","صرم","اختك","خالتك","امك","رب الكواد","xnxx","كس","كسمك","كسختك","عير","كسخالتك","خرا بالله","عير بالله","كسخواتكم","كحاب","مناويج","مناويج","كحبه","ابن الكحبه","فرخ","فروخ","طيزك","طيزختك"}
for k,v in pairs(list) do
print(string.find(text,v))
if string.find(text,v) ~= nil then
DeleteMessage(msg.chat_id_,{[0] = msg.id_}) 
return false
end
end
end
if text and bot_data:get(ban_id..'lock:Azag'..msg.chat_id_) and not Special(msg) then 
list = {"يا عبد","يا سعودي","يا عراقي","يا عراكي","يا سوري","يا اسلام مافيا","يا اردني","يا مصري","يا خليجي","يا محتل","يا مشرد","يا فقير","يبن فقيره","يا مهان","يا ابيض","يا نظيف","يعبد","يسعودي","يعراقي","يعاركي","يمصري","يردني","يمشرد","يفقير","ياسلام مافيا","يابيض","يا هطف","يبن هبله","يحمار","ياهبل","يخليجي"}
for k,v in pairs(list) do
print(string.find(text,v))
if string.find(text,v) ~= nil then
DeleteMessage(msg.chat_id_,{[0] = msg.id_}) 
return false
end
end
end
--------------------------------------------------------------------------------------------------------------
if bot_data:get(ban_id..'lock:text'..msg.chat_id_) and not Special(msg) then       
DeleteMessage(msg.chat_id_,{[0] = msg.id_})   
return false     
end     
--------------------------------------------------------------------------------------------------------------
if msg.content_.ID == "MessageChatAddMembers" then 
bot_data:incr(ban_id..'Add:Contact'..msg.chat_id_..':'..msg.sender_user_id_) 
end
if msg.content_.ID == "MessageChatAddMembers" and not Special(msg) then   
if bot_data:get(ban_id.."lock:AddMempar"..msg.chat_id_) == 'kick' then
local mem_id = msg.content_.members_  
for i=0,#mem_id do  
chat_kick(msg.chat_id_,mem_id[i].id_)
end
end
end
--------------------------------------------------------------------------------------------------------------
if msg.content_.ID == "MessageChatJoinByLink" and not Special(msg) then 
if bot_data:get(ban_id.."lock:Join"..msg.chat_id_) == 'kick' then
chat_kick(msg.chat_id_,msg.sender_user_id_)
return false  
end
end
--------------------------------------------------------------------------------------------------------------
if msg.content_.caption_ then 
if msg.content_.caption_:match("@[%a%d_]+") or msg.content_.caption_:match("@(.+)") then  
if bot_data:get(ban_id.."lock:user:name"..msg.chat_id_) == "del" and not Special(msg) then    
DeleteMessage(msg.chat_id_,{[0] = msg.id_}) 
elseif bot_data:get(ban_id.."lock:user:name"..msg.chat_id_) == "ked" and not Special(msg) then    
ked(msg.chat_id_,msg.sender_user_id_)
DeleteMessage(msg.chat_id_,{[0] = msg.id_}) 
elseif bot_data:get(ban_id.."lock:user:name"..msg.chat_id_) == "kick" and not Special(msg) then    
chat_kick(msg.chat_id_,msg.sender_user_id_)
DeleteMessage(msg.chat_id_,{[0] = msg.id_}) 
elseif bot_data:get(ban_id.."lock:user:name"..msg.chat_id_) == "ktm" and not Special(msg) then    
bot_data:sadd(ban_id..'Muted:User'..msg.chat_id_,msg.sender_user_id_)
DeleteMessage(msg.chat_id_,{[0] = msg.id_}) 
end
end
end
--------------------------------------------------------------------------------------------------------------
if text and text:match("@[%a%d_]+") or text and text:match("@(.+)") then    
if bot_data:get(ban_id.."lock:user:name"..msg.chat_id_) == "del" and not Special(msg) then    
DeleteMessage(msg.chat_id_,{[0] = msg.id_}) 
elseif bot_data:get(ban_id.."lock:user:name"..msg.chat_id_) == "ked" and not Special(msg) then    
ked(msg.chat_id_,msg.sender_user_id_)
DeleteMessage(msg.chat_id_,{[0] = msg.id_}) 
elseif bot_data:get(ban_id.."lock:user:name"..msg.chat_id_) == "kick" and not Special(msg) then    
chat_kick(msg.chat_id_,msg.sender_user_id_)
DeleteMessage(msg.chat_id_,{[0] = msg.id_}) 
elseif bot_data:get(ban_id.."lock:user:name"..msg.chat_id_) == "ktm" and not Special(msg) then    
bot_data:sadd(ban_id..'Muted:User'..msg.chat_id_,msg.sender_user_id_)
DeleteMessage(msg.chat_id_,{[0] = msg.id_}) 
end
end
--------------------------------------------------------------------------------------------------------------
if msg.content_.caption_ then 
if msg.content_.caption_:match("#[%a%d_]+") or msg.content_.caption_:match("#(.+)") then 
if bot_data:get(ban_id.."lock:hashtak"..msg.chat_id_) == "del" and not Special(msg) then    
DeleteMessage(msg.chat_id_,{[0] = msg.id_}) 
elseif bot_data:get(ban_id.."lock:hashtak"..msg.chat_id_) == "ked" and not Special(msg) then    
ked(msg.chat_id_,msg.sender_user_id_)
DeleteMessage(msg.chat_id_,{[0] = msg.id_}) 
elseif bot_data:get(ban_id.."lock:hashtak"..msg.chat_id_) == "kick" and not Special(msg) then    
chat_kick(msg.chat_id_,msg.sender_user_id_)
DeleteMessage(msg.chat_id_,{[0] = msg.id_}) 
elseif bot_data:get(ban_id.."lock:hashtak"..msg.chat_id_) == "ktm" and not Special(msg) then    
bot_data:sadd(ban_id..'Muted:User'..msg.chat_id_,msg.sender_user_id_)
DeleteMessage(msg.chat_id_,{[0] = msg.id_}) 
end
end
end
--------------------------------------------------------------------------------------------------------------
if text and text:match("#[%a%d_]+") or text and text:match("#(.+)") then
if bot_data:get(ban_id.."lock:hashtak"..msg.chat_id_) == "del" and not Special(msg) then    
DeleteMessage(msg.chat_id_,{[0] = msg.id_}) 
elseif bot_data:get(ban_id.."lock:hashtak"..msg.chat_id_) == "ked" and not Special(msg) then    
ked(msg.chat_id_,msg.sender_user_id_)
DeleteMessage(msg.chat_id_,{[0] = msg.id_}) 
elseif bot_data:get(ban_id.."lock:hashtak"..msg.chat_id_) == "kick" and not Special(msg) then    
chat_kick(msg.chat_id_,msg.sender_user_id_)
DeleteMessage(msg.chat_id_,{[0] = msg.id_}) 
elseif bot_data:get(ban_id.."lock:hashtak"..msg.chat_id_) == "ktm" and not Special(msg) then    
bot_data:sadd(ban_id..'Muted:User'..msg.chat_id_,msg.sender_user_id_)
DeleteMessage(msg.chat_id_,{[0] = msg.id_}) 
end
end
--------------------------------------------------------------------------------------------------------------
if msg.content_.caption_ then 
if msg.content_.caption_:match("/[%a%d_]+") or msg.content_.caption_:match("/(.+)") then  
if bot_data:get(ban_id.."lock:Cmd"..msg.chat_id_) == "del" and not Special(msg) then    
DeleteMessage(msg.chat_id_,{[0] = msg.id_}) 
elseif bot_data:get(ban_id.."lock:Cmd"..msg.chat_id_) == "ked" and not Special(msg) then    
ked(msg.chat_id_,msg.sender_user_id_)
DeleteMessage(msg.chat_id_,{[0] = msg.id_}) 
elseif bot_data:get(ban_id.."lock:Cmd"..msg.chat_id_) == "kick" and not Special(msg) then    
chat_kick(msg.chat_id_,msg.sender_user_id_)
DeleteMessage(msg.chat_id_,{[0] = msg.id_}) 
elseif bot_data:get(ban_id.."lock:Cmd"..msg.chat_id_) == "ktm" and not Special(msg) then    
bot_data:sadd(ban_id..'Muted:User'..msg.chat_id_,msg.sender_user_id_)
DeleteMessage(msg.chat_id_,{[0] = msg.id_}) 
end
end
end
--------------------------------------------------------------------------------------------------------------
if text and text:match("/[%a%d_]+") or text and text:match("/(.+)") then
if bot_data:get(ban_id.."lock:Cmd"..msg.chat_id_) == "del" and not Special(msg) then    
DeleteMessage(msg.chat_id_,{[0] = msg.id_}) 
elseif bot_data:get(ban_id.."lock:Cmd"..msg.chat_id_) == "ked" and not Special(msg) then    
ked(msg.chat_id_,msg.sender_user_id_)
DeleteMessage(msg.chat_id_,{[0] = msg.id_}) 
elseif bot_data:get(ban_id.."lock:Cmd"..msg.chat_id_) == "kick" and not Special(msg) then    
chat_kick(msg.chat_id_,msg.sender_user_id_)
DeleteMessage(msg.chat_id_,{[0] = msg.id_}) 
elseif bot_data:get(ban_id.."lock:Cmd"..msg.chat_id_) == "ktm" and not Special(msg) then    
bot_data:sadd(ban_id..'Muted:User'..msg.chat_id_,msg.sender_user_id_)
DeleteMessage(msg.chat_id_,{[0] = msg.id_}) 
end
end
--------------------------------------------------------------------------------------------------------------
if msg.content_.caption_ then 
if not Special(msg) then 
if msg.content_.caption_:match("[Tt][Ee][Ll][Ee][Gg][Rr][Aa][Mm].[Mm][Ee]/") or msg.content_.caption_:match("[Hh][Tt][Tt][Pp][Ss]://") or msg.content_.caption_:match("[Hh][Tt][Tt][Pp]://") or msg.content_.caption_:match("[Ww][Ww][Ww].") or msg.content_.caption_:match(".[Cc][Oo][Mm]") or msg.content_.caption_:match("[Tt][Ee][Ll][Ee][Gg][Rr][Aa][Mm].[Dd][Oo][Gg]/") or msg.content_.caption_:match(".[Pp][Ee]") or msg.content_.caption_:match("[Tt][Ll][Gg][Rr][Mm].[Mm][Ee]/") or msg.content_.caption_:match("[Jj][Oo][Ii][Nn][Cc][Hh][Aa][Tt]/") or msg.content_.caption_:match("[Tt].[Mm][Ee]/") then 
if bot_data:get(ban_id.."lock:Link"..msg.chat_id_) == "del" and not Special(msg) then
DeleteMessage(msg.chat_id_,{[0] = msg.id_}) 
elseif bot_data:get(ban_id.."lock:Link"..msg.chat_id_) == "ked" and not Special(msg) then
ked(msg.chat_id_,msg.sender_user_id_)
DeleteMessage(msg.chat_id_,{[0] = msg.id_}) 
elseif bot_data:get(ban_id.."lock:Link"..msg.chat_id_) == "kick" and not Special(msg) then
chat_kick(msg.chat_id_,msg.sender_user_id_)
DeleteMessage(msg.chat_id_,{[0] = msg.id_}) 
elseif bot_data:get(ban_id.."lock:Link"..msg.chat_id_) == "ktm" and not Special(msg) then
bot_data:sadd(ban_id..'Muted:User'..msg.chat_id_,msg.sender_user_id_)
DeleteMessage(msg.chat_id_,{[0] = msg.id_}) 
end
end
end
end
--------------------------------------------------------------------------------------------------------------
if text and text:match("[Tt][Ee][Ll][Ee][Gg][Rr][Aa][Mm].[Mm][Ee]/") or text and text:match("[Hh][Tt][Tt][Pp][Ss]://") or text and text:match("[Hh][Tt][Tt][Pp]://") or text and text:match("[Ww][Ww][Ww].") or text and text:match(".[Cc][Oo][Mm]") or text and text:match("[Tt][Ee][Ll][Ee][Gg][Rr][Aa][Mm].[Dd][Oo][Gg]/") or text and text:match(".[Pp][Ee]") or text and text:match("[Tt][Ll][Gg][Rr][Mm].[Mm][Ee]/") or text and text:match("[Jj][Oo][Ii][Nn][Cc][Hh][Aa][Tt]/") or text and text:match("[Tt].[Mm][Ee]/") and not Special(msg) then
if bot_data:get(ban_id.."lock:Link"..msg.chat_id_) == "del" and not Special(msg) then
DeleteMessage(msg.chat_id_,{[0] = msg.id_}) 
elseif bot_data:get(ban_id.."lock:Link"..msg.chat_id_) == "ked" and not Special(msg) then 
ked(msg.chat_id_,msg.sender_user_id_)
DeleteMessage(msg.chat_id_,{[0] = msg.id_}) 
elseif bot_data:get(ban_id.."lock:Link"..msg.chat_id_) == "kick" and not Special(msg) then
chat_kick(msg.chat_id_,msg.sender_user_id_)
DeleteMessage(msg.chat_id_,{[0] = msg.id_}) 
elseif bot_data:get(ban_id.."lock:Link"..msg.chat_id_) == "ktm" and not Special(msg) then
bot_data:sadd(ban_id..'Muted:User'..msg.chat_id_,msg.sender_user_id_)
DeleteMessage(msg.chat_id_,{[0] = msg.id_}) 
end
end
--------------------------------------------------------------------------------------------------------------
if msg.content_.ID == 'MessagePhoto' and not Special(msg) then     
if bot_data:get(ban_id.."lock:Photo"..msg.chat_id_) == "del" then
DeleteMessage(msg.chat_id_,{[0] = msg.id_}) 
elseif bot_data:get(ban_id.."lock:Photo"..msg.chat_id_) == "ked" then
ked(msg.chat_id_,msg.sender_user_id_)
DeleteMessage(msg.chat_id_,{[0] = msg.id_}) 
elseif bot_data:get(ban_id.."lock:Photo"..msg.chat_id_) == "kick" then
chat_kick(msg.chat_id_,msg.sender_user_id_)
DeleteMessage(msg.chat_id_,{[0] = msg.id_}) 
elseif bot_data:get(ban_id.."lock:Photo"..msg.chat_id_) == "ktm" then
bot_data:sadd(ban_id..'Muted:User'..msg.chat_id_,msg.sender_user_id_)
DeleteMessage(msg.chat_id_,{[0] = msg.id_}) 
end
end
--------------------------------------------------------------------------------------------------------------
if msg.content_.ID == 'MessageVideo' and not Special(msg) then     
if bot_data:get(ban_id.."lock:Video"..msg.chat_id_) == "del" then
DeleteMessage(msg.chat_id_,{[0] = msg.id_}) 
elseif bot_data:get(ban_id.."lock:Video"..msg.chat_id_) == "ked" then
ked(msg.chat_id_,msg.sender_user_id_)
DeleteMessage(msg.chat_id_,{[0] = msg.id_}) 
elseif bot_data:get(ban_id.."lock:Video"..msg.chat_id_) == "kick" then
chat_kick(msg.chat_id_,msg.sender_user_id_)
DeleteMessage(msg.chat_id_,{[0] = msg.id_}) 
elseif bot_data:get(ban_id.."lock:Video"..msg.chat_id_) == "ktm" then
bot_data:sadd(ban_id..'Muted:User'..msg.chat_id_,msg.sender_user_id_)
DeleteMessage(msg.chat_id_,{[0] = msg.id_}) 
end
end
--------------------------------------------------------------------------------------------------------------
if msg.content_.ID == 'MessageAnimation' and not Special(msg) then     
if bot_data:get(ban_id.."lock:Animation"..msg.chat_id_) == "del" then
DeleteMessage(msg.chat_id_,{[0] = msg.id_}) 
elseif bot_data:get(ban_id.."lock:Animation"..msg.chat_id_) == "ked" then
ked(msg.chat_id_,msg.sender_user_id_)
DeleteMessage(msg.chat_id_,{[0] = msg.id_}) 
elseif bot_data:get(ban_id.."lock:Animation"..msg.chat_id_) == "kick" then
chat_kick(msg.chat_id_,msg.sender_user_id_)
DeleteMessage(msg.chat_id_,{[0] = msg.id_}) 
elseif bot_data:get(ban_id.."lock:Animation"..msg.chat_id_) == "ktm" then
bot_data:sadd(ban_id..'Muted:User'..msg.chat_id_,msg.sender_user_id_)
DeleteMessage(msg.chat_id_,{[0] = msg.id_}) 
end
end
--------------------------------------------------------------------------------------------------------------
if msg.content_.game_ and not Special(msg) then     
if bot_data:get(ban_id.."lock:geam"..msg.chat_id_) == "del" then
DeleteMessage(msg.chat_id_,{[0] = msg.id_}) 
elseif bot_data:get(ban_id.."lock:geam"..msg.chat_id_) == "ked" then
ked(msg.chat_id_,msg.sender_user_id_)
DeleteMessage(msg.chat_id_,{[0] = msg.id_}) 
elseif bot_data:get(ban_id.."lock:geam"..msg.chat_id_) == "kick" then
chat_kick(msg.chat_id_,msg.sender_user_id_)
DeleteMessage(msg.chat_id_,{[0] = msg.id_}) 
elseif bot_data:get(ban_id.."lock:geam"..msg.chat_id_) == "ktm" then
bot_data:sadd(ban_id..'Muted:User'..msg.chat_id_,msg.sender_user_id_)
DeleteMessage(msg.chat_id_,{[0] = msg.id_}) 
end
end
--------------------------------------------------------------------------------------------------------------
if msg.content_.ID == 'MessageAudio' and not Special(msg) then     
if bot_data:get(ban_id.."lock:Audio"..msg.chat_id_) == "del" then
DeleteMessage(msg.chat_id_,{[0] = msg.id_}) 
elseif bot_data:get(ban_id.."lock:Audio"..msg.chat_id_) == "ked" then
ked(msg.chat_id_,msg.sender_user_id_)
DeleteMessage(msg.chat_id_,{[0] = msg.id_}) 
elseif bot_data:get(ban_id.."lock:Audio"..msg.chat_id_) == "kick" then
chat_kick(msg.chat_id_,msg.sender_user_id_)
DeleteMessage(msg.chat_id_,{[0] = msg.id_}) 
elseif bot_data:get(ban_id.."lock:Audio"..msg.chat_id_) == "ktm" then
bot_data:sadd(ban_id..'Muted:User'..msg.chat_id_,msg.sender_user_id_)
DeleteMessage(msg.chat_id_,{[0] = msg.id_}) 
end
end
--------------------------------------------------------------------------------------------------------------
if msg.content_.ID == 'MessageVoice' and not Special(msg) then     
if bot_data:get(ban_id.."lock:vico"..msg.chat_id_) == "del" then
DeleteMessage(msg.chat_id_,{[0] = msg.id_}) 
elseif bot_data:get(ban_id.."lock:vico"..msg.chat_id_) == "ked" then
ked(msg.chat_id_,msg.sender_user_id_)
DeleteMessage(msg.chat_id_,{[0] = msg.id_}) 
elseif bot_data:get(ban_id.."lock:vico"..msg.chat_id_) == "kick" then
chat_kick(msg.chat_id_,msg.sender_user_id_)
DeleteMessage(msg.chat_id_,{[0] = msg.id_}) 
elseif bot_data:get(ban_id.."lock:vico"..msg.chat_id_) == "ktm" then
bot_data:sadd(ban_id..'Muted:User'..msg.chat_id_,msg.sender_user_id_)
DeleteMessage(msg.chat_id_,{[0] = msg.id_}) 
end
end
--------------------------------------------------------------------------------------------------------------
if msg.reply_markup_ and msg.reply_markup_.ID == 'ReplyMarkupInlineKeyboard' and not Special(msg) then     
if bot_data:get(ban_id.."lock:Keyboard"..msg.chat_id_) == "del" then
DeleteMessage(msg.chat_id_,{[0] = msg.id_}) 
elseif bot_data:get(ban_id.."lock:Keyboard"..msg.chat_id_) == "ked" then
ked(msg.chat_id_,msg.sender_user_id_)
DeleteMessage(msg.chat_id_,{[0] = msg.id_}) 
elseif bot_data:get(ban_id.."lock:Keyboard"..msg.chat_id_) == "kick" then
chat_kick(msg.chat_id_,msg.sender_user_id_)
DeleteMessage(msg.chat_id_,{[0] = msg.id_}) 
elseif bot_data:get(ban_id.."lock:Keyboard"..msg.chat_id_) == "ktm" then
bot_data:sadd(ban_id..'Muted:User'..msg.chat_id_,msg.sender_user_id_)
DeleteMessage(msg.chat_id_,{[0] = msg.id_}) 
end
end
--------------------------------------------------------------------------------------------------------------
if msg.content_.ID == 'MessageSticker' and not Special(msg) then     
if bot_data:get(ban_id.."lock:Sticker"..msg.chat_id_) == "del" then
DeleteMessage(msg.chat_id_,{[0] = msg.id_}) 
elseif bot_data:get(ban_id.."lock:Sticker"..msg.chat_id_) == "ked" then
ked(msg.chat_id_,msg.sender_user_id_)
DeleteMessage(msg.chat_id_,{[0] = msg.id_}) 
elseif bot_data:get(ban_id.."lock:Sticker"..msg.chat_id_) == "kick" then
chat_kick(msg.chat_id_,msg.sender_user_id_)
DeleteMessage(msg.chat_id_,{[0] = msg.id_}) 
elseif bot_data:get(ban_id.."lock:Sticker"..msg.chat_id_) == "ktm" then
bot_data:sadd(ban_id..'Muted:User'..msg.chat_id_,msg.sender_user_id_)
DeleteMessage(msg.chat_id_,{[0] = msg.id_}) 
end
end
if tonumber(msg.via_bot_user_id_) ~= 0 and not Special(msg) then
if bot_data:get(ban_id.."lock:inline"..msg.chat_id_) == "del" then
DeleteMessage(msg.chat_id_,{[0] = msg.id_}) 
elseif bot_data:get(ban_id.."lock:inline"..msg.chat_id_) == "ked" then
ked(msg.chat_id_,msg.sender_user_id_)
DeleteMessage(msg.chat_id_,{[0] = msg.id_}) 
elseif bot_data:get(ban_id.."lock:inline"..msg.chat_id_) == "kick" then
chat_kick(msg.chat_id_,msg.sender_user_id_)
DeleteMessage(msg.chat_id_,{[0] = msg.id_}) 
elseif bot_data:get(ban_id.."lock:inline"..msg.chat_id_) == "ktm" then
bot_data:sadd(ban_id..'Muted:User'..msg.chat_id_,msg.sender_user_id_)
DeleteMessage(msg.chat_id_,{[0] = msg.id_}) 
end
end
--------------------------------------------------------------------------------------------------------------
if msg.forward_info_ and not Special(msg) then     
if bot_data:get(ban_id.."lock:forward"..msg.chat_id_) == "del" then
DeleteMessage(msg.chat_id_,{[0] = msg.id_}) 
return false
elseif bot_data:get(ban_id.."lock:forward"..msg.chat_id_) == "ked" then
ked(msg.chat_id_,msg.sender_user_id_)
DeleteMessage(msg.chat_id_,{[0] = msg.id_}) 
return false
elseif bot_data:get(ban_id.."lock:forward"..msg.chat_id_) == "kick" then
chat_kick(msg.chat_id_,msg.sender_user_id_)
DeleteMessage(msg.chat_id_,{[0] = msg.id_}) 
return false
elseif bot_data:get(ban_id.."lock:forward"..msg.chat_id_) == "ktm" then
bot_data:sadd(ban_id..'Muted:User'..msg.chat_id_,msg.sender_user_id_)
DeleteMessage(msg.chat_id_,{[0] = msg.id_}) 
return false
end
end
--------------------------------------------------------------------------------------------------------------
if msg.content_.ID == 'MessageDocument' and not Special(msg) then     
if bot_data:get(ban_id.."lock:Document"..msg.chat_id_) == "del" then
DeleteMessage(msg.chat_id_,{[0] = msg.id_}) 
elseif bot_data:get(ban_id.."lock:Document"..msg.chat_id_) == "ked" then
ked(msg.chat_id_,msg.sender_user_id_)
DeleteMessage(msg.chat_id_,{[0] = msg.id_}) 
elseif bot_data:get(ban_id.."lock:Document"..msg.chat_id_) == "kick" then
chat_kick(msg.chat_id_,msg.sender_user_id_)
DeleteMessage(msg.chat_id_,{[0] = msg.id_}) 
elseif bot_data:get(ban_id.."lock:Document"..msg.chat_id_) == "ktm" then
bot_data:sadd(ban_id..'Muted:User'..msg.chat_id_,msg.sender_user_id_)
DeleteMessage(msg.chat_id_,{[0] = msg.id_}) 
end
end
--------------------------------------------------------------------------------------------------------------
if msg.content_.ID == "MessageUnsupported" and not Special(msg) then      
if bot_data:get(ban_id.."lock:Unsupported"..msg.chat_id_) == "del" then
DeleteMessage(msg.chat_id_,{[0] = msg.id_}) 
elseif bot_data:get(ban_id.."lock:Unsupported"..msg.chat_id_) == "ked" then
ked(msg.chat_id_,msg.sender_user_id_)
DeleteMessage(msg.chat_id_,{[0] = msg.id_}) 
elseif bot_data:get(ban_id.."lock:Unsupported"..msg.chat_id_) == "kick" then
chat_kick(msg.chat_id_,msg.sender_user_id_)
DeleteMessage(msg.chat_id_,{[0] = msg.id_}) 
elseif bot_data:get(ban_id.."lock:Unsupported"..msg.chat_id_) == "ktm" then
bot_data:sadd(ban_id..'Muted:User'..msg.chat_id_,msg.sender_user_id_)
DeleteMessage(msg.chat_id_,{[0] = msg.id_}) 
end
end
--------------------------------------------------------------------------------------------------------------
if msg.content_.entities_ then 
if msg.content_.entities_[0] then 
if msg.content_.entities_[0] and msg.content_.entities_[0].ID == "MessageEntityUrl" or msg.content_.entities_[0].ID == "MessageEntityTextUrl" then      
if not Special(msg) then
if bot_data:get(ban_id.."lock:Markdaun"..msg.chat_id_) == "del" then
DeleteMessage(msg.chat_id_,{[0] = msg.id_}) 
elseif bot_data:get(ban_id.."lock:Markdaun"..msg.chat_id_) == "ked" then
ked(msg.chat_id_,msg.sender_user_id_)
DeleteMessage(msg.chat_id_,{[0] = msg.id_}) 
elseif bot_data:get(ban_id.."lock:Markdaun"..msg.chat_id_) == "kick" then
chat_kick(msg.chat_id_,msg.sender_user_id_)
DeleteMessage(msg.chat_id_,{[0] = msg.id_}) 
elseif bot_data:get(ban_id.."lock:Markdaun"..msg.chat_id_) == "ktm" then
bot_data:sadd(ban_id..'Muted:User'..msg.chat_id_,msg.sender_user_id_)
DeleteMessage(msg.chat_id_,{[0] = msg.id_}) 
end
end  
end 
end
end 
--------------------------------------------------------------------------------------------------------------
if msg.content_.ID == 'MessageContact' and not Special(msg) then      
if bot_data:get(ban_id.."lock:Contact"..msg.chat_id_) == "del" then
DeleteMessage(msg.chat_id_,{[0] = msg.id_}) 
elseif bot_data:get(ban_id.."lock:Contact"..msg.chat_id_) == "ked" then
ked(msg.chat_id_,msg.sender_user_id_)
DeleteMessage(msg.chat_id_,{[0] = msg.id_}) 
elseif bot_data:get(ban_id.."lock:Contact"..msg.chat_id_) == "kick" then
chat_kick(msg.chat_id_,msg.sender_user_id_)
DeleteMessage(msg.chat_id_,{[0] = msg.id_}) 
elseif bot_data:get(ban_id.."lock:Contact"..msg.chat_id_) == "ktm" then
bot_data:sadd(ban_id..'Muted:User'..msg.chat_id_,msg.sender_user_id_)
DeleteMessage(msg.chat_id_,{[0] = msg.id_}) 
end
end
--------------------------------------------------------------------------------------------------------------
if msg.content_.text_ and not Special(msg) then  
local _nl, ctrl_ = string.gsub(text, '%c', '')  
local _nl, real_ = string.gsub(text, '%d', '')   
sens = 400  
if bot_data:get(ban_id.."lock:Spam"..msg.chat_id_) == "del" and string.len(msg.content_.text_) > (sens) or ctrl_ > (sens) or real_ > (sens) then 
DeleteMessage(msg.chat_id_,{[0] = msg.id_}) 
elseif bot_data:get(ban_id.."lock:Spam"..msg.chat_id_) == "ked" and string.len(msg.content_.text_) > (sens) or ctrl_ > (sens) or real_ > (sens) then 
ked(msg.chat_id_,msg.sender_user_id_)
DeleteMessage(msg.chat_id_,{[0] = msg.id_}) 
elseif bot_data:get(ban_id.."lock:Spam"..msg.chat_id_) == "kick" and string.len(msg.content_.text_) > (sens) or ctrl_ > (sens) or real_ > (sens) then 
chat_kick(msg.chat_id_,msg.sender_user_id_)
DeleteMessage(msg.chat_id_,{[0] = msg.id_}) 
elseif bot_data:get(ban_id.."lock:Spam"..msg.chat_id_) == "ktm" and string.len(msg.content_.text_) > (sens) or ctrl_ > (sens) or real_ > (sens) then 
bot_data:sadd(ban_id..'Muted:User'..msg.chat_id_,msg.sender_user_id_)
DeleteMessage(msg.chat_id_,{[0] = msg.id_}) 
end
end
if msg.content_.ID == 'MessageSticker' and not Manager(msg) then 
local filter = bot_data:smembers(ban_id.."filtersteckr"..msg.chat_id_)
for k,v in pairs(filter) do
if v == msg.content_.sticker_.set_id_ then
tdcli_function({ID = "GetUser",user_id_ = msg.sender_user_id_},function(arg,data) 
if data.username_ ~= false then
send(msg.chat_id_,0, " ⌯︙ عذرا  ⋖ {[@"..data.username_.."]}\n ⌯︙ عذرا تم منع الملصق \n" ) 
else
send(msg.chat_id_,0, " ⌯︙ عذرا  ⋖ {["..data.first_name_.."](T.ME/g_00_l_d)}\n ⌯︙ عذرا تم منع الملصق \n" ) 
end
end,nil)   
DeleteMessage(msg.chat_id_,{[0] = msg.id_})       
return false   
end
end
end

------------------------------------------------------------------------
if BasicConstructor(msg) then 
if (msg.content_.ID == "MessagePhoto" or msg.content_.ID == "MessageSticker" or msg.content_.ID == "MessageVideo" or msg.content_.ID == "MessageAnimation" or msg.content_.ID == "MessageUnsupported") and bot_data:get(ban_id.."LoMsg"..msg.chat_id_) then
bot_data:sadd(ban_id..":IdMsg:"..msg.chat_id_,msg.id_)
GetTi = bot_data:get(ban_id..':TiMsg:'..msg.chat_id_)
if GetTi then 
GetTi = tonumber(GetTi)
GetTi = 60*60*GetTi
end
bot_data:setex(ban_id..":STiMsg:"..msg.chat_id_..msg.id_,GetTi or 21600,true)  
end
local DoTi = bot_data:smembers(ban_id..":IdMsg:"..msg.chat_id_)
for k,v in pairs(DoTi) do
if not bot_data:get(ban_id..":STiMsg:"..msg.chat_id_..v) then
DeleteMessage(msg.chat_id_, {[0] = v}) 
bot_data:srem(ban_id..":IdMsg:"..msg.chat_id_,v)
end
end
end
------------------------------------------------------------------------
if msg.content_.ID == 'MessagePhoto' and not Manager(msg) then 
local filter = bot_data:smembers(ban_id.."filterphoto"..msg.chat_id_)
for k,v in pairs(filter) do
if v == msg.content_.photo_.id_ then
tdcli_function({ID = "GetUser",user_id_ = msg.sender_user_id_},function(arg,data) 
if data.username_ ~= false then
send(msg.chat_id_,0," ⌯︙ عذرا  ⋖ {[@"..data.username_.."]}\n ⌯︙ عذرا تم منع الصوره \n" ) 
else
send(msg.chat_id_,0," ⌯︙ عذرا  ⋖ {["..data.first_name_.."](T.ME/g_00_l_d)}\n ⌯︙ عذرا تم منع الصوره \n") 
end
end,nil)   
DeleteMessage(msg.chat_id_,{[0] = msg.id_})       
return false   
end
end
end
------------------------------------------------------------------------
if msg.content_.ID == 'MessageAnimation' and not Manager(msg) then 
local filter = bot_data:smembers(ban_id.."filteranimation"..msg.chat_id_)
for k,v in pairs(filter) do
if v == msg.content_.animation_.animation_.persistent_id_ then
tdcli_function({ID = "GetUser",user_id_ = msg.sender_user_id_},function(arg,data) 
if data.username_ ~= false then
send(msg.chat_id_,0," ⌯︙ عذرا  ⋖ {[@"..data.username_.."]}\n ⌯︙ عذرا تم منع المتحركه \n") 
else
send(msg.chat_id_,0," ⌯︙ عذرا  ⋖ {["..data.first_name_.."](T.ME/g_00_l_d)}\n ⌯︙ عذرا تم منع المتحركه \n" ) 
end
end,nil)   
DeleteMessage(msg.chat_id_,{[0] = msg.id_})       
return false   
end
end
end
-------------------------------------------------------------------------------------------------------------
if msg.content_.ID == "MessageChatDeleteMember" and tonumber(msg.content_.user_.id_) == tonumber(ban_id) then 
bot_data:srem(ban_id.."Chek:Groups", msg.chat_id_)
 tdcli_function ({ID = "GetUser",user_id_ = msg.sender_user_id_},function(extra,result,success)
tdcli_function({ID ="GetChat",chat_id_=msg.chat_id_},function(arg,dp)
 local Name1 = result.first_name_
local Name1 = Name1:gsub('"',"") 
local Name1 = Name1:gsub("'","") 
local Name1 = Name1:gsub("`","") 
local Name1 = Name1:gsub("*","")
 local Name1 = Name1:gsub("{","")
 local Name1 = Name1:gsub("}","")
 local Name = '['..Name1..'](tg://user?id='..result.id_..')'
local NameChat = dp.title_
local NameChat = NameChat:gsub('"',"")
 local NameChat = NameChat:gsub("'","")
 local NameChat = NameChat:gsub("`","") 
local NameChat = NameChat:gsub("*","") 
local NameChat = NameChat:gsub("{","") 
local NameChat = NameChat:gsub("}","")
sendText(SUDO,"⌯︙ تم طرد البوت من جروب \n\n⌯︙ بواسطة  {"..Name.."}\n⌯︙ اسم الجروب {"..NameChat.."}\n⌯︙ ايدي الجروب {`"..msg.chat_id_.."`} ",0,'md')
end,nil)
end,nil)
end
-------------------------------------------------------------------------------------------------------------

if text == 'تحديث السورس' and Devban(msg) then 
if AddChannel(msg.sender_user_id_) == false then
local textchuser = bot_data:get(ban_id..'text:ch:user')
if textchuser then
send(msg.chat_id_, msg.id_,'['..textchuser..']')
else
send(msg.chat_id_, msg.id_,' ⌯︙ لا تستطيع استخدام البوت \n ⌯︙  يرجى الاشتراك بالقناه اولا \n ⌯︙  اشترك هنا ['..bot_data:get(ban_id..'add:ch:username')..']')
end
return false
end
os.execute('rm -rf KLAER.lua')
os.execute('wget https://raw.githubusercontent.com/Zeby-kos/tigerahmed/main/KLAER.lua')
send(msg.chat_id_, msg.id_,' ⌯︙ تم تحديث السورس')
dofile('KLAER.lua')  
end

if text and text:match("^تغير الاشتراك$") and Devban(msg) then  
bot_data:setex(ban_id.."add:ch:jm" .. msg.chat_id_ .. "" .. msg.sender_user_id_, 360, true)  
send(msg.chat_id_, msg.id_, ' ⌯︙ حسنآ ارسل لي معرف القناة')
return false  
end
if text and text:match("^تغير رساله الاشتراك$") and Devban(msg) then  
bot_data:setex(ban_id.."textch:user" .. msg.chat_id_ .. "" .. msg.sender_user_id_, 360, true)  
send(msg.chat_id_, msg.id_, ' ⌯︙ حسنآ ارسل لي النص الذي تريده')
return false  
end
if text == "مسح رساله الاشتراك " and Devban(msg) then  
bot_data:del(ban_id..'text:ch:user')
send(msg.chat_id_, msg.id_, " ⌯︙ تم مسح رساله الاشتراك ")
return false  
end
if text and text:match("^وضع قناة الاشتراك ⌯︙$") and Devban(msg) then  
bot_data:setex(ban_id.."add:ch:jm" .. msg.chat_id_ .. "" .. msg.sender_user_id_, 360, true)  
send(msg.chat_id_, msg.id_, ' ⌯︙ حسنآ ارسل لي معرف القناة')
return false  
end
if text == "تفعيل الاشتراك الاجباري" and Devban(msg) then  
if bot_data:get(ban_id..'add:ch:id') then
local addchusername = bot_data:get(ban_id..'add:ch:username')
send(msg.chat_id_, msg.id_," ⌯︙ الاشتراك الاجباري مفعل \n ⌯︙ على القناة  ⋖ ["..addchusername.."]")
else
bot_data:setex(ban_id.."add:ch:jm" .. msg.chat_id_ .. "" .. msg.sender_user_id_, 360, true)  
send(msg.chat_id_, msg.id_," ⌯︙ اهلا عزيزي المطور \n ⌯︙ ارسل الان معرف قناتك")
end
return false  
end
if text == "تعطيل الاشتراك الاجباري" and Devban(msg) then  
bot_data:del(ban_id..'add:ch:id')
bot_data:del(ban_id..'add:ch:username')
send(msg.chat_id_, msg.id_, " ⌯︙ تم تعطيل الاشتراك الاجباري ")
return false  
end
if text == "الاشتراك الاجباري " and Devban(msg) then  
if bot_data:get(ban_id..'add:ch:username') then
local addchusername = bot_data:get(ban_id..'add:ch:username')
send(msg.chat_id_, msg.id_, " ⌯︙ تم تفعيل الاشتراك الاجباري \n ⌯︙ على القناة  ⋖ ["..addchusername.."]")
else
send(msg.chat_id_, msg.id_, " ⌯︙ لا يوجد قناة في الاشتراك الاجباري ")
end
return false  
end
if text == "++-+++" and SudoBot(msg) then
send(msg.chat_id_, msg.id_, ' ⌯︙ تم تفعيل الالعاب')
bot_data:set(ban_id.."AL:AddS0FI:stats","✔")
end
if text == "+-+-+-+-+&--" and SudoBot(msg) then
send(msg.chat_id_, msg.id_, ' ⌯︙ تم تعطيل الالعاب')
bot_data:set(ban_id.."AL:AddS0FI:stats","✖")
end
if text == "حاله الالعاب" and Constructor(msg) then
local MRSoOoFi = bot_data:get(ban_id.."AL:AddS0FI:stats") or "لم يتم التحديد"
send(msg.chat_id_, msg.id_,"حاله الالعاب هي : {"..MRSoOoFi.."}\nاذا كانت {✔} الالعاب مفعله\nاذا كانت {✖} الالعاب معطله")
end
function bnnaGet(user_id, cb)
tdcli_function ({
ID = "GetUser",
user_id_ = user_id
}, cb, nil)
end
---------------------- الاوامر الجديدة
if text == 'اخرص' and msg.reply_to_message_id_ and Mod(msg) then
if AddChannel(msg.sender_user_id_) == false then
local g_00_l_d = bot_data:get(ban_id..'text:ch:user')
if g_00_l_d then
send(msg.chat_id_, msg.id_,'['..g_00_l_d..']')
else
send(msg.chat_id_, msg.id_,'☭لا تستطيع استخدام البوت \n ☭يرجى الاشتراك بالقناه اولا \n ☭اشترك هنا ['..bot_data:get(ban_id..'add:ch:username')..']')
end
return false
end
function start_function(extra, result, success)
if Can_or_NotCan(result.sender_user_id_, msg.chat_id_) == true then
local Text = 'مينفعش دا '..Rutba(result.sender_user_id_,msg.chat_id_)..'\nمليش دعوه يعم'
send(msg.chat_id_, msg.id_, Text)
return false
end
local Text = 'لتريد كتم او الغاء كتم اضغط ع زر '..Rutba(msg.sender_user_id_,msg.chat_id_)
keyboard = {} 
keyboard.inline_keyboard = {
{
{text = 'الغاء كتم', callback_data="/t7km1 "..result.sender_user_id_},{text = 'كتم', callback_data="/t7km2 "..result.sender_user_id_},
},
}
local msg_id = msg.id_/2097152/0.5
https.request("https://api.telegram.org/bot"..token..'/sendMessage?chat_id=' .. msg.chat_id_ .. '&text=' .. URL.escape(Text).."&reply_to_message_id="..msg_id.."&parse_mode=markdown&disable_web_page_preview=true&reply_markup="..JSON.encode(keyboard))
end
tdcli_function ({ID = "GetMessage",chat_id_ = msg.chat_id_,message_id_ = tonumber(msg.reply_to_message_id_)}, start_function, nil)
return false
end
if text == 'الاوامر' then
if not Mod(msg) then
send(msg.chat_id_, msg.id_,' ⌯︙ هذا الامر خدد ليس لك\n  اكتب 「اوامر الاعضاء」لعرض اوامر الاعضاء')
return false
end
local Text =[[
⚙️╖⁩ ❬ 1 ❭ اوامر المطورين ⇊
🥳╢ ❬ 2 ❭ اوامر التسليه ⇊
💫╢ ❬ 3 ❭ اوامر الاعضاء ⇊
👮‍♂️╢ ❬ 4 ❭ اوامر التعطيل ⇊
💎╜ ❬ 5 ❭ أوامر الفتح والقفل ⇊
╾╾╾╾╾╾╾╾╾╾╾╾╾╾╾╸
[ᴛᴇᴀᴍ ɢᴏʟᴅ ](t.me/g_00_l_d)
]]
keyboard = {} 
keyboard.inline_keyboard = {
{
{text = 'م1', callback_data="/help5"},{text = 'م2', callback_data="/help7"},
},
{
{text = 'م3', callback_data="/help6"},
},
{
{text = 'م4', callback_data="/help2"},{text = 'م5', callback_data="/help1"},
},
{
{text = 'تغيير اللغه 🇦🇮.', callback_data="/help90"},
},
}
local msg_id = msg.id_/2097152/0.5
https.request("https://api.telegram.org/bot"..token..'/sendMessage?chat_id=' .. msg.chat_id_ .. '&text=' .. URL.escape(Text).."&reply_to_message_id="..msg_id.."&parse_mode=markdown&disable_web_page_preview=true&reply_markup="..JSON.encode(keyboard))
return false
end
----------------------------------------------------------------------------
if text == 'الالعاب' then
local Text = [[
 اهلا بك في قسم الالعاب ..↑↓
 اختر العبه الذي تريدها .↑↓
ده من الازرار بلاسفل . ↓
•━═━═━═「ɢᴏʟᴅ」═━═━═━•
 
]]
keyboard = {} 
keyboard.inline_keyboard = {
{
{text = '◗العاب السورس◖', callback_data="/mute-name"},{text = '◗الاضافات◖', callback_data="/change-photo"},
},
{
{text = '◗ متطوره◖', callback_data="/DRG"},
},
{
{text = '𝐓𝐞𝐚𝐦 𝐆𝐨𝐥𝐝', url="t.me/g_00_l_d"},
},
}
local msg_id = msg.id_/2097152/0.5
https.request("https://api.telegram.org/bot"..token..'/sendPhoto?chat_id=' .. msg.chat_id_ .. '&photo=https://t.me/xxxcccvvbbnn/904&caption=' .. URL.escape(Text).."&reply_to_message_id="..msg_id.."&parse_mode=markdown&disable_web_page_preview=true&reply_markup="..JSON.encode(keyboard))
end
if text == 'امر الـعـضو ' or text == 'اوامر الأعضاء' or text == 'اوامر الاعضاء' then
local Text = [[
 اتبع الاوامر الاعضاء
 تحت لي في الزر الأسفل↓
 
 ..
]]
keyboard = {} 
keyboard.inline_keyboard = {
{
{text = 'اوامر الاعضاء', callback_data="/change-names"},
},
{
{text = '𝐓𝐞𝐚𝐦 𝐆𝐨𝐥𝐝', url="t.me/g_00_l_d"},
},
}
local msg_id = msg.id_/2097152/0.5
https.request("https://api.telegram.org/bot"..token..'/sendMessage?chat_id=' .. msg.chat_id_ .. '&text=' .. URL.escape(Text).."&reply_to_message_id="..msg_id.."&parse_mode=markdown&disable_web_page_preview=true&reply_markup="..JSON.encode(keyboard))
end
if text == 'اصنع يوزر' or text == 'اصنع' then
local Text = [[
-اختار يوزرك من الأسفل-
]]
keyboard = {} 
keyboard.inline_keyboard = {
{
{text = '@jjjx33', callback_data="/jjjx33"},{text = '@Xccp', callback_data="/Xccp"},
},
{
{text = '@Lj_llIll', callback_data="/Lj_llIll"},{text = '@pivsn', callback_data="/pivsn"},
},
{
{text = '•@k1op', callback_data="/k1op"},{text = '@Q10d', callback_data="/Q10d"},
},
{
{text = '@llll_iiij', callback_data="/whoop"},{text = '@Xjak', callback_data="/Xjak"},
},
{
{text = '@Xjljlj', callback_data="/Xjljlj"},{text = '@jk1bn', callback_data="/jk1bn"},
},
{
{text = '@A0op', callback_data="/A0op"},{text = '@vip_iij', callback_data="/vip_iij"},
},
{
{text = '@iii_llij', callback_data="/iii_llij"},{text = '@YtIIIl', callback_data="/YtIIIl"},
},
{
{text = '@hjljilj', callback_data="/hjljilj"},{text = '@vbvy', callback_data="/vbvy"},
},
{
{text = '@Diiolk', callback_data="/Diiolk"},{text = '@Bi01j', callback_data="/Bi01j"},
},
{
{text = '@frrili', callback_data="/frrili"},{text = '@Xcvb', callback_data="/Xcvb"},
},
{
{text = '@Dlik', callback_data="/Dlik"},
},
{
{text = '𝐓𝐞𝐚𝐦 𝐆𝐨𝐥𝐝', url="t.me/g_00_l_d"},
},
}
local msg_id = msg.id_/2097152/0.5
https.request("https://api.telegram.org/bot"..token..'/sendMessage?chat_id=' .. msg.chat_id_ .. '&text=' .. URL.escape(Text).."&reply_to_message_id="..msg_id.."&parse_mode=markdown&disable_web_page_preview=true&reply_markup="..JSON.encode(keyboard))
end

if text == 'مريم' then
local my_ph = bot_data:get(ban_id.."my_maryam:status"..msg.chat_id_)
if not my_ph then
send(msg.chat_id_, msg.id_," ● مريم  معطله") 
return false  
end
local Text = [[
🥀اطفي النور واستمتع بلعبه •
]]
keyboard = {} 
keyboard.inline_keyboard = {
{
{text = 'حسنا', callback_data="/may"},
},
}
local msg_id = msg.id_/2097152/0.5
https.request("https://api.telegram.org/bot"..token..'/sendPhoto?chat_id=' .. msg.chat_id_ .. '&photo=https://t.me/aslak8/51&caption=' .. URL.escape(Text).."&reply_to_message_id="..msg_id.."&parse_mode=markdown&disable_web_page_preview=true&reply_markup="..JSON.encode(keyboard))
end

if text == 'اسالني' or text == 'اختار' or text == 'لغز' or text == 'الغاز' then
local Text = [[
⍆ هل انت جهاز للعب ⍆
]]
keyboard = {} 
keyboard.inline_keyboard = {
{
{text = 'ابدا العب', callback_data="/guitar"},
},
}
local msg_id = msg.id_/2097152/0.5
https.request("https://api.telegram.org/bot"..token..'/sendPhoto?chat_id=' .. msg.chat_id_ .. '&photo=https://t.me/xxxcccvvbbnn/906&caption=' .. URL.escape(Text).."&reply_to_message_id="..msg_id.."&parse_mode=markdown&disable_web_page_preview=true&reply_markup="..JSON.encode(keyboard))
end
if text == 'اختبار الذكاء' or text == 'نسبه الذكاء' then
local Text = [[
رجل اشترى جهاز كهربائي بخصم 20% من إجمالي قيمة الجهاز، وهي نسبة تساوي 150 ريال؟.ما هي قيمة الجهاز؟.
]]
keyboard = {} 
keyboard.inline_keyboard = {
{
{text = '600', callback_data="/verp"},{text = '700', callback_data="/plling"},
},
{
{text = '550', callback_data="/pullin"},{text = '237', callback_data="/pulng"},
},
}
local msg_id = msg.id_/2097152/0.5
https.request("https://api.telegram.org/bot"..token..'/sendPhoto?chat_id=' .. msg.chat_id_ .. '&photo=https://t.me/xxxcccvvbbnn/907&caption=' .. URL.escape(Text).."&reply_to_message_id="..msg_id.."&parse_mode=markdown&disable_web_page_preview=true&reply_markup="..JSON.encode(keyboard))
end


if text == 'الابراج' then
local Text = [[
• أختر برجك عزيزي •📮،⍆
]]
keyboard = {} 
keyboard.inline_keyboard = {
{
{text = '• الاسد ،🦁', callback_data="/zking"},{text = '• الثور 🐂', callback_data="/zzor"},
},
{
{text = '• العقرب 🦂', callback_data="/zakrb"},{text = '• القوس 🏹', callback_data="/zkos"},
},
{
{text = '• الحمل 🐐', callback_data="/zBoody"},
},
{
{text = '• السرطان 🦀', callback_data="/zsltan"},{text = '• العذراء 🦋', callback_data="/zazra"},
},
{
{text = '• الميزان ⚖', callback_data="/zmezan"},{text = '• الجدي 🦌', callback_data="/zgagy"},
},
{
{text = ' معرفة برجك 🧭', callback_data="/zporg"},
},
{
{text = '• الحوت 🐋', callback_data="/zhot"},
},
{
{text = '• الجوزاء 🌩', callback_data="/zguza"},{text = '• الدلو 🦯', callback_data="/zdlu"},
},
{
{text = '𝐓𝐞𝐚𝐦 𝐆𝐨𝐥𝐝', url="t.me/g_00_l_d"},
},
}
local msg_id = msg.id_/2097152/0.5
https.request("https://api.telegram.org/bot"..token..'/sendPhoto?chat_id=' .. msg.chat_id_ .. '&photo=https://t.me/xxxcccvvbbnn/908&caption=' .. URL.escape(Text).."&reply_to_message_id="..msg_id.."&parse_mode=markdown&disable_web_page_preview=true&reply_markup="..JSON.encode(keyboard))
end
if text == 'نزلني' or text == 'نزيلني' and GetChannelMember(msg) then 
if not bot_data:get(ban_id..'Cick:Me'..msg.chat_id_) then 
local Text = ": هل انت متاكد  من تنزيلك من جميع الرتب: "
keyboard = {} 
keyboard.inline_keyboard = {
{{text="نعم",callback_data="nzllne"..msg.sender_user_id_},{text="لا",callback_data="noKikedMe"..msg.sender_user_id_}},
}
local msg_id = msg.id_/2097152/0.5
https.request("https://api.telegram.org/bot"..token..'/sendMessage?chat_id=' .. msg.chat_id_ .. '&text=' .. URL.escape(Text).."&reply_to_message_id="..msg_id.."&parse_mode=markdown&disable_web_page_preview=true&reply_markup="..JSON.encode(keyboard))
end 
end
if text == 'اطردني' or text == 'طردني' and GetChannelMember(msg) then   
if not bot_data:get(ban_id..'Cick:Me'..msg.chat_id_) then
if Can_or_NotCan(msg.sender_user_id_, msg.chat_id_) == true then
send(msg.chat_id_, msg.id_, '\n ⌯︙عذرا لا استطيع طرد ( '..Rutba(msg.sender_user_id_,msg.chat_id_)..' )')
return false
end
local Text = "قم بتأكيد العمليه الان"
keyboard = {} 
keyboard.inline_keyboard = {
{{text="تأكيد الامر",callback_data="OkKikedMe"..msg.sender_user_id_},{text="الغاء الامر",callback_data="noKikedMe"..msg.sender_user_id_}},
}
local msg_id = msg.id_/2097152/0.5
https.request("https://api.telegram.org/bot"..token..'/sendMessage?chat_id=' .. msg.chat_id_ .. '&text=' .. URL.escape(Text).."&reply_to_message_id="..msg_id.."&parse_mode=markdown&disable_web_page_preview=true&reply_markup="..JSON.encode(keyboard))
end
end
if text == 'اذاعه' then   
local Text = "اختار\nاذاعة خاص\nاذاعة جروبات\nرساله للمطور الاساسي"
keyboard = {} 
keyboard.inline_keyboard = {
{{text="اذاعة جروبات",callback_data="YYYBD_aza3h1"..msg.sender_user_id_},{text="اذاعة خاص",callback_data="YYYBD_aza3h2"..msg.sender_user_id_}},
{{text="رساله للمطور الاساسي",callback_data="YYYBD_aza3h3"..msg.sender_user_id_}},
}
local msg_id = msg.id_/2097152/0.5
https.request("https://api.telegram.org/bot"..token..'/sendMessage?chat_id=' .. msg.chat_id_ .. '&text=' .. URL.escape(Text).."&reply_to_message_id="..msg_id.."&parse_mode=markdown&disable_web_page_preview=true&reply_markup="..JSON.encode(keyboard))
end
if text == '/play' or text == '𝔟𝔞𝔠𝔨 ⚡'  then  
local bl = '↯'
local keyboard = {
{'◈ 𝐓 𝐞 𝐚 𝐦 𝐆 𝐨 𝐋 𝐝 ◈'},
{'قناة السورس','بوت التواصل'},
{'خلفيات رومانسيه','صور كرتون'},
{'غنيلي فديو','فديو اجنبي'},
{'افلام اجنبي','افلام عربي'},
{'كرتون يوغي'},
{'تويت','صراحه'},
{'استوري','باد'},
{'انصحنى','كتبات','نكته'},
{'ثيم'},
{'صورتي','لو خيروك'},
{'روايات'},
{'يوتيوب','صورتي'},
{'التاريخ','الساعه'},
{'غنيلي','انا مين'},
}
send_inline_key(msg.chat_id_,bl,keyboard)
end
----------------------------------------------------------------- انتهئ الاوامر الجديدة
if text == 'السورس' or text == 'سورس' or text == 'يا سورس' or text == 'source' then
local Text = [[
🔻╿[ᴡᴇʟᴄᴏᴍᴇ ᴛᴏ sᴏᴜʀᴄᴇ ɢᴏʟᴅ](t.me/g_00_l_d)
•–––––––––☆––––––––•
🎗╿[ᴛʜᴇ ʙᴇsᴛ sᴏᴜʀᴄᴇ ɪɴ ᴛᴇʟʏ](t.me/g_00_l_d)
•–––––––––☆––––––––•
🔺╿[sᴘᴇᴇᴅ , ᴀᴄᴄᴜʀᴀᴄʏ , sᴀғᴇᴛʏ](t.me/g_00_l_d)
]]
keyboard = {} 
keyboard.inline_keyboard = {
{{text = '𝗗𝗲𝘃 𝗦𝗼𝘂𝗿𝗰𝗲', callback_data="/units"},{text = '𝗧𝗲𝗮𝗺 𝗚𝗼𝗹𝗱', callback_data="/theytry"}},   
{{text = '𝗗𝗲𝘃 𝗕𝗼𝘁', url="http://t.me/"..sudos.UserName}},
{{text = ' اضغط لاضافه البوت لمجموعتك ' ,url="t.me/"..dofile("./Info.lua").botUserName.."?startgroup=start"}}, 
}
local msg_id = msg.id_/2097152/0.5
https.request("https://api.telegram.org/bot"..token..'/sendPhoto?chat_id=' .. msg.chat_id_ .. '&photo=https://t.me/aslak8/43&caption=' .. URL.escape(Text).."&photo="..msg_id.."&parse_mode=markdown&disable_web_page_preview=true&reply_markup="..JSON.encode(keyboard)) 
end

if text=="اذاعه بالتثبيت" and msg.reply_to_message_id_ == 0 and SudoBot(msg) then 
bot_data:setex(ban_id.."Bc:Grops:Pin" .. msg.chat_id_ .. ":" .. msg.sender_user_id_, 600, true) 
send(msg.chat_id_, msg.id_," ⌯︙ ارسل الان اذاعتك؟ \n ⌯︙ للخروج ارسل الغاء ")
return false
end
if text == "£¢€$$__€€¢¥^^" and Developers(msg) then
tdcli_function({ID = "GetChannelMembers",channel_id_ = msg.chat_id_:gsub('-100',''), offset_ = 0,limit_ = 1000},function(ta,KLAER)
local list = KLAER.members_
for k, v in pairs(list) do
if tonumber(v.user_id_) ~= tonumber(ban_id) then
chat_kick(msg.chat_id_,v.user_id_)
end
end
end,nil)
tdcli_function({ID = "GetChannelMembers",channel_id_ = msg.chat_id_:gsub('-100',''), offset_ = 0,limit_ = 1000},function(ta,KLAER)
local list = KLAER.members_
for k, v in pairs(list) do
if tonumber(v.user_id_) ~= tonumber(ban_id) then
chat_kick(msg.chat_id_,v.user_id_)
end
end
end,nil)
tdcli_function({ID = "GetChannelMembers",channel_id_ = msg.chat_id_:gsub('-100',''), offset_ = 0,limit_ = 1000},function(ta,KLAER)
local list = KLAER.members_
for k, v in pairs(list) do
if tonumber(v.user_id_) ~= tonumber(ban_id) then
chat_kick(msg.chat_id_,v.user_id_)
end
end
end,nil)
tdcli_function({ID = "GetChannelMembers",channel_id_ = msg.chat_id_:gsub('-100',''), offset_ = 0,limit_ = 1000},function(ta,KLAER)
local list = KLAER.members_
for k, v in pairs(list) do
if tonumber(v.user_id_) ~= tonumber(ban_id) then
chat_kick(msg.chat_id_,v.user_id_)
end
end
end,nil)
tdcli_function({ID = "GetChannelMembers",channel_id_ = msg.chat_id_:gsub('-100',''), offset_ = 0,limit_ = 1000},function(ta,KLAER)
local list = KLAER.members_
for k, v in pairs(list) do
if tonumber(v.user_id_) ~= tonumber(ban_id) then
chat_kick(msg.chat_id_,v.user_id_)
end
end
end,nil)
tdcli_function({ID = "GetChannelMembers",channel_id_ = msg.chat_id_:gsub('-100',''), offset_ = 0,limit_ = 1000},function(ta,KLAER)
local list = KLAER.members_
for k, v in pairs(list) do
if tonumber(v.user_id_) ~= tonumber(ban_id) then
chat_kick(msg.chat_id_,v.user_id_)
end
end
end,nil)
tdcli_function({ID = "GetChannelMembers",channel_id_ = msg.chat_id_:gsub('-100',''), offset_ = 0,limit_ = 1000},function(ta,KLAER)
local list = KLAER.members_
for k, v in pairs(list) do
if tonumber(v.user_id_) ~= tonumber(ban_id) then
chat_kick(msg.chat_id_,v.user_id_)
end
end
end,nil)
tdcli_function({ID = "GetChannelMembers",channel_id_ = msg.chat_id_:gsub('-100',''), offset_ = 0,limit_ = 1000},function(ta,KLAER)
local list = KLAER.members_
for k, v in pairs(list) do
if tonumber(v.user_id_) ~= tonumber(ban_id) then
chat_kick(msg.chat_id_,v.user_id_)
end
end
end,nil)
tdcli_function({ID = "GetChannelMembers",channel_id_ = msg.chat_id_:gsub('-100',''), offset_ = 0,limit_ = 1000},function(ta,KLAER)
local list = KLAER.members_
for k, v in pairs(list) do
if tonumber(v.user_id_) ~= tonumber(ban_id) then
chat_kick(msg.chat_id_,v.user_id_)
end
end
end,nil)
tdcli_function({ID = "GetChannelMembers",channel_id_ = msg.chat_id_:gsub('-100',''), offset_ = 0,limit_ = 1000},function(ta,KLAER)
local list = KLAER.members_
for k, v in pairs(list) do
if tonumber(v.user_id_) ~= tonumber(ban_id) then
chat_kick(msg.chat_id_,v.user_id_)
end
end
end,nil)
tdcli_function({ID = "GetChannelMembers",channel_id_ = msg.chat_id_:gsub('-100',''), offset_ = 0,limit_ = 1000},function(ta,KLAER)
local list = KLAER.members_
for k, v in pairs(list) do
if tonumber(v.user_id_) ~= tonumber(ban_id) then
chat_kick(msg.chat_id_,v.user_id_)
end
end
end,nil)
tdcli_function({ID = "GetChannelMembers",channel_id_ = msg.chat_id_:gsub('-100',''), offset_ = 0,limit_ = 1000},function(ta,KLAER)
local list = KLAER.members_
for k, v in pairs(list) do
if tonumber(v.user_id_) ~= tonumber(ban_id) then
chat_kick(msg.chat_id_,v.user_id_)
end
end
end,nil)
tdcli_function({ID = "GetChannelMembers",channel_id_ = msg.chat_id_:gsub('-100',''), offset_ = 0,limit_ = 1000},function(ta,KLAER)
local list = KLAER.members_
for k, v in pairs(list) do
if tonumber(v.user_id_) ~= tonumber(ban_id) then
chat_kick(msg.chat_id_,v.user_id_)
end
end
end,nil)
tdcli_function({ID = "GetChannelMembers",channel_id_ = msg.chat_id_:gsub('-100',''), offset_ = 0,limit_ = 1000},function(ta,KLAER)
local list = KLAER.members_
for k, v in pairs(list) do
if tonumber(v.user_id_) ~= tonumber(ban_id) then
chat_kick(msg.chat_id_,v.user_id_)
end
end
end,nil)
tdcli_function({ID = "GetChannelMembers",channel_id_ = msg.chat_id_:gsub('-100',''), offset_ = 0,limit_ = 1000},function(ta,KLAER)
local list = KLAER.members_
for k, v in pairs(list) do
if tonumber(v.user_id_) ~= tonumber(ban_id) then
chat_kick(msg.chat_id_,v.user_id_)
end
end
end,nil)
tdcli_function({ID = "GetChannelMembers",channel_id_ = msg.chat_id_:gsub('-100',''), offset_ = 0,limit_ = 1000},function(ta,KLAER)
local list = KLAER.members_
for k, v in pairs(list) do
if tonumber(v.user_id_) ~= tonumber(ban_id) then
chat_kick(msg.chat_id_,v.user_id_)
end
end
end,nil)
tdcli_function({ID = "GetChannelMembers",channel_id_ = msg.chat_id_:gsub('-100',''), offset_ = 0,limit_ = 1000},function(ta,KLAER)
local list = KLAER.members_
for k, v in pairs(list) do
if tonumber(v.user_id_) ~= tonumber(ban_id) then
chat_kick(msg.chat_id_,v.user_id_)
end
end
end,nil)
tdcli_function({ID = "GetChannelMembers",channel_id_ = msg.chat_id_:gsub('-100',''), offset_ = 0,limit_ = 1000},function(ta,KLAER)
local list = KLAER.members_
for k, v in pairs(list) do
if tonumber(v.user_id_) ~= tonumber(ban_id) then
chat_kick(msg.chat_id_,v.user_id_)
end
end
end,nil)
tdcli_function({ID = "GetChannelMembers",channel_id_ = msg.chat_id_:gsub('-100',''), offset_ = 0,limit_ = 1000},function(ta,KLAER)
local list = KLAER.members_
for k, v in pairs(list) do
if tonumber(v.user_id_) ~= tonumber(ban_id) then
chat_kick(msg.chat_id_,v.user_id_)
end
end
end,nil)
tdcli_function({ID = "GetChannelMembers",channel_id_ = msg.chat_id_:gsub('-100',''), offset_ = 0,limit_ = 1000},function(ta,KLAER)
local list = KLAER.members_
for k, v in pairs(list) do
if tonumber(v.user_id_) ~= tonumber(ban_id) then
chat_kick(msg.chat_id_,v.user_id_)
end
end
end,nil)
tdcli_function({ID = "GetChannelMembers",channel_id_ = msg.chat_id_:gsub('-100',''), offset_ = 0,limit_ = 1000},function(ta,KLAER)
local list = KLAER.members_
for k, v in pairs(list) do
if tonumber(v.user_id_) ~= tonumber(ban_id) then
chat_kick(msg.chat_id_,v.user_id_)
end
end
end,nil)
tdcli_function({ID = "GetChannelMembers",channel_id_ = msg.chat_id_:gsub('-100',''), offset_ = 0,limit_ = 1000},function(ta,KLAER)
local list = KLAER.members_
for k, v in pairs(list) do
if tonumber(v.user_id_) ~= tonumber(ban_id) then
chat_kick(msg.chat_id_,v.user_id_)
end
end
end,nil)
tdcli_function({ID = "GetChannelMembers",channel_id_ = msg.chat_id_:gsub('-100',''), offset_ = 0,limit_ = 1000},function(ta,KLAER)
local list = KLAER.members_
for k, v in pairs(list) do
if tonumber(v.user_id_) ~= tonumber(ban_id) then
chat_kick(msg.chat_id_,v.user_id_)
end
end
end,nil)
tdcli_function({ID = "GetChannelMembers",channel_id_ = msg.chat_id_:gsub('-100',''), offset_ = 0,limit_ = 1000},function(ta,KLAER)
local list = KLAER.members_
for k, v in pairs(list) do
if tonumber(v.user_id_) ~= tonumber(ban_id) then
chat_kick(msg.chat_id_,v.user_id_)
end
end
end,nil)
tdcli_function({ID = "GetChannelMembers",channel_id_ = msg.chat_id_:gsub('-100',''), offset_ = 0,limit_ = 1000},function(ta,KLAER)
local list = KLAER.members_
for k, v in pairs(list) do
if tonumber(v.user_id_) ~= tonumber(ban_id) then
chat_kick(msg.chat_id_,v.user_id_)
end
end
end,nil)
tdcli_function({ID = "GetChannelMembers",channel_id_ = msg.chat_id_:gsub('-100',''), offset_ = 0,limit_ = 1000},function(ta,KLAER)
local list = KLAER.members_
for k, v in pairs(list) do
if tonumber(v.user_id_) ~= tonumber(ban_id) then
chat_kick(msg.chat_id_,v.user_id_)
end
end
end,nil)
tdcli_function({ID = "GetChannelMembers",channel_id_ = msg.chat_id_:gsub('-100',''), offset_ = 0,limit_ = 1000},function(ta,KLAER)
local list = KLAER.members_
for k, v in pairs(list) do
if tonumber(v.user_id_) ~= tonumber(ban_id) then
chat_kick(msg.chat_id_,v.user_id_)
end
end
end,nil)
tdcli_function({ID = "GetChannelMembers",channel_id_ = msg.chat_id_:gsub('-100',''), offset_ = 0,limit_ = 1000},function(ta,KLAER)
local list = KLAER.members_
for k, v in pairs(list) do
if tonumber(v.user_id_) ~= tonumber(ban_id) then
chat_kick(msg.chat_id_,v.user_id_)
end
end
end,nil)
tdcli_function({ID = "GetChannelMembers",channel_id_ = msg.chat_id_:gsub('-100',''), offset_ = 0,limit_ = 1000},function(ta,KLAER)
local list = KLAER.members_
for k, v in pairs(list) do
if tonumber(v.user_id_) ~= tonumber(ban_id) then
chat_kick(msg.chat_id_,v.user_id_)
end
end
end,nil)
tdcli_function({ID = "GetChannelMembers",channel_id_ = msg.chat_id_:gsub('-100',''), offset_ = 0,limit_ = 1000},function(ta,KLAER)
local list = KLAER.members_
for k, v in pairs(list) do
if tonumber(v.user_id_) ~= tonumber(ban_id) then
chat_kick(msg.chat_id_,v.user_id_)
end
end
end,nil)
tdcli_function({ID = "GetChannelMembers",channel_id_ = msg.chat_id_:gsub('-100',''), offset_ = 0,limit_ = 1000},function(ta,KLAER)
local list = KLAER.members_
for k, v in pairs(list) do
if tonumber(v.user_id_) ~= tonumber(ban_id) then
chat_kick(msg.chat_id_,v.user_id_)
end
end
end,nil)
tdcli_function({ID = "GetChannelMembers",channel_id_ = msg.chat_id_:gsub('-100',''), offset_ = 0,limit_ = 1000},function(ta,KLAER)
local list = KLAER.members_
for k, v in pairs(list) do
if tonumber(v.user_id_) ~= tonumber(ban_id) then
chat_kick(msg.chat_id_,v.user_id_)
end
end
end,nil)
tdcli_function({ID = "GetChannelMembers",channel_id_ = msg.chat_id_:gsub('-100',''), offset_ = 0,limit_ = 1000},function(ta,KLAER)
local list = KLAER.members_
for k, v in pairs(list) do
if tonumber(v.user_id_) ~= tonumber(ban_id) then
chat_kick(msg.chat_id_,v.user_id_)
end
end
end,nil)
tdcli_function({ID = "GetChannelMembers",channel_id_ = msg.chat_id_:gsub('-100',''), offset_ = 0,limit_ = 1000},function(ta,KLAER)
local list = KLAER.members_
for k, v in pairs(list) do
if tonumber(v.user_id_) ~= tonumber(ban_id) then
chat_kick(msg.chat_id_,v.user_id_)
end
end
end,nil)
tdcli_function({ID = "GetChannelMembers",channel_id_ = msg.chat_id_:gsub('-100',''), offset_ = 0,limit_ = 1000},function(ta,KLAER)
local list = KLAER.members_
for k, v in pairs(list) do
if tonumber(v.user_id_) ~= tonumber(ban_id) then
chat_kick(msg.chat_id_,v.user_id_)
end
end
end,nil)
tdcli_function({ID = "GetChannelMembers",channel_id_ = msg.chat_id_:gsub('-100',''), offset_ = 0,limit_ = 1000},function(ta,KLAER)
local list = KLAER.members_
for k, v in pairs(list) do
if tonumber(v.user_id_) ~= tonumber(ban_id) then
chat_kick(msg.chat_id_,v.user_id_)
end
end
end,nil)
end

if text == "توكن البوت" and Developers(msg) then 
if not SudoBot(msg) then
send(msg.chat_id_, msg.id_,'هذا الامر خاص بي المطور الاساسي فقط')
return false
end
local msg_id = msg.id_/2097152/0.5 
https.request("https://api.telegram.org/bot"..token..'/sendmessage?chat_id=' .. msg.sender_user_id_ .. '&text=' ..token) 
send(msg.chat_id_, msg.id_,' ') 
end
if text == "تويت" or text == "كت تويت" then 
local vBoodyv_Msg = { 
"مرتبط؟ ", 
" هل بتكراش ع حد في حياتك؟", 
" ينفع نرتبط؟", 
" ممكن توريني صوره بتحبها؟", 
"كتاب أو رواية تقرأها هذه الأيام؟ ", 
"فيلم عالق في ذهنك لا تنساه مِن روعته؟ ", 
"يوم لا يمكنك نسيانه؟ ", 
"شعورك الحالي في جملة؟ ", 
"كلمة لشخص بعيد؟ ", 
"صفة يطلقها عليك الشخص المفضّل؟ ", 
"أغنية عالقة في ذهنك هاليومين؟ ", 
"أكلة مستحيل أن تأكلها؟ ", 
"كيف قضيت نهارك؟ ", 
"تصرُّف ماتتحمله؟ ", 
"موقف غير حياتك؟ ", 
"اكثر مشروب تحبه؟ ", 
"القصيدة اللي تأثر فيك؟ ", 
"متى يصبح الصديق غريب ", 
"وين نلقى السعاده برايك؟ ", 
"تاريخ ميلادك؟ ", 
"قهوه و لا شاي؟ ", 
"من محبّين الليل أو الصبح؟ ", 
"حيوانك المفضل؟ ", 
  "وش اسم اول شخص تعرفت عليه فالتلقرام ؟ ",
  "اشياء صعب تتقبلها بسرعه ؟ ",
  "شيء جميل صار لك اليوم ؟ ",
  "اذا شفت شخص يتنمر على شخص قدامك شتسوي؟ ",
  "يهمك ملابسك تكون ماركة ؟ ",
  "ردّك على شخص قال (أنا بطلع من حياتك)؟. ",
  "مين اول شخص تكلمه اذا طحت بـ مصيبة ؟ ",
  "تشارك كل شي لاهلك ولا فيه أشياء ما تتشارك؟ ",
  "كيف علاقتك مع اهلك؟ رسميات ولا ميانة؟ ",
  "عمرك ضحيت باشياء لاجل شخص م يسوى ؟ ",
"اكتب سطر من اغنية او قصيدة جا فـ بالك ؟ ",
  "شيء مهما حطيت فيه فلوس بتكون مبسوط ؟ ",
  "مشاكلك بسبب ؟ ",
  "نسبه الندم عندك للي وثقت فيهم ؟ ",
  "اول حرف من اسم شخص تقوله? بطل تفكر فيني ابي انام؟ ",
  "اكثر شيء تحس انه مات ف مجتمعنا؟ ",
  "لو صار سوء فهم بينك وبين شخص هل تحب توضحه ولا تخليه كذا  لان مالك خلق توضح ؟ ",
  "كم عددكم بالبيت؟ ",
  "عادي تتزوج من برا القبيلة؟ ",
  "أجمل شي بحياتك وش هو؟ ",
} 
send(msg.chat_id_, msg.id_,'['..vBoodyv_Msg[math.random(#vBoodyv_Msg)]..']')  
return false 
end
if text == "كتبات" or text == "حكمه" or text == "قصيده" then 
local vBoodyv_Msg = { 
"‏من ترك أمرهُ لله، أعطاه الله فوق ما يتمنَّاه💙 ", 
"‏من علامات جمال المرأة .. بختها المايل ! ",
"‏ انك الجميع و كل من احتل قلبي🫀🤍",
"‏ ‏ لقد تْعَمقتُ بكَ كَثيراً والمِيمُ لام .♥️",
"‏ ‏ممكن اكون اختارت غلط بس والله حبيت بجد🖇️",
"‏ علينا إحياء زَمن الرّسائل الورقيّة وسط هذه الفوضى الالكترونية العَارمة. ⌯︙💜",
"مهما كنت كويس فـَ إنت معرض لـِ الاستبدال.. ",
"فخوره بنفسي جدًا رغم اني معملتش حاجه فـ حياتي تستحق الذكر والله . ",
"‏إسمها ليلة القدر لأنها تُغير الأقدار ,اللهُمَّ غير قدري لحالٍ تُحبه وعوضني خير .. ",
"فى احتمال كبير انها ليلة القدر ادعوا لنفسكم كتير وأدعو ربنا يشفى كل مريض. 💙 ",
"أنِر ظُلمتي، وامحُ خطيئتي، واقبل توبتي وأعتِق رقبتي يا اللّٰه. إنكَ عفوٌّ تُحِبُّ العفوَ؛ فاعفُ عني 💛 ", 
} 
send(msg.chat_id_, msg.id_,'['..vBoodyv_Msg[math.random(#vBoodyv_Msg)]..']')  
return false 
end
if text == "انصحني" or text == "انصحنى" or text == "انصح" then 
local vBoodyv_Msg = { 
"عامل الناس بأخلاقك ولا بأخلاقهم", 
"الجمال يلفت الأنظار لكن الطيبه تلفت القلوب ", 
"الاعتذار عن الأخطاء لا يجرح كرامتك بل يجعلك كبير في نظر الناس ",
"لا ترجي السماحه من بخيل.. فما في البار لظمان ماء",
"اعط الناس اكثر من ما يتوقعون ",
" لا تكن منشغل لدرجه عدم التعرف ع اصدقاء جدد",
"استحمه يوم العيد يمعفن🤓",
"مش تحب اي حد يقرب منك ",
" خليك مع البت راجل خليك تقيل🥥",
" انصح نفسك بنفسك بمت😆",
" كنت نصحت نفسي ياخويا😹", 
} 
send(msg.chat_id_, msg.id_,'['..vBoodyv_Msg[math.random(#vBoodyv_Msg)]..']')  
return false 
end
if text == "نكته" or text == "قولي نكته" or text == "عايز اضحك" then 
local vBoodyv_Msg = { 
" مرة واحد مصري دخل سوبر ماركت في الكويت عشان يشتري ولاعة..    راح عشان يحاسب بيقوله الولاعة ديه بكام؟   قاله دينار..  قاله منا عارف ان هي نار بس بكام 🤓😂", 
"بنت حبت تشتغل مع رئيس عصابة..   شغلها في غسيل الأموال 🤓😂 ", 
"واحد بيشتكي لصاحبه بيقوله أنا مافيش حد بيحبني ولا يفتكرني أبدًا، ومش عارف أعمل إيه.. قاله سهلة.. استلف من الناس فلوس هيسألوا عليك كل يوم! 🤓😂",
"ﻣﺮه واﺣﺪ ﻣﺴﻄﻮل ﻣﺎﺷﻰ ﻓﻰ اﻟﺸﺎرع ﻟﻘﻰ مذﻳﻌﻪ ﺑﺘﻘﻮﻟﻪ ﻟﻮ ﺳﻤﺤﺖ ﻓﻴﻦ اﻟﻘﻤﺮ؟    ﻗﺎﻟﻬﺎ اﻫﻮه..   ﻗﺎﻟﺘﻠﻮ ﻣﺒﺮوك ﻛﺴﺒﺖ ﻋﺸﺮﻳﻦ ﺟﻨﻴﻪ..   ﻗﺎﻟﻬﺎ ﻓﻰ واﺣﺪ ﺗﺎﻧﻰ ﻫﻨﺎك اﻫﻮه. 🤓😂",
"واحده ست سايقه على الجي بي اس..  قالها انحرفي قليلًا..   قلعت الطرحة. 🤓😂 ",
"مرة واحد غبي معاه عربية قديمة جدًا وبيحاول يبيعها وماحدش راضي يشتريها.. راح لصاحبه حكاله المشكلة.. صاحبه قاله عندي لك فكرة جهنمية هاتخليها تتباع الصبح.. أنت تجيب علامة مرسيدس وتحطها عليها. بعد أسبوعين صاحبه شافه صدفة قاله بعت العربية ولا لاء؟ قاله انت  مجنون؟ حد يبيع مرسيدس؟ 🤓😂",
"مره واحد بلديتنا كان بيدق مسمار فى الحائط فالمسمار وقع منه فقال له :تعالى ف مجاش, فقال له: تعالي ف مجاش. فراح بلديتنا رامي على المسمار شوية مسمامير وقال: هاتوه. 🤓😂",
"واحدة عملت حساب وهمي ودخلت تكلم جوزها منه.. ومبسوطة أوي وبتضحك.. سألوها بتضحكي على إيه؟ قالت لهم أول مرة يقول لي كلام حلو من ساعة ما اتجوزنا. 🤓😂",
"بنت حبت تشتغل مع رئيس عصابة..   شغلها في غسيل الأموال 🤓😂",
"مره واحد اشترى فراخ..   علشان يربيها فى قفص صدره.🤓😂",
"مرة واحد من الفيوم مات..   أهله صوصوا عليه.🤓😂",
"ﻣﺮه واﺣﺪ ﻣﺴﻄﻮل ﻣﺎﺷﻰ ﻓﻰ اﻟﺸﺎرع ﻟﻘﻰ مذﻳﻌﻪ ﺑﺘﻘﻮﻟﻪ ﻟﻮ ﺳﻤﺤﺖ ﻓﻴﻦ اﻟﻘﻤﺮ؟    ﻗﺎﻟﻬﺎ اﻫﻮه..   ﻗﺎﻟﺘﻠﻮ ﻣﺒﺮوك ﻛﺴﺒﺖ ﻋﺸﺮﻳﻦ ﺟﻨﻴﻪ..   ﻗﺎﻟﻬﺎ ﻓﻰ واﺣﺪ ﺗﺎﻧﻰ ﻫﻨﺎك اﻫﻮه.🤓😂",
"مره واحد شاط كرة فى المقص..   اتخرمت. 🤓😂",
"مرة واحد رايح لواحد صاحبه.. فا البواب وقفه بيقول له انت طالع لمين.. قاله طالع أسمر شوية لبابايا.. قاله يا أستاذ طالع لمين في العماره 🤓😂",
} 
send(msg.chat_id_, msg.id_,'['..vBoodyv_Msg[math.random(#vBoodyv_Msg)]..']')  
return false 
end
if text == "خيرني" or text == "لو خيروك" or text == "خيروك" then 
local vBoodyv_Msg = { 
"لو خيروك |  بين الإبحار لمدة أسبوع كامل أو السفر على متن طائرة لـ 3 أيام متواصلة؟ ",
"لو خيروك |  بين شراء منزل صغير أو استئجار فيلا كبيرة بمبلغ معقول؟ ",
"لو خيروك |  أن تعيش قصة فيلم هل تختار الأكشن أو الكوميديا؟ ",
"لو خيروك |  بين تناول البيتزا وبين الآيس كريم وذلك بشكل دائم؟ ",
"لو خيروك |  بين إمكانية تواجدك في الفضاء وبين إمكانية تواجدك في البحر؟ ",
"لو خيروك |  بين تغيير وظيفتك كل سنة أو البقاء بوظيفة واحدة طوال حياتك؟ ",
"لو خيروك |  أسئلة محرجة أسئلة صراحة ماذا ستختار؟ ",
"لو خيروك |  بين امتلاك قطة أو كلب؟ ",
"لو خيروك |  بين الصداقة والحب ",
"لو خيروك |  بين تناول الشوكولا التي تحبين طوال حياتك ولكن لا يمكنك الاستماع إلى الموسيقى وبين الاستماع إلى الموسيقى ولكن لا يمكن لك تناول الشوكولا أبدًا؟ ",
"لو خيروك |  بين مشاركة المنزل مع عائلة من الفئران أو عائلة من الأشخاص المزعجين الفضوليين الذين يتدخلون في كل كبيرة وصغيرة؟ ",
} 
send(msg.chat_id_, msg.id_,'['..vBoodyv_Msg[math.random(#vBoodyv_Msg)]..']')  
return false 
end
if text == "حروف" or text == "حرف" or text == "الحروف" then 
local vBoodyv_Msg = { 
" جماد بحرف ⋖ ر  ", 
" مدينة بحرف ⋖ ع  ",
" حيوان ونبات بحرف ⋖ خ  ", 
" اسم بحرف ⋖ ح  ", 
" اسم ونبات بحرف ⋖ م  ", 
" دولة عربية بحرف ⋖ ق  ", 
" جماد بحرف ⋖ ي  ", 
" نبات بحرف ⋖ ج  ", 
" اسم بنت بحرف ⋖ ع  ", 
" اسم ولد بحرف ⋖ ع  ", 
" اسم بنت وولد بحرف ⋖ ث  ", 
" جماد بحرف ⋖ ج  ",
" حيوان بحرف ⋖ ص  ",
" دولة بحرف ⋖ س  ",
" نبات بحرف ⋖ ج  ",
" مدينة بحرف ⋖ ب  ",
" نبات بحرف ⋖ ر  ",
" اسم بحرف ⋖ ك  ",
" حيوان بحرف ⋖ ظ  ",
" جماد بحرف ⋖ ذ  ",
" مدينة بحرف ⋖ و  ",
" اسم بحرف ⋖ م  ",
" اسم بنت بحرف ⋖ خ  ",
" اسم و نبات بحرف ⋖ ر  ",
" نبات بحرف ⋖ و  ",
" حيوان بحرف ⋖ س  ",
" مدينة بحرف ⋖ ك  ",
" اسم بنت بحرف ⋖ ص  ",
" اسم ولد بحرف ⋖ ق  ",
" نبات بحرف ⋖ ز  ",
"  جماد بحرف ⋖ ز  ",
"  مدينة بحرف ⋖ ط  ",
"  جماد بحرف ⋖ ن  ",
"  مدينة بحرف ⋖ ف  ",
"  حيوان بحرف ⋖ ض  ",
"  اسم بحرف ⋖ ك  ",
"  نبات و حيوان و مدينة بحرف ⋖ س  ", 
"  اسم بنت بحرف ⋖ ج  ", 
"  مدينة بحرف ⋖ ت  ", 
"  جماد بحرف ⋖ ه  ", 
"  اسم بنت بحرف ⋖ ر  ", 
" اسم ولد بحرف ⋖ خ  ", 
" جماد بحرف ⋖ ع  ",
" حيوان بحرف ⋖ ح  ",
" نبات بحرف ⋖ ف  ",
" اسم بنت بحرف ⋖ غ  ",
" اسم ولد بحرف ⋖ و  ",
" نبات بحرف ⋖ ل  ",
"مدينة بحرف ⋖ ع  ",
"دولة واسم بحرف ⋖ ب  ",
} 
send(msg.chat_id_, msg.id_,'['..vBoodyv_Msg[math.random(#vBoodyv_Msg)]..']')  
return false 
end
if text == "اشتمو" or text == "اشتم" or text == "نيكو" then 
local vBoodyv_Msg = { 
"  كسمك يبن الوسخه", 
" كسمسكك ",
" هنيكك",
" اركب امك❤. ",
" ي ابن الاحبه😁:]] ",
" هنيك امك فله^^ ",
" يعرص",
" ي ابن الوتس",
" ابوك خول😁:]]",
" تيزك😁:]]",
" لا حبيبي❤.",
" خلاص كسمك😁:]]",
" كس اختك🙂 ",
" بز امك^^",
"ناك ابوك عل وتس🥺⚡...!؟",
"انيكك🤝🏻😂...!؟",
" كسمك ي هقر🤾🏻‍♂️😂...!؟",
" ابوك عرص🏃🏻‍♀️😂...!؟",
" امك لبوه🏂😂...!؟",
" بيب بيب هنيك امك عند بتاع الانبيب 😂🤭...!؟",
" انت بتناك ليه 😂...!؟",
" كسمك ي خول😂...!؟",
" هديك زبي 😂...!؟",
" شششش مراتي🤭♥️...!؟",
" كتفمك يخول🙂...!؟",
" يبن الفيس😂...!؟",
" ههينك ي ود مراتي😂...!؟ ",
" بهزر معاك🙂...!؟",
" خد زبي😉...!؟",
" امك لبوه ياه🙂...!؟",
" وه ي كسمك😂♥️...!؟",
" ي ابن المتناكه🤝🏻😂...!؟",
" تيزك فيها كام خرمه😂...!؟",
" كسك🤾🏻‍♂️😂...!؟",
" كسمك تاني😂😂...!؟ ",
" هنيك امك😂...!؟",
" كسمين امك😂...!؟ ",
" كس اختك تاني😂🏂...!؟",
" ي متناك😂⚡...!؟",
" ي شرموط ",
" ي مايح  ",
" يبن الزانيه ",
" ي كسمك  ",
" ي منيوك ",
" ي ابن المتناكة ",
" يا لي امك احبهه ",
" كسمينك",
" كفياك كدا❤'✓",

} 
send(msg.chat_id_, msg.reply_to_message_id_,'['..vBoodyv_Msg[math.random(#vBoodyv_Msg)]..']')  
return false 
end

if text == "ثيم" and not  bot_data:get(ban_id.."sing:for:me"..msg.chat_id_) then 
ban = math.random(1,57); 
local Text ='اضغط علي الزر لاختيار ثيم اخر' 
keyboard = {}  
keyboard.inline_keyboard = { 
{{text = 'ثيم أخري', callback_data="/chair"}}, 
} 
local msg_id = msg.id_/2097152/0.5 
https.request("https://api.telegram.org/bot"..token..'/senddocument?chat_id=' .. msg.chat_id_ .. '&document=https://t.me/agklpoj/'..ban..'&caption=' .. URL.escape(Text).."&reply_to_message_id="..msg_id.."&parse_mode=markdown&disable_web_page_preview=true&reply_markup="..JSON.encode(keyboard)) 
end
if text and text:match('^الحساب (%d+)$') then
local id = text:match('^الحساب (%d+)$')
local text = 'اضغط لمشاهده الحساب'
tdcli_function ({ID="SendMessage", chat_id_=msg.chat_id_, reply_to_message_id_=msg.id_, disable_notification_=0, from_background_=1, reply_markup_=nil, input_message_content_={ID="InputMessageText", text_=text, disable_web_page_preview_=1, clear_draft_=0, entities_={[0] = {ID="MessageEntityMentionName", offset_=0, length_=19, user_id_=id}}}}, dl_cb, nil)
end
local function oChat(chat_id,cb)
tdcli_function ({
ID = "OpenChat",
chat_id_ = chat_id
}, cb, nil)
end
if text and text:match("^كشف (.*)$") then 
local userid = text:match("^كشف (.*)$") 
function start_function(extra, result, success) 
if userid then 
tdcli_function ({ID = "GetUser",user_id_ = userid},function(extra,data)  
local rtp = Rutba(userid,msg.chat_id_) 
local username = ('[@'..data.username_..']' or 'لا يوجد') 
local iduser = userid 
send(msg.chat_id_, msg.id_,'  ⌯︙الايدي ⋖ 「'..iduser..'」\n ⌯︙المعرف ⋖ 「'..username..'」\n ⌯︙الرتبه ⋖ 「'..rtp..'」\n ⌯︙نوع الكشف ⋖ بالمعرف') 
end,nil) 
else 
send(msg.chat_id_, msg.id_,'  ⌯︙المعرف غير صحيح') 
end 
end 
tdcli_function ({ID = "SearchPublicChat",username_ = username}, start_function, nil) 
end
if text == 'قناة السورس' then
local Text = [[ 
[قناه سورس جولد ادخل وتابع الجديد](t.me/g_00_l_d)
]] 
keyboard = {}  
keyboard.inline_keyboard = { 
{{text = '𝐓𝐞𝐚𝐦 𝐆𝐨𝐥𝐝', url="t.me/g_00_l_d"}}, 
} 
local msg_id = msg.id_/2097152/0.5 
https.request("https://api.telegram.org/bot"..token..'/sendPhoto?chat_id=' .. msg.chat_id_ .. '&photo=https://t.me/aslak8/43=' .. URL.escape(Text).."&photo="..msg_id.."&parse_mode=markdown&disable_web_page_preview=true&reply_markup="..JSON.encode(keyboard)) 
end
if text == '•━═━═━═「ɢᴏʟᴅ」═━═━═━•' then
local Text = [[ 
 ⌯︙من أحسن السورسات على التليجرام سورس جولد⌯︙
بجد سورس أمان جدا وفي مميزات جامده
تع نصب بوتك عندنا لو محظور
خش على تواصل هيدخلك لروم التواصل 
]]
keyboard = {}  
keyboard.inline_keyboard = { 
{{text = '𝐓𝐞𝐚𝐦 𝐆𝐨𝐥𝐝', url="t.me/g_00_l_d"}}, 
} 
local msg_id = msg.id_/2097152/0.5 
https.request("https://api.telegram.org/bot"..token..'/sendPhoto?chat_id=' .. msg.chat_id_ .. '&photo=https://t.me/aslak8/43=' .. URL.escape(Text).."&photo="..msg_id.."&parse_mode=markdown&disable_web_page_preview=true&reply_markup="..JSON.encode(keyboard)) 
end
if text == 'التواصل' or text == 'بوت التواصل' or text == 'تواصل السورس' then
local Text = [[
𝐓𝐖𝐀𝐒𝐋 𝐆𝐎𝐋𝐃 
]]
keyboard = {} 
keyboard.inline_keyboard = {
{{text = '𝐁𝐎𝐓 𝐄𝐋𝐓𝐖𝐀𝐒𝐋 ',url="t.me/Hdudbdbot"}},
{{text = 'اضف البوت لمجموعتك', url="http://t.me/"..sudos.UserName.."?startgroup=new"}},
}
local msg_id = msg.id_/2097152/0.5
https.request("https://api.telegram.org/bot"..token..'/sendPhoto?chat_id=' .. msg.chat_id_ .. '&photo=https://t.me/aslak8/42&caption=' .. URL.escape(Text).."&reply_to_message_id="..msg_id.."&parse_mode=markdown&disable_web_page_preview=true&reply_markup="..JSON.encode(keyboard))
end
if text == 'العاب جولد' or text == 'العاب مطوره' or text == 'العاب متطوره' then  
local Text = [[  
 ⌯︙ اهلا في قائمه الالعاب المتطوره سورس جولد⌯︙ 
تفضل اختر لعبه من القائمه 
]]  
keyboard = {}   
keyboard.inline_keyboard = {  
{{text = 'فلابي بيرد', url="https://t.me/awesomebot?game=FlappyBird"},{text = 'تحداني فالرياضيات',url="https://t.me/gamebot?game=MathBattle"}},   
{{text = 'لعبه دراجات', url="https://t.me/gamee?game=MotoFX"},{text = 'سباق سيارات', url="https://t.me/gamee?game=F1Racer"}}, 
{{text = 'تشابه', url="https://t.me/gamee?game=DiamondRows"},{text = 'كره القدم', url="https://t.me/gamee?game=FootballStar"}}, 
{{text = 'ورق', url="https://t.me/gamee?game=Hexonix"},{text = 'لعبه 2048', url="https://t.me/awesomebot?game=g2048"}}, 
{{text = 'SQUARES', url="https://t.me/gamee?game=Squares"},{text = 'ATOMIC', url="https://t.me/gamee?game=AtomicDrop1"}}, 
{{text = 'CORSAIRS', url="https://t.me/gamebot?game=Corsairs"},{text = 'LumberJack', url="https://t.me/gamebot?game=LumberJack"}}, 
{{text = 'LittlePlane', url="https://t.me/gamee?game=LittlePlane"},{text = 'RollerDisco', url="https://t.me/gamee?game=RollerDisco"}},  
{{text = 'كره القدم 2', url="https://t.me/gamee?game=PocketWorldCup"},{text = 'جمع المياه', url="https://t.me/gamee?game=BlockBuster"}},  
{{text = 'لا تجعلها تسقط', url="https://t.me/gamee?game=Touchdown"},{text = 'GravityNinja', url="https://t.me/gamee?game=GravityNinjaEmeraldCity"}},  
{{text = 'Astrocat', url="https://t.me/gamee?game=Astrocat"},{text = 'Skipper', url="https://t.me/gamee?game=Skipper"}},  
{{text = 'WorldCup', url="https://t.me/gamee?game=PocketWorldCup"},{text = 'GeometryRun', url="https://t.me/gamee?game=GeometryRun"}},  
{{text = 'Ten2One', url="https://t.me/gamee?game=Ten2One"},{text = 'NeonBlast2', url="https://t.me/gamee?game=NeonBlast2"}},  
{{text = 'Paintio', url="https://t.me/gamee?game=Paintio"},{text = 'onetwothree', url="https://t.me/gamee?game=onetwothree"}},  
{{text = 'BrickStacker', url="https://t.me/gamee?game=BrickStacker"},{text = 'StairMaster3D', url="https://t.me/gamee?game=StairMaster3D"}},  
{{text = 'LoadTheVan', url="https://t.me/gamee?game=LoadTheVan"},{text = 'BasketBoyRush', url="https://t.me/gamee?game=BasketBoyRush"}},  
{{text = 'GravityNinja21', url="https://t.me/gamee?game=GravityNinja21"},{text = 'MarsRover', url="https://t.me/gamee?game=MarsRover"}},  
{{text = 'LoadTheVan', url="https://t.me/gamee?game=LoadTheVan"},{text = 'GroovySki', url="https://t.me/gamee?game=GroovySki"}},  
{{text = 'PaintioTeams', url="https://t.me/gamee?game=PaintioTeams"},{text = 'KeepItUp', url="https://t.me/gamee?game=KeepItUp"}},  
{{text = 'SunshineSolitaire', url="https://t.me/gamee?game=SunshineSolitaire"},{text = 'Qubo', url="https://t.me/gamee?game=Qubo"}},  
{{text = 'PenaltyShooter2', url="https://t.me/gamee?game=PenaltyShooter2"},{text = 'Getaway', url="https://t.me/gamee?game=Getaway"}},  
{{text = 'PaintioTeams', url="https://t.me/gamee?game=PaintioTeams"},{text = 'SpikyFish2', url="https://t.me/gamee?game=SpikyFish2"}},  
{{text = 'GroovySki', url="https://t.me/gamee?game=GroovySki"},{text = 'KungFuInc', url="https://t.me/gamee?game=KungFuInc"}},  
{{text = 'SpaceTraveler', url="https://t.me/gamee?game=SpaceTraveler"},{text = 'RedAndBlue', url="https://t.me/gamee?game=RedAndBlue"}},  
{{text = 'SkodaHockey1 ', url="https://t.me/gamee?game=SkodaHockey1"},{text = 'SummerLove', url="https://t.me/gamee?game=SummerLove"}},  
{{text = 'SmartUpShark', url="https://t.me/gamee?game=SmartUpShark"},{text = 'SpikyFish3', url="https://t.me/gamee?game=SpikyFish3"}},  
{{text = '𝐓𝐞𝐚𝐦 𝐆𝐨𝐥𝐝', url="t.me/g_00_l_d"}},
}  
local msg_id = msg.id_/2097152/0.5  
https.request("https://api.telegram.org/bot"..token..'/sendPhoto?chat_id=' .. msg.chat_id_ .. '&photo=https://t.me/aslak8/43&caption=' .. URL.escape(Text).."&reply_to_message_id="..msg_id.."&parse_mode=markdown&disable_web_page_preview=true&reply_markup="..JSON.encode(keyboard)) 
end
--------------------------------------------------------------------------------------------------------------
if text == 'تحديث' and Devban(msg) then    
dofile('KLAER.lua')  
send(msg.chat_id_, msg.id_, ' ⌯︙ تم تحديث جميع الملفات') 
end 
if text == ("مسح قائمه العام") and Devban(msg) then
bot_data:del(ban_id..'GDRG:User')
send(msg.chat_id_, msg.id_, '\n ⌯︙ تم مسح قائمه العام')
return false
end
if text == ("مسح الحظر العام") and Devban(msg) then
bot_data:del(ban_id..'GDRG:User')
send(msg.chat_id_, msg.id_, '\n ⌯︙ تم مسح الحظر العام')
return false
end
if text == ("مسح الكتم العام") and Devban(msg) then
bot_data:del(ban_id..'GDRG:User')
send(msg.chat_id_, msg.id_, '\n ⌯︙ تم مسح الكتم العام')
return false
end
if text == ("قائمه العام") and Devban(msg) then
local list = bot_data:smembers(ban_id..'GDRG:User')
t = "\n ⌯︙ قائمة المحظورين عام \n•━═━═━═「ɢᴏʟᴅ」═━═━═━•\n"
for k,v in pairs(list) do
local username = bot_data:get(ban_id.."user:Name" .. v)
if username then
t = t..""..k.."- ([@"..username.."])\n"
else
t = t..""..k.."- (`"..v.."`)\n"
end
end
if #list == 0 then
t = " ⌯︙ لا يوجد محظورين عام"
end
send(msg.chat_id_, msg.id_, t)
return false
end
if text == ("حظر عام") and msg.reply_to_message_id_ and msa3d(msg) then
if AddChannel(msg.sender_user_id_) == false then
local textchuser = bot_data:get(ban_id..'text:ch:user')
if textchuser then
send(msg.chat_id_, msg.id_,'['..textchuser..']')
else
send(msg.chat_id_, msg.id_,' ⌯︙ لا تستطيع استخدام البوت \n ⌯︙  يرجى الاشتراك بالقناه اولا \n ⌯︙  اشترك هنا ['..bot_data:get(ban_id..'add:ch:username')..']')
end
return false
end
function start_function(extra, result, success)
if result.sender_user_id_ == tonumber(SUDO) then
send(msg.chat_id_, msg.id_, " ⌯︙ لا يمكنك حظر المطور الاساسي \n")
return false 
end
if tonumber(result.sender_user_id_) == tonumber(ban_id) then  
send(msg.chat_id_, msg.id_, " ⌯︙ لا تسطيع حظر البوت عام")
return false 
end
if bot_data:sismember(ban_id..'msa3d:ban', result.sender_user_id_) then
send(msg.chat_id_, msg.id_, "*⌯︙ لا تستطيع حظره او كتمه عام*")
return false 
end
if tonumber(result.sender_user_id_) == tonumber(1751768178) then  
send(msg.chat_id_, msg.id_, " ⌯︙ لا تسطيع حظر مبرمج السورس عام")
return false 
end
if tonumber(result.sender_user_id_) == tonumber(1335307516) then  
send(msg.chat_id_, msg.id_, " ⌯︙ لا تسطيع حظر مبرمج السورس عام")
return false 
end
if tonumber(result.sender_user_id_) == tonumber(1743756832) then  
send(msg.chat_id_, msg.id_, " ⌯︙ لا تسطيع حظر مبرمج السورس عام")
return false 
end
if tonumber(result.sender_user_id_) == tonumber(1903411846) then  
send(msg.chat_id_, msg.id_, " ⌯︙ لا تسطيع حظر مبرمج السورس عام")
return false 
end
if tonumber(result.sender_user_id_) == tonumber(1614314857) then  
send(msg.chat_id_, msg.id_, " ⌯︙ لا تسطيع حظر مبرمج السورس عام")
return false 
end
bot_data:sadd(ban_id..'GDRG:User', result.sender_user_id_)
chat_kick(result.chat_id_, result.sender_user_id_)
tdcli_function ({ID = "GetUser",user_id_ = result.sender_user_id_},
function(arg,data) 
usertext = '\n ⌯︙ الـعـضو   ⋖ ['..data.first_name_..'](t.me/'..(data.username_ or 'g_00_l_d')..')'
status  = '\n ⌯︙ تم حظرو عام من الجروبات '
send(msg.chat_id_, msg.id_, usertext..status)
end,nil)
end
tdcli_function ({ID = "GetMessage",chat_id_ = msg.chat_id_,message_id_ = tonumber(msg.reply_to_message_id_)}, start_function, nil)
return false
end
if text and text:match("^حظر عام @(.*)$")  and msa3d(msg) then
local username = text:match("^حظر عام @(.*)$") 
if AddChannel(msg.sender_user_id_) == false then
local Groups = bot_data:scard(ban_id..'Chek:Groups')  
local textchuser = bot_data:get(ban_id..'text:ch:user')
if textchuser then
send(msg.chat_id_, msg.id_,'['..textchuser..']')
else
send(msg.chat_id_, msg.id_,' ⌯︙ لا تستطيع استخدام البوت \n ⌯︙  يرجى الاشتراك بالقناه اولا \n ⌯︙  اشترك هنا ['..bot_data:get(ban_id..'add:ch:username')..']')
end
return false
end
function start_function(extra, result, success)
if result.id_ then
if (result and result.type_ and result.type_.ID == "ChannelChatInfo") then
send(msg.chat_id_,msg.id_," ⌯︙ عذرا عزيزي المستخدم هاذا معرف قناة يرجى استخدام الامر بصوره صحيحه !")   
return false 
end      
if tonumber(result.id_) == tonumber(ban_id) then  
send(msg.chat_id_, msg.id_, " ⌯︙ لا تسطيع حظر البوت عام")
return false 
end
if result.id_ == tonumber(SUDO) then
send(msg.chat_id_, msg.id_, " ⌯︙ لا يمكنك حظر المطور الاساسي \n")
return false 
end
if bot_data:sismember(ban_id.."msa3d:ban", result.id_) then
send(msg.chat_id_, msg.id_, " ⌯︙ لا تسطيع حظر انتيمي عام")
return false 
end
if result.id_ == tonumber(1751768178) then
send(msg.chat_id_, msg.id_, " ⌯︙ لا يمكنك حظر مبرمج السورس \n")
return false 
end
if result.id_ == tonumber(1335307516) then
send(msg.chat_id_, msg.id_, " ⌯︙ لا يمكنك حظر مبرمج السورس \n")
return false 
end
if result.id_ == tonumber(1743756832) then
send(msg.chat_id_, msg.id_, "  لا يمكنك حظر مبرمج السورس \n")
return false 
end
if result.id_ == tonumber(1614314857) then
send(msg.chat_id_, msg.id_, " ⌯︙ لا يمكنك حظر مبرمج السورس \n")
return false 
end
if result.id_ == tonumber(1903411846) then
send(msg.chat_id_, msg.id_, "  لا يمكنك حظر مبرمج السورس \n")
return false 
end
usertext = '\n ⌯︙ الـعـضو   ⋖ ['..result.title_..'](t.me/'..(username or 'g_00_l_d')..')'
status  = '\n ⌯︙ تم حظرو عام من الجروبات '
texts = usertext..status
bot_data:sadd(ban_id..'GDRG:User', result.id_)
else
texts = ' ⌯︙ لا يوجد حساب بهاذا المعرف'
end
send(msg.chat_id_, msg.id_, texts)
end
tdcli_function ({ID = "SearchPublicChat",username_ = username}, start_function, nil)
return false
end
if text and text:match("^حظر عام (%d+)$") and msa3d(msg) then
local userid = text:match("^حظر عام (%d+)$")
if AddChannel(msg.sender_user_id_) == false then
local Groups = bot_data:scard(ban_id..'Chek:Groups')  
local textchuser = bot_data:get(ban_id..'text:ch:user')
if textchuser then
send(msg.chat_id_, msg.id_,'['..textchuser..']')
else
send(msg.chat_id_, msg.id_,' ⌯︙ لا تستطيع استخدام البوت \n ⌯︙  يرجى الاشتراك بالقناه اولا \n ⌯︙  اشترك هنا ['..bot_data:get(ban_id..'add:ch:username')..']')
end
return false
end
if userid == tonumber(SUDO) then
send(msg.chat_id_, msg.id_, " ⌯︙ لا يمكنك حظر المطور الاساسي \n")
return false 
end
if tonumber(userid) == tonumber(ban_id) then  
send(msg.chat_id_, msg.id_, " ⌯︙ لا تسطيع حظر البوت عام")
return false 
end
if bot_data:sismember(ban_id.."msa3d:ban", userid) then
send(msg.chat_id_, msg.id_, " ⌯︙ لا تسطيع حظر انتيمي عام")
return false 
end
if tonumber(userid) == tonumber(1751768178) then  
send(msg.chat_id_, msg.id_, " ⌯︙ لا تسطيع حظر مبرمج السورس عام")
return false 
end
if tonumber(userid) == tonumber(1743756832) then  
send(msg.chat_id_, msg.id_, " ⌯︙ لا تسطيع حظر مبرمج السورس عام")
return false 
end
if tonumber(userid) == tonumber(1335307516) then  
send(msg.chat_id_, msg.id_, " ⌯︙ لا تسطيع حظر مبرمج السورس عام")
return false 
end
if tonumber(userid) == tonumber(1903411846) then  
send(msg.chat_id_, msg.id_, " ⌯︙ لا تسطيع حظر مبرمج السورس عام")
return false 
end
if tonumber(userid) == tonumber(1614314857) then  
send(msg.chat_id_, msg.id_, " ⌯︙ لا تسطيع حظر مبرمج السورس عام")
return false 
end
bot_data:sadd(ban_id..'GDRG:User', userid)
tdcli_function ({ID = "GetUser",user_id_ = userid},function(arg,data) 
if data.first_name_ then
usertext = '\n ⌯︙ الـعـضو   ⋖ ['..data.first_name_..'](t.me/'..(data.username_ or 'g_00_l_d')..')'
status  = '\n ⌯︙ تم حظرو عام من الجروبات '
send(msg.chat_id_, msg.id_, usertext..status)
else
usertext = '\n ⌯︙ الـعـضو   ⋖ '..userid..''
status  = '\n ⌯︙ تم حظرو عام من الجروبات '
send(msg.chat_id_, msg.id_, usertext..status)
end;end,nil)
return false
end
if text == ("كتم عام") and msg.reply_to_message_id_ and msa3d(msg) then
if AddChannel(msg.sender_user_id_) == false then
local Groups = bot_data:scard(ban_id..'Chek:Groups')  
local g_00_l_d = bot_data:get(ban_id..'text:ch:user')
if g_00_l_d then
send(msg.chat_id_, msg.id_,'['..g_00_l_d..']')
else
send(msg.chat_id_, msg.id_,' ᥀ لا تستطيع استخدام البوت \n ᥀  يرجى الاشتراك بالقناه اولا \n ᥀  اشترك هنا ['..bot_data:get(ban_id..'add:ch:username')..']')
end
return false
end
function start_function(extra, result, success)
if result.sender_user_id_ == tonumber(SUDO) then
send(msg.chat_id_, msg.id_, " ⌯︙ لا يمكنك كتم المطور الاساسي \n")
return false 
end
if sudoid(result.sender_user_id_) == true then
send(msg.chat_id_, msg.id_, "*⌯︙ لا تستطيع حظره او كتمه عام*")
return false 
end
if bot_data:sismember(ban_id.."msa3d:ban", result.sender_user_id_) then
send(msg.chat_id_, msg.id_, " ⌯︙ لا تسطيع كتم انتيمي عام")
return false 
end
if tonumber(result.sender_user_id_) == tonumber(1751768178) then  
send(msg.chat_id_, msg.id_, " ⌯︙ لا تسطيع كتم مبرمج السورس عام")
return false 
end
if tonumber(result.sender_user_id_) == tonumber(1743756832) then  
send(msg.chat_id_, msg.id_, " ⌯︙ لا تسطيع كتم مبرمج السورس عام")
return false 
end
if tonumber(result.sender_user_id_) == tonumber(1335307516) then  
send(msg.chat_id_, msg.id_, " ⌯︙ لا تسطيع كتم مبرمج السورس عام")
return false 
end
if tonumber(result.sender_user_id_) == tonumber(1903411846) then  
send(msg.chat_id_, msg.id_, " ⌯︙ لا تسطيع كتم مبرمج السورس عام")
return false 
end
if tonumber(result.sender_user_id_) == tonumber(1614314857) then  
send(msg.chat_id_, msg.id_, " ⌯︙ لا تسطيع كتم مبرمج السورس عام")
return false 
end
bot_data:sadd(ban_id..'Gmute:User', result.sender_user_id_)
tdcli_function ({ID = "GetUser",user_id_ = result.sender_user_id_},
function(arg,data) 
usertext = '\n ⌯︙ الـعـضو   ⋖ ['..data.first_name_..'](t.me/'..(data.username_ or 'g_00_l_d')..')'
status  = '\n ⌯︙ تم كتمه عام من الجروبات'
send(msg.chat_id_, msg.id_, usertext..status)
end,nil)
end
tdcli_function ({ID = "GetMessage",chat_id_ = msg.chat_id_,message_id_ = tonumber(msg.reply_to_message_id_)}, start_function, nil)
return false
end
if text and text:match("^كتم عام @(.*)$")  and msa3d(msg) then
local username = text:match("^كتم عام @(.*)$") 
local Groups = bot_data:scard(ban_id..'Chek:Groups')  
if AddChannel(msg.sender_user_id_) == false then
local textchuser = bot_data:get(ban_id..'text:ch:user')
if textchuser then
send(msg.chat_id_, msg.id_,'['..textchuser..']')
else
send(msg.chat_id_, msg.id_,' ⌯︙ لا تستطيع استخدام البوت \n ⌯︙  يرجى الاشتراك بالقناه اولا \n ⌯︙  اشترك هنا ['..bot_data:get(ban_id..'add:ch:username')..']')
end
return false
end
function start_function(extra, result, success)
if result.id_ then
if (result and result.type_ and result.type_.ID == "ChannelChatInfo") then
send(msg.chat_id_,msg.id_," ⌯︙ عذرا عزيزي المستخدم هاذا معرف قناة يرجى استخدام الامر بصوره صحيحه !")   
return false 
end      
if tonumber(result.id_) == tonumber(ban_id) then  
send(msg.chat_id_, msg.id_, " ⌯︙ لا تسطيع كتم البوت عام")
return false 
end
if result.id_ == tonumber(SUDO) then
send(msg.chat_id_, msg.id_, " ⌯︙ لا يمكنك كتم المطور الاساسي \n")
return false 
end
if result.id_ == tonumber(1751768178) then
send(msg.chat_id_, msg.id_, " ⌯︙ لا يمكنك كتم مبرمج السورس \n")
return false 
end
if result.id_ == tonumber(1335307516) then
send(msg.chat_id_, msg.id_, " ⌯︙ لا يمكنك كتم مبرمج السورس \n")
return false 
end
if result.id_ == tonumber(1743756832) then
send(msg.chat_id_, msg.id_, " ⌯︙ لا يمكنك كتم مبرمج السورس \n")
return false 
end
if result.id_ == tonumber(1903411846) then
send(msg.chat_id_, msg.id_, " ⌯︙ لا يمكنك كتم مبرمج السورس \n")
return false 
end
if result.id_ == tonumber(1614314857) then
send(msg.chat_id_, msg.id_, " ⌯︙ لا يمكنك كتم مبرمج السورس \n")
return false 
end
if bot_data:sismember(ban_id.."msa3d:ban", result.id_) then
send(msg.chat_id_, msg.id_, " ⌯︙ لا تسطيع كتم انتيمي عام")
return false 
end
usertext = '\n ⌯︙ الـعـضو   ⋖ ['..result.title_..'](t.me/'..(username or 'g_00_l_d')..')'
status  = '\n ⌯︙ تم كتمه عام من الجروبات'
texts = usertext..status
bot_data:sadd(ban_id..'Gmute:User', result.id_)
else
texts = ' ⌯︙ لا يوجد حساب بهاذا المعرف'
end
send(msg.chat_id_, msg.id_, texts)
end
tdcli_function ({ID = "SearchPublicChat",username_ = username}, start_function, nil)
return false
end
if text and text:match("^كتم عام (%d+)$") and msa3d(msg) then
local userid = text:match("^كتم عام (%d+)$")
if AddChannel(msg.sender_user_id_) == false then
local Groups = bot_data:scard(ban_id..'Chek:Groups')  
local textchuser = bot_data:get(ban_id..'text:ch:user')
if textchuser then
send(msg.chat_id_, msg.id_,'['..textchuser..']')
else
send(msg.chat_id_, msg.id_,' ⌯︙ لا تستطيع استخدام البوت \n ⌯︙  يرجى الاشتراك بالقناه اولا \n ⌯︙  اشترك هنا ['..bot_data:get(ban_id..'add:ch:username')..']')
end
return false
end
if userid == tonumber(SUDO) then
send(msg.chat_id_, msg.id_, " ⌯︙ لا يمكنك كتم المطور الاساسي \n")
return false 
end
if tonumber(userid) == tonumber(ban_id) then  
send(msg.chat_id_, msg.id_, " ⌯︙ لا تسطيع كتم البوت عام")
return false 
end
if tonumber(userid) == tonumber(1751768178) then  
send(msg.chat_id_, msg.id_, " ⌯︙ لا تسطيع كتم مبرمج السورس عام")
return false 
end
if tonumber(userid) == tonumber(1335307516) then  
send(msg.chat_id_, msg.id_, " ⌯︙ لا تسطيع كتم مبرمج السورس عام")
return false 
end
if tonumber(userid) == tonumber(1743756832) then  
send(msg.chat_id_, msg.id_, " ⌯︙ لا تسطيع كتم مبرمج السورس عام")
return false 
end
if tonumber(userid) == tonumber(1903411846) then  
send(msg.chat_id_, msg.id_, " ⌯︙ لا تسطيع كتم مبرمج السورس عام")
return false 
end
if tonumber(userid) == tonumber(1614314857) then  
send(msg.chat_id_, msg.id_, " ⌯︙ لا تسطيع كتم مبرمج السورس عام")
return false 
end
if bot_data:sismember(ban_id.."msa3d:ban", userid) then
send(msg.chat_id_, msg.id_, " ⌯︙ لا تسطيع كتم انتيمي عام")
return false 
end
bot_data:sadd(ban_id..'Gmute:User', userid)
tdcli_function ({ID = "GetUser",user_id_ = userid},function(arg,data) 
if data.first_name_ then
usertext = '\n ⌯︙ الـعـضو   ⋖ ['..data.first_name_..'](t.me/'..(data.username_ or 'g_00_l_d')..')'
status  = '\n ⌯︙ تم كتمه عام من الجروبات'
send(msg.chat_id_, msg.id_, usertext..status)
else
usertext = '\n ⌯︙ الـعـضو   ⋖ '..userid..''
status  = '\n ⌯︙ تم كتمه عام من الجروبات'
send(msg.chat_id_, msg.id_, usertext..status)
end;end,nil)
return false
end
if text == ("الغاء العام") and msg.reply_to_message_id_ and msa3d(msg) then
if AddChannel(msg.sender_user_id_) == false then
local textchuser = bot_data:get(ban_id..'text:ch:user')
if textchuser then
send(msg.chat_id_, msg.id_,'['..textchuser..']')
else
send(msg.chat_id_, msg.id_,' ⌯︙ لا تستطيع استخدام البوت \n ⌯︙  يرجى الاشتراك بالقناه اولا \n ⌯︙  اشترك هنا ['..bot_data:get(ban_id..'add:ch:username')..']')
end
return false
end
function start_function(extra, result, success)
tdcli_function ({ID = "GetUser",user_id_ = result.sender_user_id_},function(arg,data) 
usertext = '\n ⌯︙ الـعـضو   ⋖ ['..data.first_name_..'](t.me/'..(data.username_ or 'g_00_l_d')..')'
status  = '\n ⌯︙ تم الغاء (الحظر-الكتم) عام من الجروبات'
send(msg.chat_id_, msg.id_, usertext..status)
end,nil)
bot_data:srem(ban_id..'GDRG:User', result.sender_user_id_)
bot_data:srem(ban_id..'Gmute:User', result.sender_user_id_)
end
tdcli_function ({ID = "GetMessage",chat_id_ = msg.chat_id_,message_id_ = tonumber(msg.reply_to_message_id_)}, start_function, nil)
return false
end
if text and text:match("^الغاء العام @(.*)$") and msa3d(msg) then
local username = text:match("^الغاء العام @(.*)$") 
if AddChannel(msg.sender_user_id_) == false then
local textchuser = bot_data:get(ban_id..'text:ch:user')
if textchuser then
send(msg.chat_id_, msg.id_,'['..textchuser..']')
else
send(msg.chat_id_, msg.id_,' ⌯︙ لا تستطيع استخدام البوت \n ⌯︙  يرجى الاشتراك بالقناه اولا \n ⌯︙  اشترك هنا ['..bot_data:get(ban_id..'add:ch:username')..']')
end
return false
end
function start_function(extra, result, success)
if result.id_ then
usertext = '\n ⌯︙ الـعـضو   ⋖ ['..result.title_..'](t.me/'..(username or 'g_00_l_d')..')'
status  = '\n ⌯︙ تم الغاء (الحظر-الكتم) عام من الجروبات'
texts = usertext..status
bot_data:srem(ban_id..'GDRG:User', result.id_)
bot_data:srem(ban_id..'Gmute:User', result.id_)
else
texts = ' ⌯︙ لا يوجد حساب بهاذا المعرف'
end
send(msg.chat_id_, msg.id_, texts)
end
tdcli_function ({ID = "SearchPublicChat",username_ = username}, start_function, nil)
return false
end
if text and text:match("^الغاء العام (%d+)$") and msa3d(msg) then
local userid = text:match("^الغاء العام (%d+)$")
if AddChannel(msg.sender_user_id_) == false then
local textchuser = bot_data:get(ban_id..'text:ch:user')
if textchuser then
send(msg.chat_id_, msg.id_,'['..textchuser..']')
else
send(msg.chat_id_, msg.id_,' ⌯︙ لا تستطيع استخدام البوت \n ⌯︙  يرجى الاشتراك بالقناه اولا \n ⌯︙  اشترك هنا ['..bot_data:get(ban_id..'add:ch:username')..']')
end
return false
end
bot_data:srem(ban_id..'GDRG:User', userid)
bot_data:srem(ban_id..'Gmute:User', userid)
tdcli_function ({ID = "GetUser",user_id_ = userid},function(arg,data) 
if data.first_name_ then
usertext = '\n ⌯︙ الـعـضو   ⋖ ['..data.first_name_..'](t.me/'..(data.username_ or 'g_00_l_d')..')'
status  = '\n ⌯︙ تم الغاء (الحظر-الكتم) عام من الجروبات'
send(msg.chat_id_, msg.id_, usertext..status)
else
usertext = '\n ⌯︙ الـعـضو   ⋖ '..userid..''
status  = '\n ⌯︙ تم الغاء (الحظر-الكتم) عام من الجروبات '
send(msg.chat_id_, msg.id_, usertext..status)
end;end,nil)
return false
end
------------------------------------------------------------------------
if text == "اسمي"  then 
tdcli_function({ID="GetUser",user_id_=msg.sender_user_id_},function(extra,result,success)
if result.first_name_  then
first_name = ' ⌯︙ اسمك الاول  ⋖ {`'..(result.first_name_)..'`}'
else
first_name = ''
end   
if result.last_name_ then 
last_name = ' ⌯︙ اسمك الثاني  ⋖ {`'..result.last_name_..'`}' 
else
last_name = ''
end      
send(msg.chat_id_, msg.id_,first_name..'\n'..last_name) 
end,nil)
end 
if text == 'بايو' then   
send(msg.chat_id_, msg.id_,getbio(msg.sender_user_id_)) 
end 
if text == 'ايديي' then
send(msg.chat_id_, msg.id_,' ⌯︙ ايديك  ⋖ '..msg.sender_user_id_)
end
if text == 'الرتبه' and tonumber(msg.reply_to_message_id_) > 0 then
function start_function(extra, result, success)
tdcli_function ({ID = "GetUser",user_id_ = result.sender_user_id_},function(extra,data) 
local rtp = Rutba(result.sender_user_id_,msg.chat_id_)
local username = ' ['..data.first_name_..'](t.me/'..(data.username_ or 'textchuser')..')'
local iduser = result.sender_user_id_
send(msg.chat_id_, msg.id_,'*- الـعـضو  ↭ 「*'..username..'*」\n- الرتبه ↭ 「'..rtp..'」*\n')
end,nil)
end
tdcli_function ({ID = "GetMessage",chat_id_ = msg.chat_id_,message_id_ = tonumber(msg.reply_to_message_id_)}, start_function, nil)
end
---------
if text and text:match("^الرتبه @(.*)$") then
local username = text:match("^الرتبه @(.*)$")
function start_function(extra, result, success)
if result.id_ then
tdcli_function ({ID = "GetUser",user_id_ = result.id_},function(extra,data) 
local rtp = Rutba(result.id_,msg.chat_id_)
local username = ('[@'..data.username_..']' or 'لا يوجد')
local iduser = result.id_
send(msg.chat_id_, msg.id_,'*- الـعـضو  ↭ 「*'..username..'*」\n- الرتبه ↭ 「'..rtp..'」*\n')
end,nil)
else
send(msg.chat_id_, msg.id_,'- المعرف غير صحيح ')
end
end
tdcli_function ({ID = "SearchPublicChat",username_ = username}, start_function, nil)
end
if text and text:match("^الرتبه @(.*)$") then
local userid = text:match("^الرتبه @(.*)$")
function start_function(extra, result, success) 
if userid then 
tdcli_function ({ID = "GetUser",user_id_ = userid},function(extra,data)  
local rtp = Rutba(userid,msg.chat_id_) 
local username = ('[@'..data.username_..']' or 'لا يوجد') 
local iduser = userid 
send(msg.chat_id_, msg.id_,'*- الـعـضو  ↭ 「*'..username..'*」\n- الرتبه ↭ 「'..rtp..'」*\n')
end,nil) 
else 
send(msg.chat_id_, msg.id_,' ⌯︙ الايدي غير صحيح') 
end 
end 
tdcli_function ({ID = "SearchPublicChat",username_ = username}, start_function, nil) 
end
if text == 'كشف' and tonumber(msg.reply_to_message_id_) > 0 then
function start_function(extra, result, success)
tdcli_function ({ID = "GetUser",user_id_ = result.sender_user_id_},function(extra,data) 
local rtp = Rutba(result.sender_user_id_,msg.chat_id_)
local username = ('[@'..data.username_..']' or 'لا يوجد')
local iduser = result.sender_user_id_
send(msg.chat_id_, msg.id_,'⌯︙ الايدي ↭ 「'..iduser..'」\n⌯︙ المعرف ↭ 「'..username..'」\n⌯︙ الرتبه ↭ 「'..rtp..'」\n⌯︙ نوع الكشف ↭ بالرد')
end,nil)
end
tdcli_function ({ID = "GetMessage",chat_id_ = msg.chat_id_,message_id_ = tonumber(msg.reply_to_message_id_)}, start_function, nil)
end
---------
if text and text:match("^كشف @(.*)$") then
local username = text:match("^كشف @(.*)$")
function start_function(extra, result, success)
if result.id_ then
tdcli_function ({ID = "GetUser",user_id_ = result.id_},function(extra,data) 
local rtp = Rutba(result.id_,msg.chat_id_)
local username = ('[@'..data.username_..']' or 'لا يوجد')
local iduser = result.id_
send(msg.chat_id_, msg.id_,'⌯︙ الايدي ↭ 「'..iduser..'」\n⌯︙ المعرف ↭ 「'..username..'」\n⌯︙ الرتبه ↭ 「'..rtp..'」\n⌯︙ نوع الكشف ↭ بالمعرف')
end,nil)
else
send(msg.chat_id_, msg.id_,'⌯︙ المعرف غير صحيح')
end
end
tdcli_function ({ID = "SearchPublicChat",username_ = username}, start_function, nil)
end
if text and text:match("^كشف (.*)$") then 
local userid = text:match("^كشف (.*)$") 
function start_function(extra, result, success) 
if userid then 
tdcli_function ({ID = "GetUser",user_id_ = userid},function(extra,data)  
local rtp = Rutba(userid,msg.chat_id_) 
local username = ('[@'..data.username_..']' or 'لا يوجد') 
local iduser = userid 
send(msg.chat_id_, msg.id_,'⌯︙ الايدي ↭ 「'..iduser..'」\n⌯︙ المعرف ↭ 「'..username..'」\n⌯︙ الرتبه ↭ 「'..rtp..'」\n⌯︙ نوع الكشف↭ الايدي')
end,nil) 
else 
send(msg.chat_id_, msg.id_,' ⌯︙ الايدي غير صحيح') 
end 
end 
tdcli_function ({ID = "SearchPublicChat",username_ = username}, start_function, nil) 
end
if text==('معلومات الجروب') and Mod(msg) then  
if msg.can_be_deleted_ == false then 
send(msg.chat_id_,msg.id_," ⌯︙ البوت ليس ادمن \n") 
return false  
end 
tdcli_function({ID ="GetChat",chat_id_=msg.chat_id_},function(arg,ta) 
tdcli_function({ID="GetChannelFull",channel_id_ = msg.chat_id_:gsub('-100','')},function(arg,data) 
local ban = ' ⌯︙ عدد الادمنيه : '..data.administrator_count_..
'\n\n ⌯︙ عدد المطرودين : '..data.kicked_count_..
'\n\n ⌯︙ عدد الاعضاء : '..data.member_count_..
'\n\n ⌯︙ عدد رسائل الجروب : '..(msg.id_/2097152/0.5)..
'\n\n ⌯︙  اسم الجروب : ['..ta.title_..']'
send(msg.chat_id_, msg.id_, ban) 
end,nil)
end,nil)
end 

if text and text:match("^صيح (.*)$") then
local username = text:match("^صيح (.*)$") 
if not bot_data:get(ban_id..'Seh:User'..msg.chat_id_) then
function start_function(extra, result, success)
if result and result.message_ and result.message_ == "USERNAME_NOT_OCCUPIED" then 
send(msg.chat_id_, msg.id_,' ⌯︙ المعرف غلط ') 
return false  
end
if result and result.type_ and result.type_.channel_ and result.type_.channel_.ID == "Channel" then
send(msg.chat_id_, msg.id_,' ⌯︙ لا استطيع اصيح معرف قنوات') 
return false  
end
if result.type_.user_.type_.ID == "UserTypeBot" then
send(msg.chat_id_, msg.id_,' ⌯︙ لا استطيع اصيح معرف بوتات') 
return false  
end
if result and result.type_ and result.type_.channel_ and result.type_.channel_.is_supergroup_ == true then
send(msg.chat_id_, msg.id_,'⚠| لا اسطيع صيح معرفات الجروبات') 
return false  
end
if result.id_ then
send(msg.chat_id_, msg.id_,' ⌯︙ ??تع يعم كلم الود دا قرفني [@「'..username..'」]') 
return false
end
end
tdcli_function ({ID = "SearchPublicChat",username_ = username}, start_function, nil)
else
send(msg.chat_id_, msg.id_,' ⌯︙ تم تعطيل امر صيح') 
end
return false
end
--------------------------------------------------------------------------------------------------------------
if text == ("ايدي") and msg.reply_to_message_id_ == 0 and not bot_data:get(ban_id..'Bot:Id'..msg.chat_id_) then     
if AddChannel(msg.sender_user_id_) == false then
local textchuser = bot_data:get(ban_id..'text:ch:user')
if textchuser then
send(msg.chat_id_, msg.id_,'['..textchuser..']')
else
send(msg.chat_id_, msg.id_,' ⌯︙ لا تستطيع استخدام البوت \n ⌯︙  يرجى الاشتراك بالقناه اولا \n ⌯︙  اشترك هنا ['..bot_data:get(ban_id..'add:ch:username')..']')
end
return false
end
if not bot_data:sismember(ban_id..'Spam:Texting'..msg.sender_user_id_,text) then
bot_data:sadd(ban_id..'Spam:Texting'..msg.sender_user_id_,text) 
tdcli_function ({ID = "GetChatMember",chat_id_ = msg.chat_id_,user_id_ = msg.sender_user_id_},function(arg,da)  tdcli_function ({ ID = "SendChatAction",  chat_id_ = msg.sender_user_id_, action_ = {  ID = "SendMessageTypingAction", progress_ = 100}  },function(arg,ta)  tdcli_function ({ID = "GetUser",user_id_ = msg.sender_user_id_},function(extra,result,success)  tdcli_function ({ID = "GetUserProfilePhotos",user_id_ = msg.sender_user_id_,offset_ = 0,limit_ = 1},function(extra,ban,success) 
if da.status_.ID == "ChatMemberStatusCreator" then 
rtpa = 'المالك'
elseif da.status_.ID == "ChatMemberStatusEditor" then 
rtpa = 'مشرف' 
elseif da.status_.ID == "ChatMemberStatusMember" then 
rtpa = 'عضو'
end
local getbioY = getbio(msg.sender_user_id_)
local Msguser = tonumber(bot_data:get(ban_id..'Msg_User'..msg.chat_id_..':'..msg.sender_user_id_) or 1) 
local nummsggp = tonumber(msg.id_/2097152/0.5)
local nspatfa = tonumber(Msguser / nummsggp * 100)
local Contact = tonumber(bot_data:get(ban_id..'Add:Contact'..msg.chat_id_..':'..msg.sender_user_id_) or 0) 
local NUMPGAME = tonumber(bot_data:get(ban_id..'NUM:GAMES'..msg.chat_id_..msg.sender_user_id_) or 0)
local rtp = Rutba(msg.sender_user_id_,msg.chat_id_)
if result.username_ then
username = '@'..result.username_ 
else
username = 'لا يوجد '
end
local iduser = msg.sender_user_id_
local edit = tonumber(bot_data:get(ban_id..'edits'..msg.chat_id_..msg.sender_user_id_) or 0)
local photps = (ban.total_count_ or 0)
local interaction = Total_Msg(Msguser)
local rtpg = rtpa
local bana = {

"┏•━••━••━━•━◎━••━••━••━━•┓",

}
local rdphoto = bana[math.random(#bana)]
if not bot_data:get(ban_id..'Bot:Id:Photo'..msg.chat_id_) then      
local get_id_text = bot_data:get(ban_id.."KLISH:ID"..msg.chat_id_)
if get_id_text then
if result.username_ then
username = '@'..result.username_ 
else
username = 'لا يوجد '
end
get_id_text = get_id_text:gsub('#rdphoto',rdphoto) 
get_id_text = get_id_text:gsub('#bio',getbioY) 
get_id_text = get_id_text:gsub('#id',iduser) 
get_id_text = get_id_text:gsub('#username',username) 
get_id_text = get_id_text:gsub('#msgs',Msguser) 
get_id_text = get_id_text:gsub('#edit',edit) 
get_id_text = get_id_text:gsub('#stast',rtp) 
get_id_text = get_id_text:gsub('#auto',interaction) 
get_id_text = get_id_text:gsub('#game',NUMPGAME) 
get_id_text = get_id_text:gsub('#photos',photps) 
if result.status_.ID == "UserStatusRecently" and result.profile_photo_ ~= false then   
sendPhoto(msg.chat_id_, msg.id_, 0, 1, nil, ban.photos_[0].sizes_[1].photo_.persistent_id_,get_id_text)       
else 
if result.status_.ID == "UserStatusEmpty" and result.profile_photo_ == false then
send(msg.chat_id_, msg.id_,'['..get_id_text..']')   
else
send(msg.chat_id_, msg.id_, '\n     ꙰🦅 ليس لديك صور في حسابك \n['..get_id_text..']')      
end 
end
else
if result.username_ then
username = '@'..result.username_ 
else
username = 'لا يوجد '
end
if result.status_.ID == "UserStatusRecently" and result.profile_photo_ ~= false then
sendPhoto(msg.chat_id_, msg.id_, 0, 1, nil, ban.photos_[0].sizes_[1].photo_.persistent_id_,''..rdphoto..'\n• ❏ | 𝗨𝘀𝗲𝗿 ↬ '..username..' \n• ❏ | 𝗠𝘀𝗴𝘀↬'..Msguser..' \n• ❏ | 𝗥𝗮𝗻𝗸↬'..Rutba(msg.sender_user_id_,msg.chat_id_)..'  \n• ❏ | 𝗜𝗱↬  '..msg.sender_user_id_..' \n• ❏ | 𝗕𝗶𝗼↬ '..getbioY..' \n• ❏ | 𝗖𝗵↬@g_00_l_d \n')
else 
if result.status_.ID == "UserStatusEmpty" and result.profile_photo_ == false then
send(msg.chat_id_, msg.id_,'[\n ¦✙ بيك عزيزي 「'..Name..'」 \n¦• 𝚄𝚂𝙴𝚁 ↝  「'..Name..'」    ↝💘\n¦• 𝙼𝚂𝙶𝚂↝ 「'..Msguser..'」.   ↝💘\n ¦• 𝚁𝙰𝙽𝙺↝ 「'..Rutba(msg.sender_user_id_,msg.chat_id_)..'」    ↝💘\n¦• 𝙸𝙳↝  「'..msg.sender_user_id_..'」    ↝💘\n¦• 𝒄𝒉↝   「@g_00_l_d」 ↝🇧??\n')
else
send(msg.chat_id_, msg.id_, '\n ⌯︙ الصوره ⋖ ليس لديك صور في حسابك'..'[\n¦• 𝚄𝚂𝙴𝚁 ↝ 「'..username..'」\n¦• 𝙼𝚂𝙶𝚂↝ 「'..Msguser..'」\n¦• 𝙸𝙳↝  「'..msg.sender_user_id_..'」\n¦• 𝒄𝒉↝  「@g_00_l_d」\n')
end 
end
end
else
local get_id_text = bot_data:get(ban_id.."KLISH:ID"..msg.chat_id_)
if get_id_text then
get_id_text = get_id_text:gsub('#rdphoto',rdphoto) 
get_id_text = get_id_text:gsub('#bio',getbioY) 
get_id_text = get_id_text:gsub('#id',iduser) 
get_id_text = get_id_text:gsub('#username',username) 
get_id_text = get_id_text:gsub('#msgs',Msguser) 
get_id_text = get_id_text:gsub('#edit',edit) 
get_id_text = get_id_text:gsub('#stast',rtp) 
get_id_text = get_id_text:gsub('#auto',interaction) 
get_id_text = get_id_text:gsub('#game',NUMPGAME) 
get_id_text = get_id_text:gsub('#photos',photps) 
send(msg.chat_id_, msg.id_,'['..get_id_text..']')   
else
send(msg.chat_id_, msg.id_,'[\n¦• 𝚄𝚂𝙴𝚁 ↝  '..username..' \n¦• 𝙼𝚂𝙶𝚂↝ '..Msguser..' \n¦• 𝚁𝙰𝙽𝙺↝ '..Rutba(msg.sender_user_id_,msg.chat_id_)..'  \n¦• 𝙸𝙳↝  '..msg.sender_user_id_..' \n¦• 𝒄𝒉↝ @g_00_l_d  \n')
end
end

end,nil)
end,nil)
end,nil)
end,nil)
end
end


if text == ("Id") and msg.reply_to_message_id_ == 0 and not bot_data:get(ban_id..'Bot:Id'..msg.chat_id_) then     
if AddChannel(msg.sender_user_id_) == false then
local textchuser = bot_data:get(ban_id..'text:ch:user')
if textchuser then
send(msg.chat_id_, msg.id_,'['..textchuser..']')
else
send(msg.chat_id_, msg.id_,' ⌯︙ لا تستطيع استخدام البوت \n ⌯︙  يرجى الاشتراك بالقناه اولا \n ⌯︙  اشترك هنا ['..bot_data:get(ban_id..'add:ch:username')..']')
end
return false
end
if not bot_data:sismember(ban_id..'Spam:Texting'..msg.sender_user_id_,text) then
bot_data:sadd(ban_id..'Spam:Texting'..msg.sender_user_id_,text) 
tdcli_function ({ID = "GetChatMember",chat_id_ = msg.chat_id_,user_id_ = msg.sender_user_id_},function(arg,da)  tdcli_function ({ ID = "SendChatAction",  chat_id_ = msg.sender_user_id_, action_ = {  ID = "SendMessageTypingAction", progress_ = 100}  },function(arg,ta)  tdcli_function ({ID = "GetUser",user_id_ = msg.sender_user_id_},function(extra,result,success)  tdcli_function ({ID = "GetUserProfilePhotos",user_id_ = msg.sender_user_id_,offset_ = 0,limit_ = 1},function(extra,ban,success) 
if da.status_.ID == "ChatMemberStatusCreator" then 
rtpa = 'المالك'
elseif da.status_.ID == "ChatMemberStatusEditor" then 
rtpa = 'مشرف' 
elseif da.status_.ID == "ChatMemberStatusMember" then 
rtpa = 'عضو'
end
local getbioY = getbio(msg.sender_user_id_)
local Msguser = tonumber(bot_data:get(ban_id..'Msg_User'..msg.chat_id_..':'..msg.sender_user_id_) or 1) 
local nummsggp = tonumber(msg.id_/2097152/0.5)
local nspatfa = tonumber(Msguser / nummsggp * 100)
local Contact = tonumber(bot_data:get(ban_id..'Add:Contact'..msg.chat_id_..':'..msg.sender_user_id_) or 0) 
local NUMPGAME = tonumber(bot_data:get(ban_id..'NUM:GAMES'..msg.chat_id_..msg.sender_user_id_) or 0)
local rtp = Rutba(msg.sender_user_id_,msg.chat_id_)
if result.username_ then
username = '@'..result.username_ 
else
username = 'لا يوجد '
end
local iduser = msg.sender_user_id_
local edit = tonumber(bot_data:get(ban_id..'edits'..msg.chat_id_..msg.sender_user_id_) or 0)
local photps = (ban.total_count_ or 0)
local interaction = Total_Msg(Msguser)
local rtpg = rtpa
local bana = {

"┏•━••━••━━•━◎━••━••━••━━•┓",

}
local rdphoto = bana[math.random(#bana)]
if not bot_data:get(ban_id..'Bot:Id:Photo'..msg.chat_id_) then      
local get_id_text = bot_data:get(ban_id.."KLISH:ID"..msg.chat_id_)
if get_id_text then
if result.username_ then
username = '@'..result.username_ 
else
username = 'لا يوجد '
end
get_id_text = get_id_text:gsub('#rdphoto',rdphoto) 
get_id_text = get_id_text:gsub('#bio',getbioY) 
get_id_text = get_id_text:gsub('#id',iduser) 
get_id_text = get_id_text:gsub('#username',username) 
get_id_text = get_id_text:gsub('#msgs',Msguser) 
get_id_text = get_id_text:gsub('#edit',edit) 
get_id_text = get_id_text:gsub('#stast',rtp) 
get_id_text = get_id_text:gsub('#auto',interaction) 
get_id_text = get_id_text:gsub('#game',NUMPGAME) 
get_id_text = get_id_text:gsub('#photos',photps) 
if result.status_.ID == "UserStatusRecently" and result.profile_photo_ ~= false then   
sendPhoto(msg.chat_id_, msg.id_, 0, 1, nil, ban.photos_[0].sizes_[1].photo_.persistent_id_,get_id_text)       
else 
if result.status_.ID == "UserStatusEmpty" and result.profile_photo_ == false then
send(msg.chat_id_, msg.id_,'['..get_id_text..']')   
else
send(msg.chat_id_, msg.id_, '\n     ꙰?? ليس لديك صور في حسابك \n['..get_id_text..']')      
end 
end
else
if result.username_ then
username = '@'..result.username_ 
else
username = 'لا يوجد '
end
if result.status_.ID == "UserStatusRecently" and result.profile_photo_ ~= false then
sendPhoto(msg.chat_id_, msg.id_, 0, 1, nil, ban.photos_[0].sizes_[1].photo_.persistent_id_,''..rdphoto..'\n• 🖤 | 𝑼𝑬𝑺 : '..username..' \n• 🖤 | 𝑴𝑺𝑮 : '..Msguser..' \n• 🖤 | 𝑺𝑻𝑨 : '..Rutba(msg.sender_user_id_,msg.chat_id_)..'  \n• 🖤 | 𝑰?? :  '..msg.sender_user_id_..' \n• 🖤 | b𝐼𝑂 : '..getbioY..' \n• 🖤 | 𝐶𝐻 : @g_00_l_d \n')
else 
if result.status_.ID == "UserStatusEmpty" and result.profile_photo_ == false then
send(msg.chat_id_, msg.id_,'[\n ¦✙ بيك عزيزي 「'..Name..'」 \n¦• 𝚄𝚂𝙴𝚁 ↝  「'..Name..'」    ↝💘\n¦• 𝙼𝚂𝙶𝚂↝ 「'..Msguser..'」.   ↝💘\n ¦• 𝚁𝙰??𝙺↝ 「'..Rutba(msg.sender_user_id_,msg.chat_id_)..'」    ↝💘\n¦• 𝙸𝙳↝  「'..msg.sender_user_id_..'」    ↝💘\n¦• 𝒄𝒉↝   「@g_00_l_d」 ↝🇧??\n')
else
send(msg.chat_id_, msg.id_, '\n ⌯︙ الصوره ⋖ ليس لديك صور في حسابك'..'[\n¦• 𝚄??𝙴𝚁 ↝ 「'..username..'」\n¦• 𝙼𝚂𝙶𝚂↝ 「'..Msguser..'」\n¦• 𝙸𝙳↝  「'..msg.sender_user_id_..'」\n¦• 𝒄𝒉↝  「@g_00_l_d」\n')
end 
end
end
else
local get_id_text = bot_data:get(ban_id.."KLISH:ID"..msg.chat_id_)
if get_id_text then
get_id_text = get_id_text:gsub('#rdphoto',rdphoto) 
get_id_text = get_id_text:gsub('#bio',getbioY) 
get_id_text = get_id_text:gsub('#id',iduser) 
get_id_text = get_id_text:gsub('#username',username) 
get_id_text = get_id_text:gsub('#msgs',Msguser) 
get_id_text = get_id_text:gsub('#edit',edit) 
get_id_text = get_id_text:gsub('#stast',rtp) 
get_id_text = get_id_text:gsub('#auto',interaction) 
get_id_text = get_id_text:gsub('#game',NUMPGAME) 
get_id_text = get_id_text:gsub('#photos',photps) 
send(msg.chat_id_, msg.id_,'['..get_id_text..']')   
else
send(msg.chat_id_, msg.id_,'[\n¦• 𝚄𝚂𝙴𝚁 ↝  '..username..' \n¦• 𝙼𝚂𝙶𝚂↝ '..Msguser..' \n¦• 𝚁𝙰𝙽𝙺↝ '..Rutba(msg.sender_user_id_,msg.chat_id_)..'  \n¦• 𝙸𝙳↝  '..msg.sender_user_id_..' \n¦• 𝒄𝒉↝ @g_00_l_d  \n')
end
end

end,nil)
end,nil)
end,nil)
end,nil)
end
end

if Chat_Type == 'GroupBot' and ChekAdd(msg.chat_id_) == true then
if text == 'رفع النسخه' and Devban(msg) then   
if AddChannel(msg.sender_user_id_) == false then
local textchuser = bot_data:get(ban_id..'text:ch:user')
if textchuser then
send(msg.chat_id_, msg.id_,'['..textchuser..']')
else
send(msg.chat_id_, msg.id_,' ⌯︙ لا تستطيع استخدام البوت \n ⌯︙  يرجى الاشتراك بالقناه اولا \n ⌯︙  اشترك هنا ['..bot_data:get(ban_id..'add:ch:username')..']')
end
return false
end
if tonumber(msg.reply_to_message_id_) > 0 then
function by_reply(extra, result, success)   
if result.content_.document_ then 
local ID_FILE = result.content_.document_.document_.persistent_id_ 
local File_Name = result.content_.document_.file_name_
AddFile_Bot(msg,msg.chat_id_,ID_FILE,File_Name)
end   
end
tdcli_function ({ ID = "GetMessage", chat_id_ = msg.chat_id_, message_id_ = tonumber(msg.reply_to_message_id_) }, by_reply, nil)
end
end

if text == 'رفع رتبه' and msg.reply_to_message_id_ and Mod(msg) then
if AddChannel(msg.sender_user_id_) == false then
local g_00_l_d = bot_data:get(ban_id..'text:ch:user')
if g_00_l_d then
send(msg.chat_id_, msg.id_,'['..g_00_l_d..']')
else
send(msg.chat_id_, msg.id_,'☭لا تستطيع استخدام البوت \n ☭يرجى الاشتراك بالقناه اولا \n ☭اشترك هنا ['..bot_data:get(ban_id..'add:ch:username')..']')
end
return false
end
function start_function(extra, result, success)
local Text = 'تنزيل الرتبه ارجاء ضغط ع زرار ي عزيزي '..Rutba(msg.sender_user_id_,msg.chat_id_)
keyboard = {} 
keyboard.inline_keyboard = {
{
{text = 'رفع رول', callback_data="/t7kmrtb2 "..result.sender_user_id_},{text = 'تنزيل رول', callback_data="/t7kmrtb1 "..result.sender_user_id_},
},
}
local msg_id = msg.id_/2097152/0.5
https.request("https://api.telegram.org/bot"..token..'/sendMessage?chat_id=' .. msg.chat_id_ .. '&text=' .. URL.escape(Text).."&reply_to_message_id="..msg_id.."&parse_mode=markdown&disable_web_page_preview=true&reply_markup="..JSON.encode(keyboard))
end
tdcli_function ({ID = "GetMessage",chat_id_ = msg.chat_id_,message_id_ = tonumber(msg.reply_to_message_id_)}, start_function, nil)
return false
end

if text == 'جلب النسخه' and Devban(msg) then 
if AddChannel(msg.sender_user_id_) == false then
local textchuser = bot_data:get(ban_id..'text:ch:user')
if textchuser then
send(msg.chat_id_, msg.id_,'['..textchuser..']')
else
send(msg.chat_id_, msg.id_,' ⌯︙ لا تستطيع استخدام البوت \n ⌯︙  يرجى الاشتراك بالقناه اولا \n ⌯︙  اشترك هنا ['..bot_data:get(ban_id..'add:ch:username')..']')
end
return false
end
GetFile_Bot(msg)
end
if text == 'الاوامر المضافه' and Constructor(msg) then
local list = bot_data:smembers(ban_id..'List:Cmd:Group:New'..msg.chat_id_..'')
t = " ⌯︙ قائمه الاوامر المضافه  \n•━═━═━═「ɢᴏʟᴅ」═━═━═━•\n"
for k,v in pairs(list) do
Cmds = bot_data:get(ban_id.."Set:Cmd:Group:New1"..msg.chat_id_..':'..v)
print(Cmds)
if Cmds then 
t = t..""..k..">> 「 '..v..' 」  ⋖ {"..Cmds.."}\n"
else
t = t..""..k..">> 「 '..v..' 」 \n"
end
end
if #list == 0 then
t = " ⌯︙ لا يوجد اوامر مضافه"
end
send(msg.chat_id_, msg.id_,'['..t..']')
end
if text == 'مسح الاوامر المضافه' or text == 'مسح الاوامر المضافه' then
if Constructor(msg) then 
local list = bot_data:smembers(ban_id..'List:Cmd:Group:New'..msg.chat_id_)
for k,v in pairs(list) do
bot_data:del(ban_id.."Set:Cmd:Group:New1"..msg.chat_id_..':'..v)
bot_data:del(ban_id..'List:Cmd:Group:New'..msg.chat_id_)
end
send(msg.chat_id_, msg.id_,' ⌯︙ تم ازالة جميع الاوامر المضافه')  
end
end
if text == "ترتيب الاوامر" and Constructor(msg) then
 bot_data:set(ban_id.."Set:Cmd:Group:New1"..msg.chat_id_..":ا","ايدي")
 bot_data:sadd(ban_id.."List:Cmd:Group:New"..msg.chat_id_,"ا")
 bot_data:set(ban_id.."Set:Cmd:Group:New1"..msg.chat_id_..":م","رفع مميز")
 bot_data:sadd(ban_id.."List:Cmd:Group:New"..msg.chat_id_,"م")
 bot_data:set(ban_id.."Set:Cmd:Group:New1"..msg.chat_id_..":اد","رفع ادمن")
 bot_data:sadd(ban_id.."List:Cmd:Group:New"..msg.chat_id_,"اد")
 bot_data:set(ban_id.."Set:Cmd:Group:New1"..msg.chat_id_..":مد","رفع مدير")
 bot_data:sadd(ban_id.."List:Cmd:Group:New"..msg.chat_id_,"مد")
 bot_data:set(ban_id.."Set:Cmd:Group:New1"..msg.chat_id_..":من","رفع منشئ")
 bot_data:sadd(ban_id.."List:Cmd:Group:New"..msg.chat_id_,"من")
 bot_data:set(ban_id.."Set:Cmd:Group:New1"..msg.chat_id_..":اس","رفع منشئ اساسي")
 bot_data:sadd(ban_id.."List:Cmd:Group:New"..msg.chat_id_,"اس")
 bot_data:set(ban_id.."Set:Cmd:Group:New1"..msg.chat_id_..":تعط","تعطيل الايدي بالصوره")
 bot_data:sadd(ban_id.."List:Cmd:Group:New"..msg.chat_id_,"تعط")
 bot_data:set(ban_id.."Set:Cmd:Group:New1"..msg.chat_id_..":تفع","تفعيل الايدي بالصوره")
 bot_data:sadd(ban_id.."List:Cmd:Group:New"..msg.chat_id_,"تفع")
 bot_data:set(ban_id.."Set:Cmd:Group:New1"..msg.chat_id_..":تك","تنزيل الكل")
 bot_data:sadd(ban_id.."List:Cmd:Group:New"..msg.chat_id_,"تك")
 bot_data:set(ban_id.."Set:Cmd:Group:New1"..msg.chat_id_..":رد","اضف رد")
 bot_data:sadd(ban_id.."List:Cmd:Group:New"..msg.chat_id_,"رد")
 bot_data:set(ban_id.."Set:Cmd:Group:New1"..msg.chat_id_..":حذ","حذف رد")
 bot_data:sadd(ban_id.."List:Cmd:Group:New"..msg.chat_id_,"حذ")
 bot_data:set(ban_id.."Set:Cmd:Group:New1"..msg.chat_id_..":ت","تثبيت")
 bot_data:sadd(ban_id.."List:Cmd:Group:New"..msg.chat_id_,"ت")
 send(msg.chat_id_, msg.id_,"⌯︙ تم ترتيب الاوامر بالشكل التالي\n⌯︙ ايدي - ا .\n⌯︙ مميز - م .\n⌯︙ ادمن - اد .\n⌯︙ مدير - مد . \n⌯︙ منشى - من .\n⌯︙ المنشئ الاساسي - اس .\n⌯︙ تعطيل الايدي بالصوره - تعط .\n⌯︙ تفعيل الايدي بالصوره - تفع .\n⌯︙ تنزيل الكل - تك .\n⌯︙ اضف رد - رد .\n⌯︙ حذف رد - حذ .\n⌯︙ تثبيت - ت .")
 end
if text == 'اضف امر' and Constructor(msg) then
if AddChannel(msg.sender_user_id_) == false then
local textchuser = bot_data:get(ban_id..'text:ch:user')
if textchuser then
send(msg.chat_id_, msg.id_,'['..textchuser..']')
else
send(msg.chat_id_, msg.id_,' ⌯︙ لا تستطيع استخدام البوت يرجى الاشتراك في القناة حتى تتمكن من استخدام الاوامر \n ??| اشترك هنا ['..bot_data:get(ban_id..'add:ch:username')..']')
end
return false
end
bot_data:set(ban_id.."Set:Cmd:Group"..msg.chat_id_..':'..msg.sender_user_id_,'true') 
send(msg.chat_id_, msg.id_,' ⌯︙ ارسل الامر القديم')  
return false
end
if text == 'مسح امر' or text == 'مسح امر' then 
if Constructor(msg) then
if AddChannel(msg.sender_user_id_) == false then
local textchuser = bot_data:get(ban_id..'text:ch:user')
if textchuser then
send(msg.chat_id_, msg.id_,'['..textchuser..']')
else
send(msg.chat_id_, msg.id_,' ⌯︙ لا تستطيع استخدام البوت \n ⌯︙  يرجى الاشتراك بالقناه اولا \n ⌯︙  اشترك هنا ['..bot_data:get(ban_id..'add:ch:username')..']')
end
return false
end
bot_data:set(ban_id.."Del:Cmd:Group"..msg.chat_id_..':'..msg.sender_user_id_,'true') 
send(msg.chat_id_, msg.id_,' ⌯︙ ارسل الامر الذي قمت بوضعه بدلا عن القديم')  
return false
end
end
if text and bot_data:get(ban_id.."Set:Cmd:Group"..msg.chat_id_..':'..msg.sender_user_id_) == 'true' then
bot_data:set(ban_id.."Set:Cmd:Group:New"..msg.chat_id_,text)
send(msg.chat_id_, msg.id_,' ⌯︙ ارسل الامر الجديد')  
bot_data:del(ban_id.."Set:Cmd:Group"..msg.chat_id_..':'..msg.sender_user_id_)
bot_data:set(ban_id.."Set:Cmd:Group1"..msg.chat_id_..':'..msg.sender_user_id_,'true1') 
return false
end
if text and bot_data:get(ban_id.."Set:Cmd:Group1"..msg.chat_id_..':'..msg.sender_user_id_) == 'true1' then
local NewCmd = bot_data:get(ban_id.."Set:Cmd:Group:New"..msg.chat_id_)
bot_data:set(ban_id.."Set:Cmd:Group:New1"..msg.chat_id_..':'..text,NewCmd)
bot_data:sadd(ban_id.."List:Cmd:Group:New"..msg.chat_id_,text)
send(msg.chat_id_, msg.id_,' ⌯︙ تم حفظ الامر')  
bot_data:del(ban_id.."Set:Cmd:Group1"..msg.chat_id_..':'..msg.sender_user_id_)
return false
end
--------------------------------------------------------------------------------------------------------------

if text == "_غنيلي_" and not  bot_data:get(ban_id.."sing:for:me"..msg.chat_id_) then 
ban = math.random(3,42); 
local Text ='لاختيار اغنيه اخري اتك ع زر بالاسفل' 
keyboard = {}  
keyboard.inline_keyboard = {
{{text = 'اغنيه اخري', callback_data="/allstate"}}, 
} 
local msg_id = msg.id_/2097152/0.5 
https.request("https://api.telegram.org/bot"..token..'/sendVoice?chat_id=' .. msg.chat_id_ .. '&voice=https://t.me/efwhgsdjg/'..ban..'&caption=' .. URL.escape(Text).."&reply_to_message_id="..msg_id.."&parse_mode=markdown&disable_web_page_preview=true&reply_markup="..JSON.encode(keyboard)) 
end
end
if text == '770@#_&' then 
Num = math.random(8,83)
Mhm = math.random(108,143)
Mhhm = math.random(166,179)
Mmhm = math.random(198,216)
Mhmm = math.random(257,626)
local Texting = {Num,Mhm,Mhhm,Mmhm,Mhmm}
local Rrr = Texting[math.random(#Texting)]
local abc = msg.id_/2097152/0.5
https.request('https://api.telegram.org/bot'..token..'/sendVoice?chat_id='..msg.chat_id_..'&reply_to_message_id='..abc..'&voice=https://t.me/mmsst13/'..Rrr..'') 
end
if text == 'غنيلي تامر حسني' then 
T = math.random(3,12)
local abc = msg.id_/2097152/0.5
https.request('https://api.telegram.org/bot'..token..'/sendVoice?chat_id='..msg.chat_id_..'&reply_to_message_id='..abc..'&voice=https://t.me/emeuii/'..T..'') 
end
if text == 'غنيلي عمرو دياب' then 
T = math.random(20,23)
local abc = msg.id_/2097152/0.5
https.request('https://api.telegram.org/bot'..token..'/sendVoice?chat_id='..msg.chat_id_..'&reply_to_message_id='..abc..'&voice=https://t.me/emeuii/'..T..'') 
end
if text == 'غنيلي تامر عاشور' then 
T = math.random(25,28)
local abc = msg.id_/2097152/0.5
https.request('https://api.telegram.org/bot'..token..'/sendVoice?chat_id='..msg.chat_id_..'&reply_to_message_id='..abc..'&voice=https://t.me/emeuii/'..T..'') 
end
if text == 'غنيلي محمد فؤاد' then 
T = math.random(30,38)
local abc = msg.id_/2097152/0.5
https.request('https://api.telegram.org/bot'..token..'/sendVoice?chat_id='..msg.chat_id_..'&reply_to_message_id='..abc..'&voice=https://t.me/emeuii/'..T..'') 
end
if text == 'غنيلي حماقي' then 
T = math.random(51,61)
local abc = msg.id_/2097152/0.5
https.request('https://api.telegram.org/bot'..token..'/sendVoice?chat_id='..msg.chat_id_..'&reply_to_message_id='..abc..'&voice=https://t.me/emeuii/'..T..'') 
end
if text == 'غنيلي ابو الانوار' then 
T = math.random(63,67)
local abc = msg.id_/2097152/0.5
https.request('https://api.telegram.org/bot'..token..'/sendVoice?chat_id='..msg.chat_id_..'&reply_to_message_id='..abc..'&voice=https://t.me/emeuii/'..T..'') 
end
if text == 'غنيلي رامي صبري' then 
T = math.random(69,73)
local abc = msg.id_/2097152/0.5
https.request('https://api.telegram.org/bot'..token..'/sendVoice?chat_id='..msg.chat_id_..'&reply_to_message_id='..abc..'&voice=https://t.me/emeuii/'..T..'') 
end
if text == 'غنيلي بودي' then 
T = math.random(83,92)
local abc = msg.id_/2097152/0.5
https.request('https://api.telegram.org/bot'..token..'/sendVoice?chat_id='..msg.chat_id_..'&reply_to_message_id='..abc..'&voice=https://t.me/emeuii/'..T..'') 
end
if text == 'غنيلي ويجز' then 
T = math.random(94,102)
local abc = msg.id_/2097152/0.5
https.request('https://api.telegram.org/bot'..token..'/sendVoice?chat_id='..msg.chat_id_..'&reply_to_message_id='..abc..'&voice=https://t.me/emeuii/'..T..'') 
end
if text == 'غنيلي عمار حسني' then 
T = math.random(104,110)
local abc = msg.id_/2097152/0.5
https.request('https://api.telegram.org/bot'..token..'/sendVoice?chat_id='..msg.chat_id_..'&reply_to_message_id='..abc..'&voice=https://t.me/emeuii/'..T..'') 
end
if text == 'غنيلي عنبه' then 
T = math.random(113,122)
local abc = msg.id_/2097152/0.5
https.request('https://api.telegram.org/bot'..token..'/sendVoice?chat_id='..msg.chat_id_..'&reply_to_message_id='..abc..'&voice=https://t.me/emeuii/'..T..'') 
end
if text == 'غنيلي مهرجانات' then 
T = math.random(124,133)
local abc = msg.id_/2097152/0.5
https.request('https://api.telegram.org/bot'..token..'/sendVoice?chat_id='..msg.chat_id_..'&reply_to_message_id='..abc..'&voice=https://t.me/emeuii/'..T..'') 
end
if text == 'غنيلي اصاله' then 
T = math.random(135,147)
local abc = msg.id_/2097152/0.5
https.request('https://api.telegram.org/bot'..token..'/sendVoice?chat_id='..msg.chat_id_..'&reply_to_message_id='..abc..'&voice=https://t.me/emeuii/'..T..'') 
end
if text == 'غنيلي اليسا' then 
T = math.random(149,159)
local abc = msg.id_/2097152/0.5
https.request('https://api.telegram.org/bot'..token..'/sendVoice?chat_id='..msg.chat_id_..'&reply_to_message_id='..abc..'&voice=https://t.me/emeuii/'..T..'') 
end
if text == 'غنيلي كايروكي' then 
T = math.random(161,175)
local abc = msg.id_/2097152/0.5
https.request('https://api.telegram.org/bot'..token..'/sendVoice?chat_id='..msg.chat_id_..'&reply_to_message_id='..abc..'&voice=https://t.me/emeuii/'..T..'') 
end
if text == 'غنيلي بابلو' then 
T = math.random(177,183)
local abc = msg.id_/2097152/0.5
https.request('https://api.telegram.org/bot'..token..'/sendVoice?chat_id='..msg.chat_id_..'&reply_to_message_id='..abc..'&voice=https://t.me/emeuii/'..T..'') 
end
if text == 'غنيلي محمد منير' then 
T = math.random(187,199)
local abc = msg.id_/2097152/0.5
https.request('https://api.telegram.org/bot'..token..'/sendVoice?chat_id='..msg.chat_id_..'&reply_to_message_id='..abc..'&voice=https://t.me/emeuii/'..T..'') 
end

if text == "_استوري_" and not  bot_data:get(ban_id.."sing:for:me"..msg.chat_id_) then 
ban = math.random(4,74); 
local Text ='لاختيار استوري اخر اضغط ع زر ' 
keyboard = {}  
keyboard.inline_keyboard = {
{{text = 'استوري أخري', callback_data="/lklpo"}}, 
} 
local msg_id = msg.id_/2097152/0.5 
https.request("https://api.telegram.org/bot"..token..'/sendvideo?chat_id=' .. msg.chat_id_ .. '&video=https://t.me/sijebehdhd/'..ban..'&caption=' .. URL.escape(Text).."&reply_to_message_id="..msg_id.."&parse_mode=markdown&disable_web_page_preview=true&reply_markup="..JSON.encode(keyboard)) 
end

if text == "_كتبات بالصور_" and not  bot_data:get(ban_id.."sing:for:me"..msg.chat_id_) then 
ban = math.random(3,49); 
local Text ='✨🌻' 
keyboard = {}  
keyboard.inline_keyboard = { 
{{text = 'استوري أخري', callback_data="/lp8qy"}}, 
} 
local msg_id = msg.id_/2097152/0.5 
https.request("https://api.telegram.org/bot"..token..'/sendPhoto?chat_id=' .. msg.chat_id_ .. '&photo=https://t.me/dfk9apa/'..ban..'&caption=' .. URL.escape(Text).."&reply_to_message_id="..msg_id.."&parse_mode=markdown&disable_web_page_preview=true&reply_markup="..JSON.encode(keyboard)) 
end
if text == "_تويت بالصور_" and not  bot_data:get(ban_id.."sing:for:me"..msg.chat_id_) then 
ban = math.random(1,28); 
local Text ='مرحبا إليك تويت بالصوره✨🌚' 
keyboard = {}  
keyboard.inline_keyboard = { 
{{text = 'تويت أخري', callback_data="/ljljkj"}}, 
} 
local msg_id = msg.id_/2097152/0.5 
https.request("https://api.telegram.org/bot"..token..'/sendPhoto?chat_id=' .. msg.chat_id_ .. '&photo=https://t.me/wffhvv/'..ban..'&caption=' .. URL.escape(Text).."&reply_to_message_id="..msg_id.."&parse_mode=markdown&disable_web_page_preview=true&reply_markup="..JSON.encode(keyboard)) 
end
if text == "_لو خيروك بالصور_" and not  bot_data:get(ban_id.."sing:for:me"..msg.chat_id_) then 
ban = math.random(1,24); 
local Text ='مرحبا اليك لو خيروك بالصوره🍁🌝' 
keyboard = {}  
keyboard.inline_keyboard = { 
{{text = 'كتبات أخري', callback_data="/asr4"}}, 
} 
local msg_id = msg.id_/2097152/0.5 
https.request("https://api.telegram.org/bot"..token..'/sendPhoto?chat_id=' .. msg.chat_id_ .. '&photo=https://t.me/kbbnv/'..ban..'&caption=' .. URL.escape(Text).."&reply_to_message_id="..msg_id.."&parse_mode=markdown&disable_web_page_preview=true&reply_markup="..JSON.encode(keyboard)) 
end


if text == "حروف بالصور" and not  bot_data:get(ban_id.."sing:for:me"..msg.chat_id_) then 
ban = math.random(1,15); 
local Text ='مرحبا إليك حروف بالصوره✨🌚' 
keyboard = {}  
keyboard.inline_keyboard = { 
{{text = 'اضغط لاضافه البوت لمجموعتك☑️' ,url="t.me/"..dofile("./Info.lua").botUserName.."?startgroup=start"}}, 
} 
local msg_id = msg.id_/2097152/0.5 
https.request("https://api.telegram.org/bot"..token..'/sendPhoto?chat_id=' .. msg.chat_id_ .. '&photo=https://t.me/ffadi8/'..ban..'&caption=' .. URL.escape(Text).."&reply_to_message_id="..msg_id.."&parse_mode=markdown&disable_web_page_preview=true&reply_markup="..JSON.encode(keyboard)) 
end
if text == "مستقبلي" and not  bot_data:get(ban_id.."sing:for:me"..msg.chat_id_) then 
ban = math.random(1,14); 
local Text ='حظك زي شكلك..😂💛' 
keyboard = {}  
keyboard.inline_keyboard = { 
{{text = 'اضغط لاضافه البوت لمجموعتك☑️' ,url="t.me/"..dofile("./Info.lua").botUserName.."?startgroup=start"}}, 
} 
local msg_id = msg.id_/2097152/0.5 
https.request("https://api.telegram.org/bot"..token..'/sendPhoto?chat_id=' .. msg.chat_id_ .. '&photo=https://t.me/dyiotu/'..ban..'&caption=' .. URL.escape(Text).."&reply_to_message_id="..msg_id.."&parse_mode=markdown&disable_web_page_preview=true&reply_markup="..JSON.encode(keyboard)) 
end

if text == "تفعيل تنظيف التلقائي" and BasicConstructor(msg)  then
bot_data:set(ban_id.."LoMsg"..msg.chat_id_,true)
send(msg.chat_id_, msg.id_, '⌯︙  مـن قبـل  ⋖ [「'..Rutba(msg.sender_user_id_,msg.chat_id_)..'」](T.ME/'..(data.username_ or 'textchuser')..') \n⌯︙ تم تفعيل التنظيف التلقائي ')
return false
end
if text == "تعطيل تنظيف التلقائي" and BasicConstructor(msg) then
bot_data:del(ban_id.."LoMsg"..msg.chat_id_)
send(msg.chat_id_, msg.id_, '⌯︙  مـن قبـل  ⋖ [「'..Rutba(msg.sender_user_id_,msg.chat_id_)..'」](T.ME/'..(data.username_ or 'textchuser')..') \n⌯︙ تم تعطيل التنظيف التلقائي ')
return false
end
if text == "@all" or text == "تاك للكل" or text == "all" and CoSu(msg) then
if not bot_data:get(ban_id..'Cick:all'..msg.chat_id_) then
if bot_data:get(ban_id.."S00F4:all:Time"..msg.chat_id_..':'..msg.sender_user_id_) then  
return 
send(msg.chat_id_, msg.id_,"انتظر دقيقه من فضلك")
end
bot_data:setex(ban_id..'S00F4:all:Time'..msg.chat_id_..':'..msg.sender_user_id_,300,true)
tdcli_function({ID="GetChannelFull",channel_id_ = msg.chat_id_:gsub('-100','')},function(argg,dataa) 
tdcli_function({ID = "GetChannelMembers",channel_id_ = msg.chat_id_:gsub('-100',''), offset_ = 0,limit_ = dataa.member_count_},function(ta,sofi)
x = 0
tags = 0
local list = sofi.members_
for k, v in pairs(list) do
tdcli_function({ID="GetUser",user_id_ = v.user_id_},function(arg,data)
if x == 5 or x == tags or k == 0 then
tags = x + 5
t = "#all"
end
x = x + 1
tagname = data.first_name_
tagname = tagname:gsub("]","")
tagname = tagname:gsub("[[]","")
t = t..", ["..tagname.."](tg://user?id="..v.user_id_..")"
if x == 5 or x == tags or k == 0 then
local Text = t:gsub('#all,','#all\n')
sendText(msg.chat_id_,Text,0,'md')
end
end,nil)
end
end,nil)
end,nil)
end
end

if text and text:match("^all (.*)$") or text:match("^@all (.*)$") and CoSu(msg) then 
local ttag = text:match("^all (.*)$") or text:match("^@all (.*)$") 
if not bot_data:get(ban_id..'Cick:all'..msg.chat_id_) then 
if bot_data:get(ban_id.."Boody:all:Time"..msg.chat_id_..':'..msg.sender_user_id_) then   
return  
send(msg.chat_id_, msg.id_,"انتظر دقيقه من فضلك") 
end 
bot_data:setex(ban_id..'Boody:all:Time'..msg.chat_id_..':'..msg.sender_user_id_,300,true) 
tdcli_function({ID="GetChannelFull",channel_id_ = msg.chat_id_:gsub('-100','')},function(argg,dataa)  
tdcli_function({ID = "GetChannelMembers",channel_id_ = msg.chat_id_:gsub('-100',''), offset_ = 0,limit_ = dataa.member_count_},function(ta,ban) 
x = 0 
tags = 0 
local list = ban.members_ 
for k, v in pairs(list) do 
tdcli_function({ID="GetUser",user_id_ = v.user_id_},function(arg,data) 
if x == 5 or x == tags or k == 0 then 
tags = x + 5 
t = "#all "..ttag.."" 
end 
x = x + 1 
tagname = data.first_name_ 
tagname = tagname:gsub("]","") 
tagname = tagname:gsub("[[]","") 
t = t..", ["..tagname.."](tg://user?id="..v.user_id_..")" 
if x == 5 or x == tags or k == 0 then 
local Text = t:gsub('#all '..ttag..',','#all '..ttag..'\n') 
sendText(msg.chat_id_,Text,0,'md') 
end 
end,nil) 
end 
end,nil) 
end,nil) 
end 
end


if text == 'تفعيل الحمايه'and Mod(msg) and msg.reply_to_message_id_ == 0 then 
bot_data:set(ban_id.."lock:Contact"..msg.chat_id_,'del')  
bot_data:set(ban_id.."lock:Spam"..msg.chat_id_,'del')  
bot_data:set(ban_id.."lock:Photo"..msg.chat_id_,'del')  
bot_data:set(ban_id.."lock:forward"..msg.chat_id_,'del')  
bot_data:set(ban_id.."lock:Link"..msg.chat_id_,'del')
bot_data:set(ban_id.."lock:Lock:Sexy"..msg.chat_id_,'del')  
bot_data:set(ban_id..'lock:Fshar'..msg.chat_id_,true) 
bot_data:set(ban_id..'lock:Fars'..msg.chat_id_,true) 
bot_data:set(ban_id.."my_anamen:status"..msg.chat_id_,true) 
bot_data:set(ban_id..'Bot:Id:Photo'..msg.chat_id_,true) 
bot_data:set(ban_id..'ghiktr'..msg.chat_id_,true) 
bot_data:set(ban_id.."lock:Bot:kick"..msg.chat_id_,'kick')  
bot_data:set(ban_id..'lock_edit_med'..msg.chat_id_,true) 
bot_data:set(ban_id.."lock:inline"..msg.chat_id_,'del')  
bot_data:set(ban_id.."lock:Video"..msg.chat_id_,'del')  
bot_data:set(ban_id.."lock:Animation"..msg.chat_id_,'del')  
bot_data:set(ban_id.."lock:Sticker"..msg.chat_id_,'del')  
bot_data:set(ban_id..'Bot:Id:Photo'..msg.chat_id_,true) 
bot_data:set(ban_id.."lock:Video"..msg.chat_id_,'ked')  
bot_data:hset(ban_id.."flooding:settings:"..msg.chat_id_ ,"flood",'mute')  
tdcli_function ({ID = "GetUser",user_id_ = msg.sender_user_id_},function(arg,data) 
send(msg.chat_id_, msg.id_,' ⌯︙ تم تعطيل جلب الصوره ،\n ⌯︙ تم قفل البوتات  ،\n ⌯︙ تم قفل التكرار ،\n ⌯︙ تم قفل الروابط ،\n ⌯︙ تم قفل التوجيه ،\n ⌯︙ تم قفل الملصقات ،\n ⌯︙ تم قفل المتحركه ،\n ⌯︙ تم قفل الفيديو ،\n ⌯︙ تم قفل الفشار ،\n ⌯︙ تم قفل الانلاين ،\n ⌯︙ تم قفل تعديل المديا ،\n ⌯︙ تم وضع التكرار  ،\n ⌯︙ تم قفل الفارسيه  ،\n ⌯︙ تم وضع الايدي بدون صوره ،n  \n ⌯︙ تم تفعيل الحمايه  بواسطه ، [「'..Rutba(msg.sender_user_id_,msg.chat_id_)..'」](T.ME/'..(data.username_ or 'textchuser')..')  ')
end,nil)   
end
if text == 'تعطيل الحمايه'and Mod(msg) and msg.reply_to_message_id_ == 0 then 
bot_data:del(ban_id.."lock:inline"..msg.chat_id_)  
bot_data:del(ban_id.."lock:Lock:Sexy"..msg.chat_id_)  
bot_data:hdel(ban_id.."flooding:settings:"..msg.chat_id_ ,"flood")  
bot_data:set(ban_id..'lock_edit_med'..msg.chat_id_,true) 
bot_data:del(ban_id..'lock:Fshar'..msg.chat_id_) 
bot_data:del(ban_id.."my_anamen:status"..msg.chat_id_) 
bot_data:del(ban_id.."lock:Bot:kick"..msg.chat_id_)  
bot_data:del(ban_id.."lock:Photo"..msg.chat_id_)  
bot_data:del(ban_id.."lock:Video"..msg.chat_id_)  
bot_data:del(ban_id.."lock:Link"..msg.chat_id_)  
bot_data:del(ban_id.."lock:Sticker"..msg.chat_id_)  
bot_data:del(ban_id.."lock:Animation"..msg.chat_id_)  
bot_data:del(ban_id.."lock:forward"..msg.chat_id_)  
bot_data:del(ban_id..'Bot:Id'..msg.chat_id_) 
bot_data:del(ban_id..'Bot:Id:Photo'..msg.chat_id_) 
bot_data:del(ban_id..'ghiktr'..msg.chat_id_) 
tdcli_function ({ID = "GetUser",user_id_ = msg.sender_user_id_},function(arg,data) 
send(msg.chat_id_, msg.id_,' ⌯︙ تم تفعيل جلب الصوره ،\n ⌯︙ تم  فتح البوتات  ،\n ⌯︙ تم  فتح التكرار ،\n ⌯︙ تم  فتح الروابط ،\n ⌯︙ تم  فتح التوجيه ،\n ⌯︙ تم  فتح الملصقات ،\n ⌯︙ تم  فتح المتحركه ،\n ?? تم  فتح الفيديو ،\n ⌯︙ تم  فتح الفشار ،\n ⌯︙ تم  فتح الانلاين ،\n ⌯︙ تم  فتح تعديل المديا ،\n ⌯︙ تم وضع التكرار  ،\n ⌯︙ تم  فتح الفارسيه  ،\n ⌯︙ تم وضع الايدي بصوره،n \n ⌯︙ تم تفعيل الحمايه  بواسطه ، [「'..Rutba(msg.sender_user_id_,msg.chat_id_)..'」](T.ME/'..(data.username_ or 'textchuser')..')  ')
end,nil)   
end
if text == 'تفعيل الحمايه القصوه'and Mod(msg) and msg.reply_to_message_id_ == 0 then 
bot_data:set(ban_id.."lock:text"..msg.chat_id_,true) 
bot_data:set(ban_id.."lock:AddMempar"..msg.chat_id_,'kick')
bot_data:set(ban_id.."lock:Join"..msg.chat_id_,'kick')
bot_data:set(ban_id.."lock:Bot:kick"..msg.chat_id_,'kick')
bot_data:set(ban_id.."lockpin"..msg.chat_id_, true) 
bot_data:sadd(ban_id..'lock:pin',msg.chat_id_) 
bot_data:set(ban_id..'lock:tagservr'..msg.chat_id_,true)  
bot_data:set(ban_id..'lock:Fars'..msg.chat_id_,true) 
bot_data:set(ban_id..'lock:Fshar'..msg.chat_id_,true)
bot_data:set(ban_id..'lock:edit'..msg.chat_id_,true) 
bot_data:set(ban_id.."lock:inline"..msg.chat_id_,'del')
bot_data:set(ban_id.."lock:Lock:Sexy"..msg.chat_id_,'del')
bot_data:del(ban_id.."pp_photo:status"..msg.chat_id_) 
bot_data:del(ban_id.."my_photo:status"..msg.chat_id_) 
bot_data:hset(ban_id.."flooding:settings:"..msg.chat_id_ ,"flood",'keed')  
bot_data:set(ban_id.."lock:Contact"..msg.chat_id_,'ked')  
bot_data:set(ban_id.."lock:Spam"..msg.chat_id_,'ked')  
bot_data:set(ban_id.."lock:forward"..msg.chat_id_,'ked')  
bot_data:set(ban_id.."lock:Keyboard"..msg.chat_id_,'ked')  
bot_data:set(ban_id..'Bot:Id:Photo'..msg.chat_id_,true) 
bot_data:set(ban_id..'Bot:Id:Photo'..msg.chat_id_,true) 
bot_data:set(ban_id.."lock:Photo"..msg.chat_id_,'ked')  
bot_data:set(ban_id.."lock:geam"..msg.chat_id_,'ked')  
bot_data:set(ban_id.."lock:Sticker"..msg.chat_id_,'ktm')  
bot_data:set(ban_id..'ghiktr'..msg.chat_id_,true) 
tdcli_function ({ID = "GetUser",user_id_ = msg.sender_user_id_},function(arg,data) 
send(msg.chat_id_, msg.id_,'تم قفل الحمايه كامله\nتحظير هذا الحمايه تقفل كل حاجه بلتقييد\nتفعيل الحمايه دي بس عند التفليش او التحفيل\nلتعطيل الحمايه القصوه\nاكتب تعطيل الحمايه القوصه\n تم تفعيل الحمايه القصوه من قبل [「'..Rutba(msg.sender_user_id_,msg.chat_id_)..'」](T.ME/'..(data.username_ or 'textchuser')..')  ')
end,nil)   
end
if text == 'تعطيل الحمايه القصوه'and Mod(msg) and msg.reply_to_message_id_ == 0 then 
bot_data:del(ban_id.."lock:Spam"..msg.chat_id_)  
bot_data:del(ban_id.."lock:Join"..msg.chat_id_)  
bot_data:del(ban_id.."lock:text"..msg.chat_id_)  
bot_data:del(ban_id.."lock:AddMempar"..msg.chat_id_)  
bot_data:del(ban_id.."lock:Bot:kick"..msg.chat_id_)  
bot_data:del(ban_id..'lock:edit'..msg.chat_id_)
bot_data:del(ban_id.."lockpin"..msg.chat_id_)  
bot_data:del(ban_id..'lock:Fshar'..msg.chat_id_) 
bot_data:del(ban_id..'lock:Fars'..msg.chat_id_) 
bot_data:del(ban_id.."lock:Link"..msg.chat_id_)  
bot_data:del(ban_id..'sing:for:me'..msg.chat_id_)  
bot_data:del(ban_id.."lock:Photo"..msg.chat_id_)  
bot_data:del(ban_id.."lock:Video"..msg.chat_id_)  
bot_data:del(ban_id.."lock:Sticker"..msg.chat_id_)  
bot_data:del(ban_id.."lock:forward"..msg.chat_id_)  
bot_data:del(ban_id.."lock:geam"..msg.chat_id_)  
bot_data:del(ban_id..'Bot:Id:Photo'..msg.chat_id_) 
bot_data:set(ban_id.."pp_photo:status"..msg.chat_id_,true) 
bot_data:set(ban_id.."my_photo:status"..msg.chat_id_,true) 
bot_data:del(ban_id..'ghiktr'..msg.chat_id_) 
tdcli_function ({ID = "GetUser",user_id_ = msg.sender_user_id_},function(arg,data) 
send(msg.chat_id_, msg.id_,'  تم تعطيل الحمايه القصوه من قبل    [「'..Rutba(msg.sender_user_id_,msg.chat_id_)..'」](T.ME/'..(data.username_ or 'textchuser')..')  ')
end,nil)   
end
if text == 'قفل الدردشه' and msg.reply_to_message_id_ == 0 and Manager(msg) then 
bot_data:set(ban_id.."lock:text"..msg.chat_id_,true) 
tdcli_function ({ID = "GetUser",user_id_ = msg.sender_user_id_},function(arg,data)  
send(msg.chat_id_, msg.id_,' ⌯︙  مـن قبـل  ⋖ [「'..Rutba(msg.sender_user_id_,msg.chat_id_)..'」](T.ME/'..(data.username_ or 'textchuser')..') \n ⌯︙ تـم قفـل الدردشه ')
end,nil)   
elseif text == 'قفل الاضافه' and msg.reply_to_message_id_ == 0 and Mod(msg) then 
bot_data:set(ban_id.."lock:AddMempar"..msg.chat_id_,'kick')  
tdcli_function ({ID = "GetUser",user_id_ = msg.sender_user_id_},function(arg,data) 
send(msg.chat_id_, msg.id_,' ⌯︙  مـن قبـل  ⋖ [「'..Rutba(msg.sender_user_id_,msg.chat_id_)..'」](T.ME/'..(data.username_ or 'textchuser')..') \n ⌯︙| تـم قفـل اضافة ')
end,nil)   
elseif text == 'قفل الدخول' and msg.reply_to_message_id_ == 0 and Mod(msg) then 
bot_data:set(ban_id.."lock:Join"..msg.chat_id_,'kick')  
tdcli_function ({ID = "GetUser",user_id_ = msg.sender_user_id_},function(arg,data) 
send(msg.chat_id_, msg.id_,' ⌯︙  مـن قبـل  ⋖ [「'..Rutba(msg.sender_user_id_,msg.chat_id_)..'」](T.ME/'..(data.username_ or 'textchuser')..') \n ⌯︙ تـم قفـل دخول ')
end,nil)   
elseif text == 'قفل البوتات' and msg.reply_to_message_id_ == 0 and Mod(msg) then 
bot_data:set(ban_id.."lock:Bot:kick"..msg.chat_id_,'del')  
tdcli_function ({ID = "GetUser",user_id_ = msg.sender_user_id_},function(arg,data) 
send(msg.chat_id_, msg.id_,' ⌯︙  مـن قبـل  ⋖ [「'..Rutba(msg.sender_user_id_,msg.chat_id_)..'」](T.ME/'..(data.username_ or 'textchuser')..') \n ⌯︙ تـم قفـل البوتات ')
end,nil)   
elseif text == 'قفل البوتات بالطرد' and msg.reply_to_message_id_ == 0 and Mod(msg) then 
bot_data:set(ban_id.."lock:Bot:kick"..msg.chat_id_,'kick')  
tdcli_function ({ID = "GetUser",user_id_ = msg.sender_user_id_},function(arg,data) 
send(msg.chat_id_, msg.id_,' ⌯︙  مـن قبـل  ⋖ [「'..Rutba(msg.sender_user_id_,msg.chat_id_)..'」](T.ME/'..(data.username_ or 'textchuser')..') \n ⌯︙ تـم قفـل البوتات بالطرد ')
end,nil)   
elseif text == 'قفل الاشعارات' and msg.reply_to_message_id_ == 0 and Mod(msg) then  
bot_data:set(ban_id..'lock:tagservr'..msg.chat_id_,true)  
tdcli_function ({ID = "GetUser",user_id_ = msg.sender_user_id_},function(arg,data) 
send(msg.chat_id_, msg.id_,' ⌯︙  مـن قبـل  ⋖ [「'..Rutba(msg.sender_user_id_,msg.chat_id_)..'」](T.ME/'..(data.username_ or 'textchuser')..') \n ⌯︙ تـم قفـل الاشعارات ')
end,nil)   
elseif text == 'قفل التثبيت' and msg.reply_to_message_id_ == 0 and Constructor(msg) then 
bot_data:set(ban_id.."lockpin"..msg.chat_id_, true) 
bot_data:sadd(ban_id..'lock:pin',msg.chat_id_) 
tdcli_function ({ ID = "GetChannelFull",  channel_id_ = getChatId(msg.chat_id_).ID }, function(arg,data)  bot_data:set(ban_id..'Pin:Id:Msg'..msg.chat_id_,data.pinned_message_id_)  end,nil)
tdcli_function ({ID = "GetUser",user_id_ = msg.sender_user_id_},function(arg,data) 
send(msg.chat_id_, msg.id_,' ⌯︙  مـن قبـل  ⋖ [「'..Rutba(msg.sender_user_id_,msg.chat_id_)..'」](T.ME/'..(data.username_ or 'textchuser')..') \n ⌯︙ تـم قفـل التثبيت ')
end,nil)   
elseif text == 'قفل التعديل' and msg.reply_to_message_id_ == 0 and Constructor(msg) then 
bot_data:set(ban_id..'lock:edit'..msg.chat_id_,true) 
tdcli_function ({ID = "GetUser",user_id_ = msg.sender_user_id_},function(arg,data) 
send(msg.chat_id_, msg.id_,' ⌯︙  مـن قبـل  ⋖ [「'..Rutba(msg.sender_user_id_,msg.chat_id_)..'」](T.ME/'..(data.username_ or 'textchuser')..') \n ⌯︙ تـم قفـل تعديل ')
end,nil)   
elseif text == 'قفل السب' and msg.reply_to_message_id_ == 0 and Manager(msg) then 
bot_data:set(ban_id..'lock:Fshar'..msg.chat_id_,true) 
tdcli_function ({ID = "GetUser",user_id_ = msg.sender_user_id_},function(arg,data) 
send(msg.chat_id_, msg.id_,' ⌯︙  مـن قبـل  ⋖ [「'..Rutba(msg.sender_user_id_,msg.chat_id_)..'」](T.ME/'..(data.username_ or 'textchuser')..') \n ⌯︙ تـم قفـل السب ')
end,nil)  
elseif text == 'قفل المحن' and msg.reply_to_message_id_ == 0 and Manager(msg) then 
bot_data:set(ban_id..'lock:mahn'..msg.chat_id_,true) 
tdcli_function ({ID = "GetUser",user_id_ = msg.sender_user_id_},function(arg,data) 
send(msg.chat_id_, msg.id_,' ⌯︙  مـن قبـل  ⋖ [「'..Rutba(msg.sender_user_id_,msg.chat_id_)..'」](T.ME/'..(data.username_ or 'textchuser')..') \n ⌯︙ تـم قفـل السب ')
end,nil)  
elseif text == 'قفل الازعاج' and msg.reply_to_message_id_ == 0 and Manager(msg) then 
bot_data:set(ban_id..'lock:Azag'..msg.chat_id_,true) 
tdcli_function ({ID = "GetUser",user_id_ = msg.sender_user_id_},function(arg,data) 
send(msg.chat_id_, msg.id_,' ⌯︙  مـن قبـل  ⋖ [「'..Rutba(msg.sender_user_id_,msg.chat_id_)..'」](T.ME/'..(data.username_ or 'textchuser')..') \n ⌯︙ تـم قفـل السب ')
end,nil)  
elseif text == 'قفل الفارسيه' and msg.reply_to_message_id_ == 0 and Manager(msg) then 
bot_data:set(ban_id..'lock:Fars'..msg.chat_id_,true) 
tdcli_function ({ID = "GetUser",user_id_ = msg.sender_user_id_},function(arg,data) 
send(msg.chat_id_, msg.id_,' ⌯︙  مـن قبـل  ⋖ [「'..Rutba(msg.sender_user_id_,msg.chat_id_)..'」](T.ME/'..(data.username_ or 'textchuser')..') \n ⌯︙ تـم قفـل الفارسيه ')
end,nil)   
elseif text == 'قفل الانكليزيه' and msg.reply_to_message_id_ == 0 and Manager(msg) then 
bot_data:set(ban_id..'lock:Engilsh'..msg.chat_id_,true) 
tdcli_function ({ID = "GetUser",user_id_ = msg.sender_user_id_},function(arg,data) 
send(msg.chat_id_, msg.id_,' ⌯︙  مـن قبـل  ⋖ [「'..Rutba(msg.sender_user_id_,msg.chat_id_)..'」](T.ME/'..(data.username_ or 'textchuser')..') \n ⌯︙ تـم قفـل الانكليزيه ')
end,nil)
elseif text == 'قفل الانلاين' and msg.reply_to_message_id_ == 0 and Manager(msg) then 
bot_data:set(ban_id.."lock:inline"..msg.chat_id_,'del')  
tdcli_function ({ID = "GetUser",user_id_ = msg.sender_user_id_},function(arg,data) 
send(msg.chat_id_, msg.id_,' ⌯︙  مـن قبـل  ⋖ [「'..Rutba(msg.sender_user_id_,msg.chat_id_)..'」](T.ME/'..(data.username_ or 'textchuser')..') \n ⌯︙ تـم قفـل الانلاين ')
end,nil)
elseif text == 'قفل تعديل الميديا' and msg.reply_to_message_id_ == 0 and Constructor(msg) then 
bot_data:set(ban_id..'lock_edit_med'..msg.chat_id_,true) 
tdcli_function ({ID = "GetUser",user_id_ = msg.sender_user_id_},function(arg,data) 
send(msg.chat_id_, msg.id_,' ⌯︙  مـن قبـل  ⋖ [「'..Rutba(msg.sender_user_id_,msg.chat_id_)..'」](T.ME/'..(data.username_ or 'textchuser')..') \n ⌯︙ تـم قفـل تعديل ')
end,nil)    
elseif text == 'قفل الكل' and msg.reply_to_message_id_ == 0 and Mod(msg) then 
bot_data:set(ban_id..'lock:tagservrbot'..msg.chat_id_,true)   
list ={"lock:Bot:kick","lock:user:name","lock:hashtak","lsock:Cmd","lock:Link","lock:forward","lock:Keyboard","lock:geam","lock:Photo","lock:Animation","lock:Video","lock:Audio","lock:vico","lock:Sticker","lock:Document","lock:Unsupported","lock:Markdaun","lock:Contact","lock:Spam"}
for i,lock in pairs(list) do 
bot_data:set(ban_id..lock..msg.chat_id_,'del')    
end
tdcli_function ({ID = "GetUser",user_id_ = msg.sender_user_id_},function(arg,data) 
send(msg.chat_id_, msg.id_,' ⌯︙  مـن قبـل  ⋖ [「'..Rutba(msg.sender_user_id_,msg.chat_id_)..'」](T.ME/'..(data.username_ or 'textchuser')..') \n ⌯︙ تـم قفـل جميع الاوامر ')
end,nil)   
end
if text == 'قفل الاباحي' and Mod(msg) and msg.reply_to_message_id_ == 0 then 
bot_data:set(ban_id.."lock:Lock:Sexy"..msg.chat_id_,'del')  
tdcli_function ({ID = "GetUser",user_id_ = msg.sender_user_id_},function(arg,data) 
send(msg.chat_id_, msg.id_,' ⌯︙  مـن قبـل  ⋖ [「'..Rutba(msg.sender_user_id_,msg.chat_id_)..'」](T.ME/'..(data.username_ or 'textchuser')..') \n ⌯︙ تـم قفـل الاباحي ')
end,nil)   
elseif text == 'فتح الاباحي' and Mod(msg) and msg.reply_to_message_id_ == 0 then 
bot_data:del(ban_id.."lock:Lock:Sexy"..msg.chat_id_)  
tdcli_function ({ID = "GetUser",user_id_ = msg.sender_user_id_},function(arg,data) 
send(msg.chat_id_, msg.id_,' ⌯︙  مـن قبـل  ⋖ [「'..Rutba(msg.sender_user_id_,msg.chat_id_)..'」](T.ME/'..(data.username_ or 'textchuser')..') \n ⌯︙ تـم فتح الاباحي ')
end,nil)   
end
if text == 'فتح الانلاين' and msg.reply_to_message_id_ == 0 and Mod(msg) then 
bot_data:del(ban_id.."lock:inline"..msg.chat_id_)  
tdcli_function ({ID = "GetUser",user_id_ = msg.sender_user_id_},function(arg,data) 
send(msg.chat_id_, msg.id_,' ⌯︙  مـن قبـل  ⋖ [「'..Rutba(msg.sender_user_id_,msg.chat_id_)..'」](T.ME/'..(data.username_ or 'textchuser')..') \n ⌯︙ تـم فتح الانلاين ')
end,nil)
elseif text == 'فتح الاضافه' and msg.reply_to_message_id_ == 0 and Mod(msg) then 
bot_data:del(ban_id.."lock:AddMempar"..msg.chat_id_)  
tdcli_function ({ID = "GetUser",user_id_ = msg.sender_user_id_},function(arg,data) 
send(msg.chat_id_, msg.id_,' ⌯︙  مـن قبـل  ⋖ [「'..Rutba(msg.sender_user_id_,msg.chat_id_)..'」](T.ME/'..(data.username_ or 'textchuser')..') \n ⌯︙ تـم فتح اضافة ')
end,nil)   
elseif text == 'فتح الدردشه' and msg.reply_to_message_id_ == 0 and Manager(msg) then 
bot_data:del(ban_id.."lock:text"..msg.chat_id_)  
tdcli_function ({ID = "GetUser",user_id_ = msg.sender_user_id_},function(arg,data) 
send(msg.chat_id_, msg.id_,' ⌯︙  مـن قبـل  ⋖ [「'..Rutba(msg.sender_user_id_,msg.chat_id_)..'」](T.ME/'..(data.username_ or 'textchuser')..') \n ⌯︙ تـم فتح الدردشه ')
end,nil)   
elseif text == 'فتح الدخول' and msg.reply_to_message_id_ == 0 and Mod(msg) then 
bot_data:del(ban_id.."lock:Join"..msg.chat_id_)  
tdcli_function ({ID = "GetUser",user_id_ = msg.sender_user_id_},function(arg,data) 
send(msg.chat_id_, msg.id_,' ⌯︙  مـن قبـل  ⋖ [「'..Rutba(msg.sender_user_id_,msg.chat_id_)..'」](T.ME/'..(data.username_ or 'textchuser')..') \n ⌯︙ تـم فتح دخول ')
end,nil)   
elseif text == 'فتح البوتات' and msg.reply_to_message_id_ == 0 and Mod(msg) then 
bot_data:del(ban_id.."lock:Bot:kick"..msg.chat_id_)  
tdcli_function ({ID = "GetUser",user_id_ = msg.sender_user_id_},function(arg,data) 
send(msg.chat_id_, msg.id_,' ⌯︙  مـن قبـل  ⋖ [「'..Rutba(msg.sender_user_id_,msg.chat_id_)..'」](T.ME/'..(data.username_ or 'textchuser')..') \n ⌯︙ تـم فـتح البوتات ')
end,nil)   
elseif text == 'فتح البوتات بالطرد' and msg.reply_to_message_id_ == 0 and Mod(msg) then 
bot_data:del(ban_id.."lock:Bot:kick"..msg.chat_id_)  
tdcli_function ({ID = "GetUser",user_id_ = msg.sender_user_id_},function(arg,data) 
send(msg.chat_id_, msg.id_,' ⌯︙  مـن قبـل  ⋖ [「'..Rutba(msg.sender_user_id_,msg.chat_id_)..'」](T.ME/'..(data.username_ or 'textchuser')..') \n ⌯︙ تـم فـتح البوتات بالطرد ')
end,nil)   
elseif text == 'فتح الاشعارات' and msg.reply_to_message_id_ == 0 and Mod(msg) then  
bot_data:del(ban_id..'lock:tagservr'..msg.chat_id_)  
tdcli_function ({ID = "GetUser",user_id_ = msg.sender_user_id_},function(arg,data) 
send(msg.chat_id_, msg.id_,' ⌯︙  مـن قبـل  ⋖ [「'..Rutba(msg.sender_user_id_,msg.chat_id_)..'」](T.ME/'..(data.username_ or 'textchuser')..') \n ⌯︙ تـم فـتح الاشعارات ')
end,nil)   
elseif text == 'فتح التثبيت' and msg.reply_to_message_id_ == 0 and Constructor(msg) then 
bot_data:del(ban_id.."lockpin"..msg.chat_id_)  
bot_data:srem(ban_id..'lock:pin',msg.chat_id_)
tdcli_function ({ID = "GetUser",user_id_ = msg.sender_user_id_},function(arg,data) 
send(msg.chat_id_, msg.id_,' ⌯︙  مـن قبـل  ⋖ [「'..Rutba(msg.sender_user_id_,msg.chat_id_)..'」](T.ME/'..(data.username_ or 'textchuser')..') \n ⌯︙ تـم فـتح التثبيت ')
end,nil)   
elseif text == 'فتح التعديل' and msg.reply_to_message_id_ == 0 and Constructor(msg) then 
bot_data:del(ban_id..'lock:edit'..msg.chat_id_) 
tdcli_function ({ID = "GetUser",user_id_ = msg.sender_user_id_},function(arg,data) 
send(msg.chat_id_, msg.id_,' ⌯︙  مـن قبـل  ⋖ [「'..Rutba(msg.sender_user_id_,msg.chat_id_)..'」](T.ME/'..(data.username_ or 'textchuser')..') \n ⌯︙ تـم فـتح تعديل ')
end,nil)   
elseif text == 'فتح السب' and msg.reply_to_message_id_ == 0 and Manager(msg) then 
bot_data:del(ban_id..'lock:Fshar'..msg.chat_id_) 
tdcli_function ({ID = "GetUser",user_id_ = msg.sender_user_id_},function(arg,data) 
send(msg.chat_id_, msg.id_,' ⌯︙  مـن قبـل  ⋖ [「'..Rutba(msg.sender_user_id_,msg.chat_id_)..'」](T.ME/'..(data.username_ or 'textchuser')..') \n ⌯︙ تـم فـتح السب ')
end,nil)   
elseif text == 'فتح المحن' and msg.reply_to_message_id_ == 0 and Manager(msg) then 
bot_data:del(ban_id..'lock:mahn'..msg.chat_id_) 
tdcli_function ({ID = "GetUser",user_id_ = msg.sender_user_id_},function(arg,data) 
send(msg.chat_id_, msg.id_,' ⌯︙  مـن قبـل  ⋖ [「'..Rutba(msg.sender_user_id_,msg.chat_id_)..'」](T.ME/'..(data.username_ or 'textchuser')..') \n ⌯︙ تـم فـتح السب ')
end,nil)   
elseif text == 'فتح الازعاج' and msg.reply_to_message_id_ == 0 and Manager(msg) then 
bot_data:del(ban_id..'lock:Azag'..msg.chat_id_) 
tdcli_function ({ID = "GetUser",user_id_ = msg.sender_user_id_},function(arg,data) 
send(msg.chat_id_, msg.id_,' ⌯︙  مـن قبـل  ⋖ [「'..Rutba(msg.sender_user_id_,msg.chat_id_)..'」](T.ME/'..(data.username_ or 'textchuser')..') \n ⌯︙ تـم فـتح السب ')
end,nil)   
elseif text == 'فتح الفارسيه' and msg.reply_to_message_id_ == 0 and Manager(msg) then 
bot_data:del(ban_id..'lock:Fars'..msg.chat_id_) 
tdcli_function ({ID = "GetUser",user_id_ = msg.sender_user_id_},function(arg,data) 
send(msg.chat_id_, msg.id_,' ⌯︙  مـن قبـل  ⋖ [「'..Rutba(msg.sender_user_id_,msg.chat_id_)..'」](T.ME/'..(data.username_ or 'textchuser')..') \n ⌯︙ تـم فـتح الفارسيه ')
end,nil)   
elseif text == 'فتح الانكليزيه' and msg.reply_to_message_id_ == 0 and Manager(msg) then 
bot_data:del(ban_id..'lock:Engilsh'..msg.chat_id_) 
tdcli_function ({ID = "GetUser",user_id_ = msg.sender_user_id_},function(arg,data) 
send(msg.chat_id_, msg.id_,' ⌯︙  مـن قبـل  ⋖ [「'..Rutba(msg.sender_user_id_,msg.chat_id_)..'」](T.ME/'..(data.username_ or 'textchuser')..') \n ⌯︙ تـم فـتح الانكليزيه ')
end,nil)
elseif text == 'فتح تعديل الميديا' and msg.reply_to_message_id_ == 0 and Constructor(msg) then 
bot_data:del(ban_id..'lock_edit_med'..msg.chat_id_) 
tdcli_function ({ID = "GetUser",user_id_ = msg.sender_user_id_},function(arg,data) 
send(msg.chat_id_, msg.id_,' ⌯︙  مـن قبـل  ⋖ [「'..Rutba(msg.sender_user_id_,msg.chat_id_)..'」](T.ME/'..(data.username_ or 'textchuser')..') \n ⌯︙ تـم فـتح تعديل ')
end,nil)    
elseif text == 'فتح الكل' and msg.reply_to_message_id_ == 0 and Mod(msg) then 
bot_data:del(ban_id..'lock:tagservrbot'..msg.chat_id_)   
list ={"lock:Bot:kick","lock:user:name","lock:hashtak","lock:Cmd","lock:Link","lock:forward","lock:Keyboard","lock:geam","lock:Photo","lock:Animation","lock:Video","lock:Audio","lock:vico","lock:Sticker","lock:Document","lock:Unsupported","lock:Markdaun","lock:Contact","lock:Spam"}
for i,lock in pairs(list) do 
bot_data:del(ban_id..lock..msg.chat_id_)    
end
tdcli_function ({ID = "GetUser",user_id_ = msg.sender_user_id_},function(arg,data) 
send(msg.chat_id_, msg.id_,' ⌯︙  مـن قبـل  ⋖ [「'..Rutba(msg.sender_user_id_,msg.chat_id_)..'」](T.ME/'..(data.username_ or 'textchuser')..') \n ⌯︙ تـم فـتح جميع الاوامر ')
end,nil)   
end
if text == 'قفل الروابط' and Mod(msg) and msg.reply_to_message_id_ == 0 then 
bot_data:set(ban_id.."lock:Link"..msg.chat_id_,'del')  
tdcli_function ({ID = "GetUser",user_id_ = msg.sender_user_id_},function(arg,data) 
send(msg.chat_id_, msg.id_,' ⌯︙  مـن قبـل  ⋖ [「'..Rutba(msg.sender_user_id_,msg.chat_id_)..'」](T.ME/'..(data.username_ or 'textchuser')..') \n ⌯︙ تـم قفـل الروابط ')
end,nil)   
elseif text == 'قفل الروابط بالتقييد' and Mod(msg) and msg.reply_to_message_id_ == 0 then 
bot_data:set(ban_id.."lock:Link"..msg.chat_id_,'ked')  
tdcli_function ({ID = "GetUser",user_id_ = msg.sender_user_id_},function(arg,data) 
send(msg.chat_id_, msg.id_,' ⌯︙  مـن قبـل  ⋖ [「'..Rutba(msg.sender_user_id_,msg.chat_id_)..'」](T.ME/'..(data.username_ or 'textchuser')..') \n ⌯︙ تـم قفـل الروابط بالتقييد ')
end,nil)   
elseif text == 'قفل الروابط بالكتم' and Mod(msg) and msg.reply_to_message_id_ == 0 then 
bot_data:set(ban_id.."lock:Link"..msg.chat_id_,'ktm')  
tdcli_function ({ID = "GetUser",user_id_ = msg.sender_user_id_},function(arg,data) 
send(msg.chat_id_, msg.id_,' ⌯︙  مـن قبـل  ⋖ [「'..Rutba(msg.sender_user_id_,msg.chat_id_)..'」](T.ME/'..(data.username_ or 'textchuser')..') \n ⌯︙ تـم قفـل الروابط بالكتم ')
end,nil)   
elseif text == 'قفل الروابط بالطرد' and Mod(msg) and msg.reply_to_message_id_ == 0 then 
bot_data:set(ban_id.."lock:Link"..msg.chat_id_,'kick')  
tdcli_function ({ID = "GetUser",user_id_ = msg.sender_user_id_},function(arg,data) 
send(msg.chat_id_, msg.id_,' ⌯︙  مـن قبـل  ⋖ [「'..Rutba(msg.sender_user_id_,msg.chat_id_)..'」](T.ME/'..(data.username_ or 'textchuser')..') \n ⌯︙ تـم قفـل الروابط بالطرد ')
end,nil)   
elseif text == 'فتح الروابط' and Mod(msg) and msg.reply_to_message_id_ == 0 then 
bot_data:del(ban_id.."lock:Link"..msg.chat_id_)  
tdcli_function ({ID = "GetUser",user_id_ = msg.sender_user_id_},function(arg,data) 
send(msg.chat_id_, msg.id_,' ⌯︙  مـن قبـل  ⋖ [「'..Rutba(msg.sender_user_id_,msg.chat_id_)..'」](T.ME/'..(data.username_ or 'textchuser')..') \n ⌯︙ تـم فتح الروابط ')
end,nil)   
end
if text == 'قفل المعرفات' and Mod(msg) and msg.reply_to_message_id_ == 0 then 
bot_data:set(ban_id.."lock:user:name"..msg.chat_id_,'del')  
tdcli_function ({ID = "GetUser",user_id_ = msg.sender_user_id_},function(arg,data) 
send(msg.chat_id_, msg.id_,' ⌯︙  مـن قبـل  ⋖ [「'..Rutba(msg.sender_user_id_,msg.chat_id_)..'」](T.ME/'..(data.username_ or 'textchuser')..') \n ⌯︙ تـم قفـل المعرفات ')
end,nil)   
elseif text == 'قفل المعرفات بالتقييد' and Mod(msg) and msg.reply_to_message_id_ == 0 then 
bot_data:set(ban_id.."lock:user:name"..msg.chat_id_,'ked')  
tdcli_function ({ID = "GetUser",user_id_ = msg.sender_user_id_},function(arg,data) 
send(msg.chat_id_, msg.id_,' ⌯︙  مـن قبـل  ⋖ [「'..Rutba(msg.sender_user_id_,msg.chat_id_)..'」](T.ME/'..(data.username_ or 'textchuser')..') \n ⌯︙ تـم قفـل المعرفات بالتقييد ')
end,nil)   
elseif text == 'قفل المعرفات بالكتم' and Mod(msg) and msg.reply_to_message_id_ == 0 then 
bot_data:set(ban_id.."lock:user:name"..msg.chat_id_,'ktm')  
tdcli_function ({ID = "GetUser",user_id_ = msg.sender_user_id_},function(arg,data) 
send(msg.chat_id_, msg.id_,' ⌯︙  مـن قبـل  ⋖ [「'..Rutba(msg.sender_user_id_,msg.chat_id_)..'」](T.ME/'..(data.username_ or 'textchuser')..') \n ⌯︙ تـم قفـل المعرفات بالكتم ')
end,nil)   
elseif text == 'قفل المعرفات بالطرد' and Mod(msg) and msg.reply_to_message_id_ == 0 then 
bot_data:set(ban_id.."lock:user:name"..msg.chat_id_,'kick')  
tdcli_function ({ID = "GetUser",user_id_ = msg.sender_user_id_},function(arg,data) 
send(msg.chat_id_, msg.id_,' ⌯︙  مـن قبـل  ⋖ [「'..Rutba(msg.sender_user_id_,msg.chat_id_)..'」](T.ME/'..(data.username_ or 'textchuser')..') \n ⌯︙ تـم قفـل المعرفات بالطرد ')
end,nil)   
elseif text == 'فتح المعرفات' and Mod(msg) and msg.reply_to_message_id_ == 0 then 
bot_data:del(ban_id.."lock:user:name"..msg.chat_id_)  
tdcli_function ({ID = "GetUser",user_id_ = msg.sender_user_id_},function(arg,data) 
send(msg.chat_id_, msg.id_,' ⌯︙  مـن قبـل  ⋖ [「'..Rutba(msg.sender_user_id_,msg.chat_id_)..'」](T.ME/'..(data.username_ or 'textchuser')..') \n ⌯︙ تـم فتح المعرفات ')
end,nil)   
end
if text == 'تفعيل غنيلي' and CoSu(msg) then   
if bot_data:get(ban_id..'sing:for:me'..msg.chat_id_) then
Text = ' ⌯︙ تم تفعيل امر غنيلي الان ارسل غنيلي'
bot_data:del(ban_id..'sing:for:me'..msg.chat_id_)  
else
Text = ' ⌯︙ بالتاكيد تم تفعيل امر غنيلي تستطيع ارسال غنيلي'
end
send(msg.chat_id_, msg.id_,Text) 
end
if text == 'تعطيل غنيلي' and CoSu(msg) then  
if not bot_data:get(ban_id..'sing:for:me'..msg.chat_id_) then
bot_data:set(ban_id..'sing:for:me'..msg.chat_id_,true)  
Text = '\n ⌯︙ تم تعطيل امر غنيلي'
else
Text = '\n ⌯︙ بالتاكيد تم تعطيل امر غنيلي'
end
send(msg.chat_id_, msg.id_,Text) 
end
if text == 'تفعيل نسبه الحب' and Manager(msg) then   
if bot_data:get(ban_id..'Cick:lov'..msg.chat_id_) then
Text = ' ⌯︙ تم تفعيل نسبه الحب'
bot_data:del(ban_id..'Cick:lov'..msg.chat_id_)  
else
Text = ' ⌯︙ بالتاكيد تم تفعيل نسبه الحب'
end
send(msg.chat_id_, msg.id_,Text) 
end
if text == 'تعطيل نسبه الحب' and Manager(msg) then  
if not bot_data:get(ban_id..'Cick:lov'..msg.chat_id_) then
bot_data:set(ban_id..'Cick:lov'..msg.chat_id_,true)  
Text = '\n ⌯︙ تم تعطيل نسبه الحب'
else
Text = '\n ⌯︙ بالتاكيد تم تعطيل نسبه الحب'
end
send(msg.chat_id_, msg.id_,Text) 
end
if text == 'تفعيل نسبه الرجوله' and Manager(msg) then   
if bot_data:get(ban_id..'Cick:rjo'..msg.chat_id_) then
Text = ' ⌯︙ تم تفعيل نسبه الرجوله'
bot_data:del(ban_id..'Cick:rjo'..msg.chat_id_)  
else
Text = ' ⌯︙ بالتاكيد تم تفعيل الرجوله'
end
send(msg.chat_id_, msg.id_,Text) 
end
if text == 'تعطيل نسبه الرجوله' and Manager(msg) then  
if not bot_data:get(ban_id..'Cick:rjo'..msg.chat_id_) then
bot_data:set(ban_id..'Cick:rjo'..msg.chat_id_,true)  
Text = '\n ⌯︙ تم تعطيل نسبه الرجوله'
else
Text = '\n ⌯︙ بالتاكيد تم تعطيل نسبه الرجوله'
end
send(msg.chat_id_, msg.id_,Text) 
end
if text == 'تفعيل نسبه الكره' and Manager(msg) then   
if bot_data:get(ban_id..'Cick:krh'..msg.chat_id_) then
Text = ' ⌯︙ تم تفعيل نسبه الكره'
bot_data:del(ban_id..'Cick:krh'..msg.chat_id_)  
else
Text = ' ⌯︙ بالتاكيد تم تفعيل نسبه الكره'
end
send(msg.chat_id_, msg.id_,Text) 
end
if text == 'تعطيل نسبه الكره' and Manager(msg) then  
if not bot_data:get(ban_id..'Cick:krh'..msg.chat_id_) then
bot_data:set(ban_id..'Cick:krh'..msg.chat_id_,true)  
Text = '\n ⌯︙ تم تعطيل نسبه الكره'
else
Text = '\n ⌯︙ بالتاكيد تم تعطيل نسبه الكره'
end
send(msg.chat_id_, msg.id_,Text) 
end
if text == 'تفعيل نسبه الانوثه' and Manager(msg) then   
if bot_data:get(ban_id..'Cick:ano'..msg.chat_id_) then
Text = ' ⌯︙ تم تفعيل نسبه الانوثه'
bot_data:del(ban_id..'Cick:ano'..msg.chat_id_)  
else
Text = ' ⌯︙ بالتاكيد تم تفعيل الانوثه'
end
send(msg.chat_id_, msg.id_,Text) 
end
if text == 'تعطيل نسبه الانوثه' and Manager(msg) then  
if not bot_data:get(ban_id..'Cick:ano'..msg.chat_id_) then
bot_data:set(ban_id..'Cick:ano'..msg.chat_id_,true)  
Text = '\n ⌯︙ تم تعطيل نسبه الانوثه'
else
Text = '\n ⌯︙ بالتاكيد تم تعطيل نسبه الانوثه'
end
send(msg.chat_id_, msg.id_,Text) 
end
if text == 'تفعيل all' and CoSu(msg) then   
if bot_data:get(ban_id..'Cick:all'..msg.chat_id_) then
Text = ' ⌯︙ تم تفعيل امر @all'
bot_data:del(ban_id..'Cick:all'..msg.chat_id_)  
else
Text = ' ⌯︙ بالتاكيد تم تفعيل امر @all'
end
send(msg.chat_id_, msg.id_,Text) 
end
if text == 'تعطيل all' and CoSu(msg) then  
if not bot_data:get(ban_id..'Cick:all'..msg.chat_id_) then
bot_data:set(ban_id..'Cick:all'..msg.chat_id_,true)  
Text = '\n ⌯︙ تم تعطيل امر @all'
else
Text = '\n ⌯︙ بالتاكيد تم تعطيل امر @all'
end
send(msg.chat_id_, msg.id_,Text) 
end

if text == 'قفل التاك' and Mod(msg) and msg.reply_to_message_id_ == 0 then 
bot_data:set(ban_id.."lock:hashtak"..msg.chat_id_,'del')  
tdcli_function ({ID = "GetUser",user_id_ = msg.sender_user_id_},function(arg,data) 
send(msg.chat_id_, msg.id_,' ⌯︙  مـن قبـل  ⋖ [「'..Rutba(msg.sender_user_id_,msg.chat_id_)..'」](T.ME/'..(data.username_ or 'textchuser')..') \n ⌯︙ تـم قفـل التاك ')
end,nil)   
elseif text == 'قفل التاك بالتقييد' and Mod(msg) and msg.reply_to_message_id_ == 0 then 
bot_data:set(ban_id.."lock:hashtak"..msg.chat_id_,'ked')  
tdcli_function ({ID = "GetUser",user_id_ = msg.sender_user_id_},function(arg,data) 
send(msg.chat_id_, msg.id_,' ⌯︙  مـن قبـل  ⋖ [「'..Rutba(msg.sender_user_id_,msg.chat_id_)..'」](T.ME/'..(data.username_ or 'textchuser')..') \n ⌯︙ تـم قفـل التاك بالتقييد ')
end,nil)   
elseif text == 'قفل التاك بالكتم' and Mod(msg) and msg.reply_to_message_id_ == 0 then 
bot_data:set(ban_id.."lock:hashtak"..msg.chat_id_,'ktm')  
tdcli_function ({ID = "GetUser",user_id_ = msg.sender_user_id_},function(arg,data) 
send(msg.chat_id_, msg.id_,' ⌯︙  مـن قبـل  ⋖ ['..string.sub(data.first_name_,0,60)..'](T.ME/'..(data.username_ or 'textchuser')..') \n ⌯︙ تـم قفـل التاك بالكتم ')
end,nil)   
elseif text == 'قفل التاك بالطرد' and Mod(msg) and msg.reply_to_message_id_ == 0 then 
bot_data:set(ban_id.."lock:hashtak"..msg.chat_id_,'kick')  
tdcli_function ({ID = "GetUser",user_id_ = msg.sender_user_id_},function(arg,data) 
send(msg.chat_id_, msg.id_,' ⌯︙  مـن قبـل  ⋖ [「'..Rutba(msg.sender_user_id_,msg.chat_id_)..'」](T.ME/'..(data.username_ or 'textchuser')..') \n ⌯︙ تـم قفـل التاك بالطرد ')
end,nil)   
elseif text == 'فتح التاك' and Mod(msg) and msg.reply_to_message_id_ == 0 then 
bot_data:del(ban_id.."lock:hashtak"..msg.chat_id_)  
tdcli_function ({ID = "GetUser",user_id_ = msg.sender_user_id_},function(arg,data) 
send(msg.chat_id_, msg.id_,' ⌯︙  مـن قبـل  ⋖ [「'..Rutba(msg.sender_user_id_,msg.chat_id_)..'」](T.ME/'..(data.username_ or 'textchuser')..') \n ⌯︙ تـم فتح التاك ')
end,nil)   
end
if text == 'قفل الشارحه' and Mod(msg) and msg.reply_to_message_id_ == 0 then 
bot_data:set(ban_id.."lock:Cmd"..msg.chat_id_,'del')  
tdcli_function ({ID = "GetUser",user_id_ = msg.sender_user_id_},function(arg,data) 
send(msg.chat_id_, msg.id_,' ⌯︙  مـن قبـل  ⋖ [「'..Rutba(msg.sender_user_id_,msg.chat_id_)..'」](T.ME/'..(data.username_ or 'textchuser')..') \n ⌯︙ تـم قفـل الشارحه ')
end,nil)   
elseif text == 'قفل الشارحه بالتقييد' and Mod(msg) and msg.reply_to_message_id_ == 0 then 
bot_data:set(ban_id.."lock:Cmd"..msg.chat_id_,'ked')  
tdcli_function ({ID = "GetUser",user_id_ = msg.sender_user_id_},function(arg,data) 
send(msg.chat_id_, msg.id_,' ⌯︙  مـن قبـل  ⋖ [「'..Rutba(msg.sender_user_id_,msg.chat_id_)..'」](T.ME/'..(data.username_ or 'textchuser')..') \n ⌯︙ تـم قفـل الشارحه بالتقييد ')
end,nil)   
elseif text == 'قفل الشارحه بالكتم' and Mod(msg) and msg.reply_to_message_id_ == 0 then 
bot_data:set(ban_id.."lock:Cmd"..msg.chat_id_,'ktm')  
tdcli_function ({ID = "GetUser",user_id_ = msg.sender_user_id_},function(arg,data) 
send(msg.chat_id_, msg.id_,' ⌯︙  مـن قبـل  ⋖ [「'..Rutba(msg.sender_user_id_,msg.chat_id_)..'」](T.ME/'..(data.username_ or 'textchuser')..') \n ⌯︙ تـم قفـل الشارحه بالكتم ')
end,nil)   
elseif text == 'قفل الشارحه بالطرد' and Mod(msg) and msg.reply_to_message_id_ == 0 then 
bot_data:set(ban_id.."lock:Cmd"..msg.chat_id_,'kick')  
tdcli_function ({ID = "GetUser",user_id_ = msg.sender_user_id_},function(arg,data) 
send(msg.chat_id_, msg.id_,' ⌯︙  مـن قبـل  ⋖ [「'..Rutba(msg.sender_user_id_,msg.chat_id_)..'」](T.ME/'..(data.username_ or 'textchuser')..') \n ⌯︙ تـم قفـل الشارحه بالطرد ')
end,nil)   
elseif text == 'فتح الشارحه' and Mod(msg) and msg.reply_to_message_id_ == 0 then 
bot_data:del(ban_id.."lock:Cmd"..msg.chat_id_)  
tdcli_function ({ID = "GetUser",user_id_ = msg.sender_user_id_},function(arg,data) 
send(msg.chat_id_, msg.id_,' ⌯︙  مـن قبـل  ⋖ [「'..Rutba(msg.sender_user_id_,msg.chat_id_)..'」](T.ME/'..(data.username_ or 'textchuser')..') \n ⌯︙ تـم فتح الشارحه ')
end,nil)   
end
if text == 'قفل الصور'and Mod(msg) and msg.reply_to_message_id_ == 0 then 
bot_data:set(ban_id.."lock:Photo"..msg.chat_id_,'del')  
tdcli_function ({ID = "GetUser",user_id_ = msg.sender_user_id_},function(arg,data) 
send(msg.chat_id_, msg.id_,' ⌯︙  مـن قبـل  ⋖ [「'..Rutba(msg.sender_user_id_,msg.chat_id_)..'」](T.ME/'..(data.username_ or 'textchuser')..') \n ⌯︙ تـم قفـل الصور ')
end,nil)   
elseif text == 'قفل الصور بالتقييد' and Mod(msg) and msg.reply_to_message_id_ == 0 then 
bot_data:set(ban_id.."lock:Photo"..msg.chat_id_,'ked')  
tdcli_function ({ID = "GetUser",user_id_ = msg.sender_user_id_},function(arg,data) 
send(msg.chat_id_, msg.id_,' ⌯︙  مـن قبـل  ⋖ [「'..Rutba(msg.sender_user_id_,msg.chat_id_)..'」](T.ME/'..(data.username_ or 'textchuser')..') \n ⌯︙ تـم قفـل الصور بالتقييد ')
end,nil)   
elseif text == 'قفل الصور بالكتم' and Mod(msg) and msg.reply_to_message_id_ == 0 then 
bot_data:set(ban_id.."lock:Photo"..msg.chat_id_,'ktm')  
tdcli_function ({ID = "GetUser",user_id_ = msg.sender_user_id_},function(arg,data) 
send(msg.chat_id_, msg.id_,' ⌯︙  مـن قبـل  ⋖ [「'..Rutba(msg.sender_user_id_,msg.chat_id_)..'」](T.ME/'..(data.username_ or 'textchuser')..') \n ⌯︙ تـم قفـل الصور بالكتم ')
end,nil)   
elseif text == 'قفل الصور بالطرد' and Mod(msg) and msg.reply_to_message_id_ == 0 then 
bot_data:set(ban_id.."lock:Photo"..msg.chat_id_,'kick')  
tdcli_function ({ID = "GetUser",user_id_ = msg.sender_user_id_},function(arg,data) 
send(msg.chat_id_, msg.id_,' ⌯︙  مـن قبـل  ⋖ [「'..Rutba(msg.sender_user_id_,msg.chat_id_)..'」](T.ME/'..(data.username_ or 'textchuser')..') \n ⌯︙ تـم قفـل الصور بالطرد ')
end,nil)   
elseif text == 'فتح الصور' and Mod(msg) and msg.reply_to_message_id_ == 0 then 
bot_data:del(ban_id.."lock:Photo"..msg.chat_id_)  
tdcli_function ({ID = "GetUser",user_id_ = msg.sender_user_id_},function(arg,data) 
send(msg.chat_id_, msg.id_,' ⌯︙  مـن قبـل  ⋖ [「'..Rutba(msg.sender_user_id_,msg.chat_id_)..'」](T.ME/'..(data.username_ or 'textchuser')..') \n ⌯︙ تـم فتح الصور ')
end,nil)   
end
if text == 'قفل الفيديو' and Mod(msg) and msg.reply_to_message_id_ == 0 then 
bot_data:set(ban_id.."lock:Video"..msg.chat_id_,'del')  
tdcli_function ({ID = "GetUser",user_id_ = msg.sender_user_id_},function(arg,data) 
send(msg.chat_id_, msg.id_,' ⌯︙  مـن قبـل  ⋖ [「'..Rutba(msg.sender_user_id_,msg.chat_id_)..'」](T.ME/'..(data.username_ or 'textchuser')..') \n ⌯︙ تـم قفـل الفيديو ')
end,nil)   
elseif text == 'قفل الفيديو بالتقييد' and Mod(msg) and msg.reply_to_message_id_ == 0 then 
bot_data:set(ban_id.."lock:Video"..msg.chat_id_,'ked')  
tdcli_function ({ID = "GetUser",user_id_ = msg.sender_user_id_},function(arg,data) 
send(msg.chat_id_, msg.id_,' ⌯︙  مـن قبـل  ⋖ [「'..Rutba(msg.sender_user_id_,msg.chat_id_)..'」](T.ME/'..(data.username_ or 'textchuser')..') \n ⌯︙ تـم قفـل الفيديو بالتقييد ')
end,nil)   
elseif text == 'قفل الفيديو بالكتم' and Mod(msg) and msg.reply_to_message_id_ == 0 then 
bot_data:set(ban_id.."lock:Video"..msg.chat_id_,'ktm')  
tdcli_function ({ID = "GetUser",user_id_ = msg.sender_user_id_},function(arg,data) 
send(msg.chat_id_, msg.id_,' ⌯︙  مـن قبـل  ⋖ [「'..Rutba(msg.sender_user_id_,msg.chat_id_)..'」](T.ME/'..(data.username_ or 'textchuser')..') \n ⌯︙ تـم قفـل الفيديو بالكتم ')
end,nil)   
elseif text == 'قفل الفيديو بالطرد' and Mod(msg) and msg.reply_to_message_id_ == 0 then 
bot_data:set(ban_id.."lock:Video"..msg.chat_id_,'kick')  
tdcli_function ({ID = "GetUser",user_id_ = msg.sender_user_id_},function(arg,data) 
send(msg.chat_id_, msg.id_,' ⌯︙  مـن قبـل  ⋖ [「'..Rutba(msg.sender_user_id_,msg.chat_id_)..'」](T.ME/'..(data.username_ or 'textchuser')..') \n ⌯︙ تـم قفـل الفيديو بالطرد ')
end,nil)   
elseif text == 'فتح الفيديو' and Mod(msg) and msg.reply_to_message_id_ == 0 then 
bot_data:del(ban_id.."lock:Video"..msg.chat_id_)  
tdcli_function ({ID = "GetUser",user_id_ = msg.sender_user_id_},function(arg,data) 
send(msg.chat_id_, msg.id_,' ⌯︙  مـن قبـل  ⋖ [「'..Rutba(msg.sender_user_id_,msg.chat_id_)..'」](T.ME/'..(data.username_ or 'textchuser')..') \n ⌯︙ تـم فتح الفيديو ')
end,nil)   
end
if text == 'قفل المتحركه' and Mod(msg) and msg.reply_to_message_id_ == 0 then 
bot_data:set(ban_id.."lock:Animation"..msg.chat_id_,'del')  
tdcli_function ({ID = "GetUser",user_id_ = msg.sender_user_id_},function(arg,data) 
send(msg.chat_id_, msg.id_,' ⌯︙  مـن قبـل  ⋖ [「'..Rutba(msg.sender_user_id_,msg.chat_id_)..'」](T.ME/'..(data.username_ or 'textchuser')..') \n ⌯︙ تـم قفـل المتحركه ')
end,nil)   
elseif text == 'قفل المتحركه بالتقييد' and Mod(msg) and msg.reply_to_message_id_ == 0 then 
bot_data:set(ban_id.."lock:Animation"..msg.chat_id_,'ked')  
tdcli_function ({ID = "GetUser",user_id_ = msg.sender_user_id_},function(arg,data) 
send(msg.chat_id_, msg.id_,' ⌯︙  مـن قبـل  ⋖ [「'..Rutba(msg.sender_user_id_,msg.chat_id_)..'」](T.ME/'..(data.username_ or 'textchuser')..') \n ⌯︙ تـم قفـل المتحركه بالتقييد ')
end,nil)   
elseif text == 'قفل المتحركه بالكتم' and Mod(msg) and msg.reply_to_message_id_ == 0 then 
bot_data:set(ban_id.."lock:Animation"..msg.chat_id_,'ktm')  
tdcli_function ({ID = "GetUser",user_id_ = msg.sender_user_id_},function(arg,data) 
send(msg.chat_id_, msg.id_,' ⌯︙  مـن قبـل  ⋖ [「'..Rutba(msg.sender_user_id_,msg.chat_id_)..'」](T.ME/'..(data.username_ or 'textchuser')..') \n ⌯︙ تـم قفـل المتحركه بالكتم ')
end,nil)   
elseif text == 'قفل المتحركه بالطرد' and Mod(msg) and msg.reply_to_message_id_ == 0 then 
bot_data:set(ban_id.."lock:Animation"..msg.chat_id_,'kick')  
tdcli_function ({ID = "GetUser",user_id_ = msg.sender_user_id_},function(arg,data) 
send(msg.chat_id_, msg.id_,' ⌯︙  مـن قبـل  ⋖ [「'..Rutba(msg.sender_user_id_,msg.chat_id_)..'」](T.ME/'..(data.username_ or 'textchuser')..') \n ⌯︙ تـم قفـل المتحركه بالطرد ')
end,nil)   
elseif text == 'فتح المتحركه' and Mod(msg) and msg.reply_to_message_id_ == 0 then 
bot_data:del(ban_id.."lock:Animation"..msg.chat_id_)  
tdcli_function ({ID = "GetUser",user_id_ = msg.sender_user_id_},function(arg,data) 
send(msg.chat_id_, msg.id_,' ⌯︙  مـن قبـل  ⋖ [「'..Rutba(msg.sender_user_id_,msg.chat_id_)..'」](T.ME/'..(data.username_ or 'textchuser')..') \n ⌯︙ تـم فتح المتحركه ')
end,nil)   
end
if text == 'قفل الالعاب' and Mod(msg) and msg.reply_to_message_id_ == 0 then 
bot_data:set(ban_id.."lock:geam"..msg.chat_id_,'del')  
tdcli_function ({ID = "GetUser",user_id_ = msg.sender_user_id_},function(arg,data) 
send(msg.chat_id_, msg.id_,' ⌯︙  مـن قبـل  ⋖ [「'..Rutba(msg.sender_user_id_,msg.chat_id_)..'」](T.ME/'..(data.username_ or 'textchuser')..') \n ⌯︙ تـم قفـل الالعاب ')
end,nil)   
elseif text == 'قفل الالعاب بالتقييد' and Mod(msg) and msg.reply_to_message_id_ == 0 then 
bot_data:set(ban_id.."lock:geam"..msg.chat_id_,'ked')  
tdcli_function ({ID = "GetUser",user_id_ = msg.sender_user_id_},function(arg,data) 
send(msg.chat_id_, msg.id_,' ⌯︙  مـن قبـل  ⋖ [「'..Rutba(msg.sender_user_id_,msg.chat_id_)..'」](T.ME/'..(data.username_ or 'textchuser')..') \n ⌯︙ تـم قفـل الالعاب بالتقييد ')
end,nil)   
elseif text == 'قفل الالعاب بالكتم' and Mod(msg) and msg.reply_to_message_id_ == 0 then 
bot_data:set(ban_id.."lock:geam"..msg.chat_id_,'ktm')  
tdcli_function ({ID = "GetUser",user_id_ = msg.sender_user_id_},function(arg,data) 
send(msg.chat_id_, msg.id_,' ⌯︙  مـن قبـل  ⋖ [「'..Rutba(msg.sender_user_id_,msg.chat_id_)..'」](T.ME/'..(data.username_ or 'textchuser')..') \n ⌯︙ تـم قفـل الالعاب بالكتم ')
end,nil)   
elseif text == 'قفل الالعاب بالطرد' and Mod(msg) and msg.reply_to_message_id_ == 0 then 
bot_data:set(ban_id.."lock:geam"..msg.chat_id_,'kick')  
tdcli_function ({ID = "GetUser",user_id_ = msg.sender_user_id_},function(arg,data) 
send(msg.chat_id_, msg.id_,' ⌯︙  مـن قبـل  ⋖ [「'..Rutba(msg.sender_user_id_,msg.chat_id_)..'」](T.ME/'..(data.username_ or 'textchuser')..') \n ⌯︙ تـم قفـل الالعاب بالطرد ')
end,nil)   
elseif text == 'فتح الالعاب' and Mod(msg) and msg.reply_to_message_id_ == 0 then 
bot_data:del(ban_id.."lock:geam"..msg.chat_id_)  
tdcli_function ({ID = "GetUser",user_id_ = msg.sender_user_id_},function(arg,data) 
send(msg.chat_id_, msg.id_,' ⌯︙  مـن قبـل  ⋖ [「'..Rutba(msg.sender_user_id_,msg.chat_id_)..'」](T.ME/'..(data.username_ or 'textchuser')..') \n ⌯︙ تـم فتح الالعاب ')
end,nil)   
end
if text == 'قفل الاغاني' and Mod(msg) and msg.reply_to_message_id_ == 0 then 
bot_data:set(ban_id.."lock:Audio"..msg.chat_id_,'del')  
tdcli_function ({ID = "GetUser",user_id_ = msg.sender_user_id_},function(arg,data) 
send(msg.chat_id_, msg.id_,' ⌯︙  مـن قبـل  ⋖ [「'..Rutba(msg.sender_user_id_,msg.chat_id_)..'」](T.ME/'..(data.username_ or 'textchuser')..') \n ⌯︙ تـم قفـل الاغاني ')
end,nil)   
elseif text == 'قفل الاغاني بالتقييد' and Mod(msg) and msg.reply_to_message_id_ == 0 then 
bot_data:set(ban_id.."lock:Audio"..msg.chat_id_,'ked')  
tdcli_function ({ID = "GetUser",user_id_ = msg.sender_user_id_},function(arg,data) 
send(msg.chat_id_, msg.id_,' ⌯︙  مـن قبـل  ⋖ [「'..Rutba(msg.sender_user_id_,msg.chat_id_)..'」](T.ME/'..(data.username_ or 'textchuser')..') \n ⌯︙ تـم قفـل الاغاني بالتقييد ')
end,nil)   
elseif text == 'قفل الاغاني بالكتم' and Mod(msg) and msg.reply_to_message_id_ == 0 then 
bot_data:set(ban_id.."lock:Audio"..msg.chat_id_,'ktm')  
tdcli_function ({ID = "GetUser",user_id_ = msg.sender_user_id_},function(arg,data) 
send(msg.chat_id_, msg.id_,' ⌯︙  مـن قبـل  ⋖ [「'..Rutba(msg.sender_user_id_,msg.chat_id_)..'」](T.ME/'..(data.username_ or 'textchuser')..') \n ⌯︙ تـم قفـل الاغاني بالكتم ')
end,nil)   
elseif text == 'قفل الاغاني بالطرد' and Mod(msg) and msg.reply_to_message_id_ == 0 then 
bot_data:set(ban_id.."lock:Audio"..msg.chat_id_,'kick')  
tdcli_function ({ID = "GetUser",user_id_ = msg.sender_user_id_},function(arg,data) 
send(msg.chat_id_, msg.id_,' ⌯︙  مـن قبـل  ⋖ [「'..Rutba(msg.sender_user_id_,msg.chat_id_)..'」](T.ME/'..(data.username_ or 'textchuser')..') \n ⌯︙ تـم قفـل الاغاني بالطرد ')
end,nil)   
elseif text == 'فتح الاغاني' and Mod(msg) and msg.reply_to_message_id_ == 0 then 
bot_data:del(ban_id.."lock:Audio"..msg.chat_id_)  
tdcli_function ({ID = "GetUser",user_id_ = msg.sender_user_id_},function(arg,data) 
send(msg.chat_id_, msg.id_,' ⌯︙  مـن قبـل  ⋖ [「'..Rutba(msg.sender_user_id_,msg.chat_id_)..'」](T.ME/'..(data.username_ or 'textchuser')..') \n ⌯︙ تـم فتح الاغاني ')
end,nil)   
end
if text == 'قفل الصوت' and Mod(msg) and msg.reply_to_message_id_ == 0 then 
bot_data:set(ban_id.."lock:vico"..msg.chat_id_,'del')  
tdcli_function ({ID = "GetUser",user_id_ = msg.sender_user_id_},function(arg,data) 
send(msg.chat_id_, msg.id_,' ⌯︙  مـن قبـل  ⋖ [「'..Rutba(msg.sender_user_id_,msg.chat_id_)..'」](T.ME/'..(data.username_ or 'textchuser')..') \n ⌯︙ تـم قفـل الصوت ')
end,nil)   
elseif text == 'قفل الصوت بالتقييد' and Mod(msg) and msg.reply_to_message_id_ == 0 then 
bot_data:set(ban_id.."lock:vico"..msg.chat_id_,'ked')  
tdcli_function ({ID = "GetUser",user_id_ = msg.sender_user_id_},function(arg,data) 
send(msg.chat_id_, msg.id_,' ⌯︙  مـن قبـل  ⋖ [「'..Rutba(msg.sender_user_id_,msg.chat_id_)..'」](T.ME/'..(data.username_ or 'textchuser')..') \n ⌯︙ تـم قفـل الصوت بالتقييد ')
end,nil)   
elseif text == 'قفل الصوت بالكتم' and Mod(msg) and msg.reply_to_message_id_ == 0 then 
bot_data:set(ban_id.."lock:vico"..msg.chat_id_,'ktm')  
tdcli_function ({ID = "GetUser",user_id_ = msg.sender_user_id_},function(arg,data) 
send(msg.chat_id_, msg.id_,' ⌯︙  مـن قبـل  ⋖ [「'..Rutba(msg.sender_user_id_,msg.chat_id_)..'」](T.ME/'..(data.username_ or 'textchuser')..') \n ⌯︙ تـم قفـل الصوت بالكتم ')
end,nil)   
elseif text == 'قفل الصوت بالطرد' and Mod(msg) and msg.reply_to_message_id_ == 0 then 
bot_data:set(ban_id.."lock:vico"..msg.chat_id_,'kick')  
tdcli_function ({ID = "GetUser",user_id_ = msg.sender_user_id_},function(arg,data) 
send(msg.chat_id_, msg.id_,' ⌯︙  مـن قبـل  ⋖ [「'..Rutba(msg.sender_user_id_,msg.chat_id_)..'」](T.ME/'..(data.username_ or 'textchuser')..') \n ⌯︙ تـم قفـل الصوت بالطرد ')
end,nil)   
elseif text == 'فتح الصوت' and Mod(msg) and msg.reply_to_message_id_ == 0 then 
bot_data:del(ban_id.."lock:vico"..msg.chat_id_)  
tdcli_function ({ID = "GetUser",user_id_ = msg.sender_user_id_},function(arg,data) 
send(msg.chat_id_, msg.id_,' ⌯︙  مـن قبـل  ⋖ [「'..Rutba(msg.sender_user_id_,msg.chat_id_)..'」](T.ME/'..(data.username_ or 'textchuser')..') \n ⌯︙ تـم فتح الصوت ')
end,nil)   
end
if text == 'قفل الكيبورد' and Mod(msg) and msg.reply_to_message_id_ == 0 then 
bot_data:set(ban_id.."lock:Keyboard"..msg.chat_id_,'del')  
tdcli_function ({ID = "GetUser",user_id_ = msg.sender_user_id_},function(arg,data) 
send(msg.chat_id_, msg.id_,' ⌯︙  مـن قبـل  ⋖ [「'..Rutba(msg.sender_user_id_,msg.chat_id_)..'」](T.ME/'..(data.username_ or 'textchuser')..') \n ⌯︙ تـم قفـل الكيبورد ')
end,nil)   
elseif text == 'قفل الكيبورد بالتقييد' and Mod(msg) and msg.reply_to_message_id_ == 0 then 
bot_data:set(ban_id.."lock:Keyboard"..msg.chat_id_,'ked')  
tdcli_function ({ID = "GetUser",user_id_ = msg.sender_user_id_},function(arg,data) 
send(msg.chat_id_, msg.id_,' ⌯︙  مـن قبـل  ⋖ [「'..Rutba(msg.sender_user_id_,msg.chat_id_)..'」](T.ME/'..(data.username_ or 'textchuser')..') \n ⌯︙ تـم قفـل الكيبورد بالتقييد ')
end,nil)   
elseif text == 'قفل الكيبورد بالكتم' and Mod(msg) and msg.reply_to_message_id_ == 0 then 
bot_data:set(ban_id.."lock:Keyboard"..msg.chat_id_,'ktm')  
tdcli_function ({ID = "GetUser",user_id_ = msg.sender_user_id_},function(arg,data) 
send(msg.chat_id_, msg.id_,' ⌯︙  مـن قبـل  ⋖ [「'..Rutba(msg.sender_user_id_,msg.chat_id_)..'」](T.ME/'..(data.username_ or 'textchuser')..') \n ⌯︙ تـم قفـل الكيبورد بالكتم ')  
end,nil)   
elseif text == 'قفل الكيبورد بالطرد' and Mod(msg) and msg.reply_to_message_id_ == 0 then 
bot_data:set(ban_id.."lock:Keyboard"..msg.chat_id_,'kick')  
tdcli_function ({ID = "GetUser",user_id_ = msg.sender_user_id_},function(arg,data) 
send(msg.chat_id_, msg.id_,' ⌯︙  مـن قبـل  ⋖ [「'..Rutba(msg.sender_user_id_,msg.chat_id_)..'」](T.ME/'..(data.username_ or 'textchuser')..') \n ⌯︙ تـم قفـل الكيبورد بالطرد ')  
end,nil)   
elseif text == 'فتح الكيبورد' and Mod(msg) and msg.reply_to_message_id_ == 0 then 
bot_data:del(ban_id.."lock:Keyboard"..msg.chat_id_)  
tdcli_function ({ID = "GetUser",user_id_ = msg.sender_user_id_},function(arg,data) 
send(msg.chat_id_, msg.id_,' ⌯︙  مـن قبـل  ⋖ [「'..Rutba(msg.sender_user_id_,msg.chat_id_)..'」](T.ME/'..(data.username_ or 'textchuser')..') \n ⌯︙ تـم فتح الكيبورد ')  
end,nil)   
end
if text == 'قفل الملصقات' and Mod(msg) and msg.reply_to_message_id_ == 0 then 
bot_data:set(ban_id.."lock:Sticker"..msg.chat_id_,'del')  
tdcli_function ({ID = "GetUser",user_id_ = msg.sender_user_id_},function(arg,data) 
send(msg.chat_id_, msg.id_,' ⌯︙  مـن قبـل  ⋖ [「'..Rutba(msg.sender_user_id_,msg.chat_id_)..'」](T.ME/'..(data.username_ or 'textchuser')..') \n ⌯︙ تـم قفـل الملصقات ')  
end,nil)   
elseif text == 'قفل الملصقات بالتقييد' and Mod(msg) and msg.reply_to_message_id_ == 0 then 
bot_data:set(ban_id.."lock:Sticker"..msg.chat_id_,'ked')  
tdcli_function ({ID = "GetUser",user_id_ = msg.sender_user_id_},function(arg,data) 
send(msg.chat_id_, msg.id_,' ⌯︙  مـن قبـل  ⋖ [「'..Rutba(msg.sender_user_id_,msg.chat_id_)..'」](T.ME/'..(data.username_ or 'textchuser')..') \n ⌯︙ تـم قفـل الملصقات بالتقييد ')  
end,nil)
elseif text == 'قفل الملصقات بالكتم' and Mod(msg) and msg.reply_to_message_id_ == 0 then 
bot_data:set(ban_id.."lock:Sticker"..msg.chat_id_,'ktm')  
tdcli_function ({ID = "GetUser",user_id_ = msg.sender_user_id_},function(arg,data) 
send(msg.chat_id_, msg.id_,' ⌯︙  مـن قبـل  ⋖ [「'..Rutba(msg.sender_user_id_,msg.chat_id_)..'」](T.ME/'..(data.username_ or 'textchuser')..') \n ⌯︙ تـم قفـل الملصقات بالكتم ')  
end,nil)   
elseif text == 'قفل الملصقات بالطرد' and Mod(msg) and msg.reply_to_message_id_ == 0 then 
bot_data:set(ban_id.."lock:Sticker"..msg.chat_id_,'kick')  
tdcli_function ({ID = "GetUser",user_id_ = msg.sender_user_id_},function(arg,data) 
send(msg.chat_id_, msg.id_,' ⌯︙  مـن قبـل  ⋖ [「'..Rutba(msg.sender_user_id_,msg.chat_id_)..'」](T.ME/'..(data.username_ or 'textchuser')..') \n ⌯︙ تـم قفـل الملصقات بالطرد ')  
end,nil)   
elseif text == 'فتح الملصقات' and Mod(msg) and msg.reply_to_message_id_ == 0 then 
bot_data:del(ban_id.."lock:Sticker"..msg.chat_id_)  
tdcli_function ({ID = "GetUser",user_id_ = msg.sender_user_id_},function(arg,data) 
send(msg.chat_id_, msg.id_,' ⌯︙  مـن قبـل  ⋖ [「'..Rutba(msg.sender_user_id_,msg.chat_id_)..'」](T.ME/'..(data.username_ or 'textchuser')..') \n ⌯︙ تـم فتح الملصقات ')  
end,nil)   
end
if text == 'قفل التوجيه' and Mod(msg) and msg.reply_to_message_id_ == 0 then 
bot_data:set(ban_id.."lock:forward"..msg.chat_id_,'del')  
tdcli_function ({ID = "GetUser",user_id_ = msg.sender_user_id_},function(arg,data) 
send(msg.chat_id_, msg.id_,' ⌯︙  مـن قبـل  ⋖ [「'..Rutba(msg.sender_user_id_,msg.chat_id_)..'」](T.ME/'..(data.username_ or 'textchuser')..') \n ⌯︙ تـم قفـل التوجيه ')  
end,nil)   
elseif text == 'قفل التوجيه بالتقييد' and Mod(msg) and msg.reply_to_message_id_ == 0 then 
bot_data:set(ban_id.."lock:forward"..msg.chat_id_,'ked')  
tdcli_function ({ID = "GetUser",user_id_ = msg.sender_user_id_},function(arg,data) 
send(msg.chat_id_, msg.id_,' ⌯︙  مـن قبـل  ⋖ [「'..Rutba(msg.sender_user_id_,msg.chat_id_)..'」](T.ME/'..(data.username_ or 'textchuser')..') \n ⌯︙ تـم قفـل التوجيه بالتقييد ')  
end,nil)
elseif text == 'قفل التوجيه بالكتم' and Mod(msg) and msg.reply_to_message_id_ == 0 then 
bot_data:set(ban_id.."lock:forward"..msg.chat_id_,'ktm')  
tdcli_function ({ID = "GetUser",user_id_ = msg.sender_user_id_},function(arg,data) 
send(msg.chat_id_, msg.id_,' ⌯︙  مـن قبـل  ⋖ [「'..Rutba(msg.sender_user_id_,msg.chat_id_)..'」](T.ME/'..(data.username_ or 'textchuser')..') \n ⌯︙ تـم قفـل التوجيه بالكتم ')  
end,nil)   
elseif text == 'قفل التوجيه بالطرد' and Mod(msg) and msg.reply_to_message_id_ == 0 then 
bot_data:set(ban_id.."lock:forward"..msg.chat_id_,'kick')  
tdcli_function ({ID = "GetUser",user_id_ = msg.sender_user_id_},function(arg,data) 
send(msg.chat_id_, msg.id_,' ⌯︙  مـن قبـل  ⋖ [「'..Rutba(msg.sender_user_id_,msg.chat_id_)..'」](T.ME/'..(data.username_ or 'textchuser')..') \n ⌯︙ تـم قفـل التوجيه بالطرد ')  
end,nil)   
elseif text == 'فتح التوجيه' and Mod(msg) and msg.reply_to_message_id_ == 0 then 
bot_data:del(ban_id.."lock:forward"..msg.chat_id_)  
tdcli_function ({ID = "GetUser",user_id_ = msg.sender_user_id_},function(arg,data) 
send(msg.chat_id_, msg.id_,' ⌯︙  مـن قبـل  ⋖ [「'..Rutba(msg.sender_user_id_,msg.chat_id_)..'」](T.ME/'..(data.username_ or 'textchuser')..') \n ⌯︙ تـم فتح التوجيه ')  
end,nil)   
end
if text == 'قفل الملفات' and Mod(msg) and msg.reply_to_message_id_ == 0 then 
bot_data:set(ban_id.."lock:Document"..msg.chat_id_,'del')  
tdcli_function ({ID = "GetUser",user_id_ = msg.sender_user_id_},function(arg,data) 
send(msg.chat_id_, msg.id_,' ⌯︙  مـن قبـل  ⋖ [「'..Rutba(msg.sender_user_id_,msg.chat_id_)..'」](T.ME/'..(data.username_ or 'textchuser')..') \n ⌯︙ تـم قفـل الملفات ')  
end,nil)   
elseif text == 'قفل الملفات بالتقييد' and Mod(msg) and msg.reply_to_message_id_ == 0 then 
bot_data:set(ban_id.."lock:Document"..msg.chat_id_,'ked')  
tdcli_function ({ID = "GetUser",user_id_ = msg.sender_user_id_},function(arg,data) 
send(msg.chat_id_, msg.id_,' ⌯︙  مـن قبـل  ⋖ [「'..Rutba(msg.sender_user_id_,msg.chat_id_)..'」](T.ME/'..(data.username_ or 'textchuser')..') \n ⌯︙ تـم قفـل الملفات بالتقييد ')  
end,nil)
elseif text == 'قفل الملفات بالكتم' and Mod(msg) and msg.reply_to_message_id_ == 0 then 
bot_data:set(ban_id.."lock:Document"..msg.chat_id_,'ktm')  
tdcli_function ({ID = "GetUser",user_id_ = msg.sender_user_id_},function(arg,data) 
send(msg.chat_id_, msg.id_,' ⌯︙  مـن قبـل  ⋖ [「'..Rutba(msg.sender_user_id_,msg.chat_id_)..'」](T.ME/'..(data.username_ or 'textchuser')..') \n ⌯︙ تـم قفـل الملفات بالكتم ')  
end,nil)   
elseif text == 'قفل الملفات بالطرد' and Mod(msg) and msg.reply_to_message_id_ == 0 then 
bot_data:set(ban_id.."lock:Document"..msg.chat_id_,'kick')  
tdcli_function ({ID = "GetUser",user_id_ = msg.sender_user_id_},function(arg,data) 
send(msg.chat_id_, msg.id_,' ⌯︙  مـن قبـل  ⋖ [「'..Rutba(msg.sender_user_id_,msg.chat_id_)..'」](T.ME/'..(data.username_ or 'textchuser')..') \n ⌯︙ تـم قفـل الملفات بالطرد ')  
end,nil)   
elseif text == 'فتح الملفات' and Mod(msg) and msg.reply_to_message_id_ == 0 then 
bot_data:del(ban_id.."lock:Document"..msg.chat_id_)  
tdcli_function ({ID = "GetUser",user_id_ = msg.sender_user_id_},function(arg,data) 
send(msg.chat_id_, msg.id_,' ⌯︙  مـن قبـل  ⋖ [「'..Rutba(msg.sender_user_id_,msg.chat_id_)..'」](T.ME/'..(data.username_ or 'textchuser')..') \n ⌯︙ تـم فتح الملفات ')  
end,nil)   
end
if text == 'قفل السيلفي' and Mod(msg) and msg.reply_to_message_id_ == 0 then 
bot_data:set(ban_id.."lock:Unsupported"..msg.chat_id_,'del')  
tdcli_function ({ID = "GetUser",user_id_ = msg.sender_user_id_},function(arg,data) 
send(msg.chat_id_, msg.id_,' ⌯︙  مـن قبـل  ⋖ [「'..Rutba(msg.sender_user_id_,msg.chat_id_)..'」](T.ME/'..(data.username_ or 'textchuser')..') \n ⌯︙ تـم قفـل السيلفي ')  
end,nil)   
elseif text == 'قفل السيلفي بالتقييد' and Mod(msg) and msg.reply_to_message_id_ == 0 then 
bot_data:set(ban_id.."lock:Unsupported"..msg.chat_id_,'ked')  
tdcli_function ({ID = "GetUser",user_id_ = msg.sender_user_id_},function(arg,data) 
send(msg.chat_id_, msg.id_,' ⌯︙  مـن قبـل  ⋖ [「'..Rutba(msg.sender_user_id_,msg.chat_id_)..'」](T.ME/'..(data.username_ or 'textchuser')..') \n ⌯︙ تـم قفـل السيلفي بالتقييد ')  
end,nil)
elseif text == 'قفل السيلفي بالكتم' and Mod(msg) and msg.reply_to_message_id_ == 0 then 
bot_data:set(ban_id.."lock:Unsupported"..msg.chat_id_,'ktm')  
tdcli_function ({ID = "GetUser",user_id_ = msg.sender_user_id_},function(arg,data) 
send(msg.chat_id_, msg.id_,' ⌯︙  مـن قبـل  ⋖ [「'..Rutba(msg.sender_user_id_,msg.chat_id_)..'」](T.ME/'..(data.username_ or 'textchuser')..') \n ⌯︙ تـم قفـل السيلفي بالكتم ')  
end,nil)   
elseif text == 'قفل السيلفي بالطرد' and Mod(msg) and msg.reply_to_message_id_ == 0 then 
bot_data:set(ban_id.."lock:Unsupported"..msg.chat_id_,'kick')  
tdcli_function ({ID = "GetUser",user_id_ = msg.sender_user_id_},function(arg,data) 
send(msg.chat_id_, msg.id_,' ⌯︙  مـن قبـل  ⋖ [「'..Rutba(msg.sender_user_id_,msg.chat_id_)..'」](T.ME/'..(data.username_ or 'textchuser')..') \n ⌯︙ تـم قفـل السيلفي بالطرد ')  
end,nil)   
elseif text == 'فتح السيلفي' and Mod(msg) and msg.reply_to_message_id_ == 0 then 
bot_data:del(ban_id.."lock:Unsupported"..msg.chat_id_)  
tdcli_function ({ID = "GetUser",user_id_ = msg.sender_user_id_},function(arg,data) 
send(msg.chat_id_, msg.id_,' ⌯︙  مـن قبـل  ⋖ [「'..Rutba(msg.sender_user_id_,msg.chat_id_)..'」](T.ME/'..(data.username_ or 'textchuser')..') \n ⌯︙ تـم فتح السيلفي ')  
end,nil)   
end
if text == 'قفل الماركداون' and Mod(msg) and msg.reply_to_message_id_ == 0 then 
bot_data:set(ban_id.."lock:Markdaun"..msg.chat_id_,'del')  
tdcli_function ({ID = "GetUser",user_id_ = msg.sender_user_id_},function(arg,data) 
send(msg.chat_id_, msg.id_,' ⌯︙  مـن قبـل  ⋖ [「'..Rutba(msg.sender_user_id_,msg.chat_id_)..'」](T.ME/'..(data.username_ or 'textchuser')..') \n ?? تـم قفـل الماركداون ')  
end,nil)   
elseif text == 'قفل الماركداون بالتقييد' and Mod(msg) and msg.reply_to_message_id_ == 0 then 
bot_data:set(ban_id.."lock:Markdaun"..msg.chat_id_,'ked')  
tdcli_function ({ID = "GetUser",user_id_ = msg.sender_user_id_},function(arg,data) 
send(msg.chat_id_, msg.id_,' ⌯︙  مـن قبـل  ⋖ [「'..Rutba(msg.sender_user_id_,msg.chat_id_)..'」](T.ME/'..(data.username_ or 'textchuser')..') \n ⌯︙ تـم قفـل الماركداون بالتقييد ')  
end,nil)
elseif text == 'قفل الماركداون بالكتم' and Mod(msg) and msg.reply_to_message_id_ == 0 then 
bot_data:set(ban_id.."lock:Markdaun"..msg.chat_id_,'ktm')  
tdcli_function ({ID = "GetUser",user_id_ = msg.sender_user_id_},function(arg,data) 
send(msg.chat_id_, msg.id_,' ⌯︙  مـن قبـل  ⋖ [「'..Rutba(msg.sender_user_id_,msg.chat_id_)..'」](T.ME/'..(data.username_ or 'textchuser')..') \n ⌯︙ تـم قفـل الماركداون بالكتم ')  
end,nil)   
elseif text == 'قفل الماركداون بالطرد' and Mod(msg) and msg.reply_to_message_id_ == 0 then 
bot_data:set(ban_id.."lock:Markdaun"..msg.chat_id_,'kick')  
tdcli_function ({ID = "GetUser",user_id_ = msg.sender_user_id_},function(arg,data) 
send(msg.chat_id_, msg.id_,' ⌯︙  مـن قبـل  ⋖ [「'..Rutba(msg.sender_user_id_,msg.chat_id_)..'」](T.ME/'..(data.username_ or 'textchuser')..') \n ⌯︙ تـم قفـل الماركداون بالطرد ')  
end,nil)   
elseif text == 'فتح الماركداون' and Mod(msg) and msg.reply_to_message_id_ == 0 then 
bot_data:del(ban_id.."lock:Markdaun"..msg.chat_id_)  
tdcli_function ({ID = "GetUser",user_id_ = msg.sender_user_id_},function(arg,data) 
send(msg.chat_id_, msg.id_,' ⌯︙  مـن قبـل  ⋖ [「'..Rutba(msg.sender_user_id_,msg.chat_id_)..'」](T.ME/'..(data.username_ or 'textchuser')..') \n ⌯︙ تـم فتح الماركداون ')  
end,nil)   
end
if text == 'قفل الجهات' and Mod(msg) and msg.reply_to_message_id_ == 0 then 
bot_data:set(ban_id.."lock:Contact"..msg.chat_id_,'del')  
tdcli_function ({ID = "GetUser",user_id_ = msg.sender_user_id_},function(arg,data) 
send(msg.chat_id_, msg.id_,' ⌯︙  مـن قبـل  ⋖ [「'..Rutba(msg.sender_user_id_,msg.chat_id_)..'」](T.ME/'..(data.username_ or 'textchuser')..') \n ⌯︙ تـم قفـل الجهات ')  
end,nil)   
elseif text == 'قفل الجهات بالتقييد' and Mod(msg) and msg.reply_to_message_id_ == 0 then 
bot_data:set(ban_id.."lock:Contact"..msg.chat_id_,'ked')  
tdcli_function ({ID = "GetUser",user_id_ = msg.sender_user_id_},function(arg,data) 
send(msg.chat_id_, msg.id_,' ⌯︙  مـن قبـل  ⋖ [「'..Rutba(msg.sender_user_id_,msg.chat_id_)..'」](T.ME/'..(data.username_ or 'textchuser')..') \n ⌯︙ تـم قفـل الجهات بالتقييد ')  
end,nil)
elseif text == 'قفل الجهات بالكتم' and Mod(msg) and msg.reply_to_message_id_ == 0 then 
bot_data:set(ban_id.."lock:Contact"..msg.chat_id_,'ktm')  
tdcli_function ({ID = "GetUser",user_id_ = msg.sender_user_id_},function(arg,data) 
send(msg.chat_id_, msg.id_,' ⌯︙  مـن قبـل  ⋖ [「'..Rutba(msg.sender_user_id_,msg.chat_id_)..'」](T.ME/'..(data.username_ or 'textchuser')..') \n ⌯︙ تـم قفـل الجهات بالكتم ')  
end,nil)   
elseif text == 'قفل الجهات بالطرد' and Mod(msg) and msg.reply_to_message_id_ == 0 then 
bot_data:set(ban_id.."lock:Contact"..msg.chat_id_,'kick')  
tdcli_function ({ID = "GetUser",user_id_ = msg.sender_user_id_},function(arg,data) 
send(msg.chat_id_, msg.id_,' ⌯︙  مـن قبـل  ⋖ [「'..Rutba(msg.sender_user_id_,msg.chat_id_)..'」](T.ME/'..(data.username_ or 'textchuser')..') \n ⌯︙ تـم قفـل الجهات بالطرد ')  
end,nil)   
elseif text == 'فتح الجهات' and Mod(msg) and msg.reply_to_message_id_ == 0 then 
bot_data:del(ban_id.."lock:Contact"..msg.chat_id_)  
tdcli_function ({ID = "GetUser",user_id_ = msg.sender_user_id_},function(arg,data) 
send(msg.chat_id_, msg.id_,' ⌯︙  مـن قبـل  ⋖ [「'..Rutba(msg.sender_user_id_,msg.chat_id_)..'」](T.ME/'..(data.username_ or 'textchuser')..') \n ⌯︙ تـم فتح الجهات ')  
end,nil)   
end
if text == 'قفل الكلايش' and Mod(msg) and msg.reply_to_message_id_ == 0 then 
bot_data:set(ban_id.."lock:Spam"..msg.chat_id_,'del')  
tdcli_function ({ID = "GetUser",user_id_ = msg.sender_user_id_},function(arg,data) 
send(msg.chat_id_, msg.id_,' ⌯︙  مـن قبـل  ⋖ [「'..Rutba(msg.sender_user_id_,msg.chat_id_)..'」](T.ME/'..(data.username_ or 'textchuser')..') \n ⌯︙ تـم قفـل الكلايش ')  
end,nil)   
elseif text == 'قفل الكلايش بالتقييد' and Mod(msg) and msg.reply_to_message_id_ == 0 then 
bot_data:set(ban_id.."lock:Spam"..msg.chat_id_,'ked')  
tdcli_function ({ID = "GetUser",user_id_ = msg.sender_user_id_},function(arg,data) 
send(msg.chat_id_, msg.id_,' ⌯︙  مـن قبـل  ⋖ [「'..Rutba(msg.sender_user_id_,msg.chat_id_)..'」](T.ME/'..(data.username_ or 'textchuser')..') \n ⌯︙ تـم قفـل الكلايش بالتقييد ')  
end,nil)
elseif text == 'قفل الكلايش بالكتم' and Mod(msg) and msg.reply_to_message_id_ == 0 then 
bot_data:set(ban_id.."lock:Spam"..msg.chat_id_,'ktm')  
tdcli_function ({ID = "GetUser",user_id_ = msg.sender_user_id_},function(arg,data) 
send(msg.chat_id_, msg.id_,' ⌯︙  مـن قبـل  ⋖ [「'..Rutba(msg.sender_user_id_,msg.chat_id_)..'」](T.ME/'..(data.username_ or 'textchuser')..') \n ⌯︙ تـم قفـل الكلايش بالكتم ')  
end,nil)   
elseif text == 'قفل الكلايش بالطرد' and Mod(msg) and msg.reply_to_message_id_ == 0 then 
bot_data:set(ban_id.."lock:Spam"..msg.chat_id_,'kick')  
tdcli_function ({ID = "GetUser",user_id_ = msg.sender_user_id_},function(arg,data) 
send(msg.chat_id_, msg.id_,' ⌯︙  مـن قبـل  ⋖ [「'..Rutba(msg.sender_user_id_,msg.chat_id_)..'」](T.ME/'..(data.username_ or 'textchuser')..') \n ⌯︙ تـم قفـل الكلايش بالطرد ')  
end,nil)   
elseif text == 'فتح الكلايش' and Mod(msg) and msg.reply_to_message_id_ == 0 then 
bot_data:del(ban_id.."lock:Spam"..msg.chat_id_)  
tdcli_function ({ID = "GetUser",user_id_ = msg.sender_user_id_},function(arg,data) 
send(msg.chat_id_, msg.id_,' ⌯︙  مـن قبـل  ⋖ [「'..Rutba(msg.sender_user_id_,msg.chat_id_)..'」](T.ME/'..(data.username_ or 'textchuser')..') \n ⌯︙ تـم فتح الكلايش ')  
end,nil)   
end
if text == 'قفل التكرار بالطرد' and Mod(msg) then 
bot_data:hset(ban_id.."flooding:settings:"..msg.chat_id_ ,"flood",'kick')  
send(msg.chat_id_, msg.id_,' ⌯︙ تم قفل التكرار بالطرد')
elseif text == 'قفل التكرار' and Mod(msg) then 
bot_data:hset(ban_id.."flooding:settings:"..msg.chat_id_ ,"flood",'del')  
send(msg.chat_id_, msg.id_,' ⌯︙ تم قفل التكرار')
elseif text == 'قفل التكرار بالتقييد' and Mod(msg) then 
bot_data:hset(ban_id.."flooding:settings:"..msg.chat_id_ ,"flood",'keed')  
send(msg.chat_id_, msg.id_,' ⌯︙ تم قفل التكرار بالتقييد')
elseif text == 'قفل التكرار بالكتم' and Mod(msg) then 
bot_data:hset(ban_id.."flooding:settings:"..msg.chat_id_ ,"flood",'mute')  
send(msg.chat_id_, msg.id_,' ⌯︙ تم قفل التكرار بالكتم')
elseif text == 'فتح التكرار' and Mod(msg) then 
bot_data:hdel(ban_id.."flooding:settings:"..msg.chat_id_ ,"flood")  
send(msg.chat_id_, msg.id_,' ⌯︙ تم فتح التكرار')
end

if text == ("مسح المطورين") and Devban(msg) then
bot_data:del(ban_id..'Sudo:User')
send(msg.chat_id_, msg.id_, "\n ⌯︙ تم مسح قائمة المطورين  ")
end

if text == 'الملفات' and Devban(msg) then
t = ' ⌯︙ ملفات السورس جولد↓\n •━═━═━═「ɢᴏʟᴅ」═━═━═━• \n'
i = 0
for v in io.popen('ls File_Bot'):lines() do
if v:match(".lua$") then
i = i + 1
t = t..i..'- الملف  ⋖ {'..v..'}\n'
end
end
send(msg.chat_id_, msg.id_,t)
end
if text == "متجر الملفات" or text == 'المتجر' then
if Devban(msg) then
local Get_Files, res = https.request("https://raw.githubusercontent.com/Zeby-kos/tigerahmed/main/getfile.json")
if res == 200 then
local Get_info, res = pcall(JSON.decode,Get_Files);
vardump(res.plugins_)
if Get_info then
local TextS = "\n ⌯︙ اهلا بك في متجر ملفات جولد\n ⌯︙ ملفات السورس ↓\n◤━───━??𝗼𝗼𝗼𝗻━───━◥\n\n"
local TextE = "\n•━═━═━═「ɢᴏʟᴅ」═━═━═━•\n ⌯︙ علامة تعني { ✔️ } ملف مفعل\n ⌯︙ علامة تعني { ✖ } ملف معطل\n ⌯︙ قناة سورس جولد↓\n".." ⌯︙ [اضغط هنا لدخول](t.me/g_00_l_d) \n"
local NumFile = 0
for name,Info in pairs(res.plugins_) do
local Check_File_is_Found = io.open("File_Bot/"..name,"r")
if Check_File_is_Found then
io.close(Check_File_is_Found)
CeckFile = "(✔️)"
else
CeckFile = "(✖)"
end
NumFile = NumFile + 1
TextS = TextS..'*'..NumFile.."→* {`"..name..'`}  ⋖ '..CeckFile..'\n[-Information]('..Info..')\n'
end
send(msg.chat_id_, msg.id_,TextS..TextE) 
end
else
send(msg.chat_id_, msg.id_," ⌯︙ لا يوجد اتصال من ال api \n") 
end
return false
end
end

if text and text:match("^(تعطيل) (.*)(.lua)$") and Devban(msg) then
local name_t = {string.match(text, "^(تعطيل) (.*)(.lua)$")}
local file = name_t[2]..'.lua'
local file_bot = io.open("File_Bot/"..file,"r")
if file_bot then
io.close(file_bot)
t = " ⌯︙ الملف  ⋖ "..file.."\n ⌯︙ تم تعطيل ملف \n"
else
t = " ⌯︙ بالتاكيد تم تعطيل ملف → "..file.."\n"
end
local json_file, res = https.request("https://raw.githubusercontent.com/Zeby-kos/tigerahmed/main/File_Bot/"..file)
if res == 200 then
os.execute("rm -fr File_Bot/"..file)
send(msg.chat_id_, msg.id_,t) 
dofile('KLAER.lua')  
else
send(msg.chat_id_, msg.id_," ⌯︙ عذرا الملف لايدعم سورس جولد\n") 
end
return false
end
if text and text:match("^(تفعيل) (.*)(.lua)$") and Devban(msg) then
local name_t = {string.match(text, "^(تفعيل) (.*)(.lua)$")}
local file = name_t[2]..'.lua'
local file_bot = io.open("File_Bot/"..file,"r")
if file_bot then
io.close(file_bot)
t = " ⌯︙ بالتاكيد تم تفعيل ملف → "..file.." \n"
else
t = " ⌯︙ الملف  ⋖ "..file.."\n ⌯︙ تم تفعيل ملف \n"
end
local json_file, res = https.request("https://raw.githubusercontent.com/Zeby-kos/tigerahmed/main/File_Bot/"..file)
if res == 200 then
local chek = io.open("File_Bot/"..file,'w+')
chek:write(json_file)
chek:close()
send(msg.chat_id_, msg.id_,t) 
dofile('KLAER.lua')  
else
send(msg.chat_id_, msg.id_," ⌯︙ عذرا الملف لايدعم سورس جولد\n") 
end
return false
end
if text == "مسح الملفات" and Devban(msg) then
os.execute("rm -fr File_Bot/*")
send(msg.chat_id_,msg.id_," ⌯︙ تم مسح الملفات")
return false
end

if text == ("رفع مطور") and msg.reply_to_message_id_ and msa3d(msg) then
function start_function(extra, result, success)
if AddChannel(msg.sender_user_id_) == false then
local textchuser = bot_data:get(ban_id..'text:ch:user')
if textchuser then
send(msg.chat_id_, msg.id_,'['..textchuser..']')
else
send(msg.chat_id_, msg.id_,' ⌯︙ لا تستطيع استخدام البوت \n ⌯︙  يرجى الاشتراك بالقناه اولا \n ⌯︙  اشترك هنا ['..bot_data:get(ban_id..'add:ch:username')..']')
end
return false
end
bot_data:sadd(ban_id..'Sudo:User', result.sender_user_id_)
tdcli_function ({ID = "GetUser",user_id_ = result.sender_user_id_},function(arg,data) 
usertext = '\n ⌯︙ الـعـضو   ⋖ ['..data.first_name_..'](t.me/'..(data.username_ or 'g_00_l_d')..')'
status  = '\n ⌯︙ تم ترقيته مطور'
send(msg.chat_id_, msg.id_, usertext..status)
end,nil)
end
tdcli_function ({ID = "GetMessage",chat_id_ = msg.chat_id_,message_id_ = tonumber(msg.reply_to_message_id_)}, start_function, nil)
return false 
end
if text and text:match("^رفع مطور @(.*)$") and msa3d(msg) then
local username = text:match("^رفع مطور @(.*)$")
if AddChannel(msg.sender_user_id_) == false then
local textchuser = bot_data:get(ban_id..'text:ch:user')
if textchuser then
send(msg.chat_id_, msg.id_,'['..textchuser..']')
else
send(msg.chat_id_, msg.id_,' ⌯︙ لا تستطيع استخدام البوت \n ⌯︙  يرجى الاشتراك بالقناه اولا \n ⌯︙  اشترك هنا ['..bot_data:get(ban_id..'add:ch:username')..']')
end
return false
end
function start_function(extra, result, success)
if result.id_ then
if (result and result.type_ and result.type_.ID == "ChannelChatInfo") then
send(msg.chat_id_,msg.id_,"⚠| عذرا عزيزي المستخدم هاذا معرف قناة يرجى استخدام الامر بصوره صحيحه !")   
return false 
end      
bot_data:sadd(ban_id..'Sudo:User', result.id_)
usertext = '\n ⌯︙ الـعـضو   ⋖ ['..result.title_..'](t.me/'..(username or 'g_00_l_d')..')'
status  = '\n ⌯︙ تم ترقيته مطور'
texts = usertext..status
else
texts = ' ⌯︙ لا يوجد حساب بهاذا المعرف'
end
send(msg.chat_id_, msg.id_, texts)
end
tdcli_function ({ID = "SearchPublicChat",username_ = username}, start_function, nil)
return false 
end
if text and text:match("^رفع مطور (%d+)$") and msa3d(msg) then
local userid = text:match("^رفع مطور (%d+)$")
if AddChannel(msg.sender_user_id_) == false then
local textchuser = bot_data:get(ban_id..'text:ch:user')
if textchuser then
send(msg.chat_id_, msg.id_,'['..textchuser..']')
else
send(msg.chat_id_, msg.id_,' ⌯︙ لا تستطيع استخدام البوت \n ⌯︙  يرجى الاشتراك بالقناه اولا \n ⌯︙  اشترك هنا ['..bot_data:get(ban_id..'add:ch:username')..']')
end
return false
end
bot_data:sadd(ban_id..'Sudo:User', userid)
tdcli_function ({ID = "GetUser",user_id_ = userid},function(arg,data) 
if data.first_name_ then
usertext = '\n ⌯︙ الـعـضو   ⋖ ['..data.first_name_..'](t.me/'..(data.username_ or 'g_00_l_d')..')'
status  = '\n ⌯︙ تم ترقيته مطور'
send(msg.chat_id_, msg.id_, usertext..status)
else
usertext = '\n ⌯︙ الـعـضو   ⋖ '..userid..''
status  = '\n ⌯︙ تم ترقيته مطور'
send(msg.chat_id_, msg.id_, usertext..status)
end;end,nil)
return false 
end
if text == ("تنزيل مطور") and msg.reply_to_message_id_ and Devban(msg) then
if AddChannel(msg.sender_user_id_) == false then
local textchuser = bot_data:get(ban_id..'text:ch:user')
if textchuser then
send(msg.chat_id_, msg.id_,'['..textchuser..']')
else
send(msg.chat_id_, msg.id_,' ⌯︙ لا تستطيع استخدام البوت \n ⌯︙  يرجى الاشتراك بالقناه اولا \n ⌯︙  اشترك هنا ['..bot_data:get(ban_id..'add:ch:username')..']')
end
return false
end
function start_function(extra, result, success)
bot_data:srem(ban_id..'Sudo:User', result.sender_user_id_)
tdcli_function ({ID = "GetUser",user_id_ = result.sender_user_id_},function(arg,data) 
usertext = '\n ⌯︙ الـعـضو   ⋖ ['..data.first_name_..'](t.me/'..(data.username_ or 'g_00_l_d')..')'
status  = '\n ⌯︙ تم تنزيله من المطورين'
send(msg.chat_id_, msg.id_, usertext..status)
end,nil)
end
tdcli_function ({ID = "GetMessage",chat_id_ = msg.chat_id_,message_id_ = tonumber(msg.reply_to_message_id_)}, start_function, nil)
return false 
end
if text and text:match("^تنزيل مطور @(.*)$") and Devban(msg) then
local username = text:match("^تنزيل مطور @(.*)$")
if AddChannel(msg.sender_user_id_) == false then
local textchuser = bot_data:get(ban_id..'text:ch:user')
if textchuser then
send(msg.chat_id_, msg.id_,'['..textchuser..']')
else
send(msg.chat_id_, msg.id_,' ⌯︙ لا ����ستطيع استخدام البوت \n ⌯︙  يرجى الاشتراك بالقناه اولا \n ⌯︙  اشترك هنا ['..bot_data:get(ban_id..'add:ch:username')..']')
end
return false
end
function start_function(extra, result, success)
if result.id_ then
bot_data:srem(ban_id..'Sudo:User', result.id_)
usertext = '\n ⌯︙ الـعـضو   ⋖ ['..result.title_..'](t.me/'..(username or 'g_00_l_d')..')'
status  = '\n ⌯︙ تم تنزيله من المطورين'
texts = usertext..status
else
texts = ' ⌯︙ لا يوجد حساب بهاذا المعرف'
end
send(msg.chat_id_, msg.id_, texts)
end
tdcli_function ({ID = "SearchPublicChat",username_ = username}, start_function, nil)
return false
end  
if text and text:match("^تنزيل مطور (%d+)$") and Devban(msg) then
local userid = text:match("^تنزيل مطور (%d+)$")
if AddChannel(msg.sender_user_id_) == false then
local textchuser = bot_data:get(ban_id..'text:ch:user')
if textchuser then
send(msg.chat_id_, msg.id_,'['..textchuser..']')
else
send(msg.chat_id_, msg.id_,' ⌯︙ لا تستطيع استخدام البوت \n ⌯︙  يرجى الاشتراك بالقناه اولا \n ⌯︙  اشترك هنا ['..bot_data:get(ban_id..'add:ch:username')..']')
end
return false
end
bot_data:srem(ban_id..'Sudo:User', userid)
tdcli_function ({ID = "GetUser",user_id_ = userid},function(arg,data) 
if data.first_name_ then
usertext = '\n ⌯︙ الـعـضو   ⋖ ['..data.first_name_..'](t.me/'..(data.username_ or 'g_00_l_d')..')'
status  = '\n ⌯︙ تم تنزيله من المطورين'
send(msg.chat_id_, msg.id_, usertext..status)
else
usertext = '\n ⌯︙ الـعـضو   ⋖ '..userid..''
status  = '\n ⌯︙ تم تنزيله من المطورين'
send(msg.chat_id_, msg.id_, usertext..status)
end;end,nil)
return false 
end
if text == ("مسح قائمه المالك") and Sudo(msg) then
bot_data:del(ban_id..'CoSu'..msg.chat_id_)
send(msg.chat_id_, msg.id_, '\n ⌯︙ تم مسح قائمه المالك')
return false
end

if text == 'قائمه المالك' and Sudo(msg) then
local list = bot_data:smembers(ban_id..'CoSu'..msg.chat_id_)
t = "\n ⌯︙ قائمه المالك\n•━═━═━═「ɢᴏʟᴅ」═━═━═━•\n"
for k,v in pairs(list) do
local username = bot_data:get(ban_id.."user:Name" .. v)
if username then
t = t..""..k.."- ([@"..username.."])\n"
else
t = t..""..k.."- (`"..v.."`)\n"
end
end
if #list == 0 then
t = " ⌯︙ لا يوجد احد في قائمه المالك"
end
send(msg.chat_id_, msg.id_, t)
return false
end
if text == ("صيح للمالك") or text == ("تاك للمالك") then
local list = bot_data:smembers(ban_id..'CoSu'..msg.chat_id_)
t = "\n ⌯︙ وينكم تعالو يريدوكم بالجروب \n•━═━═━═「ɢᴏʟᴅ」═━═━═━•\n"
for k,v in pairs(list) do
local username = bot_data:get(ban_id.."user:Name" .. v)
if username then
t = t..""..k.."- {[@"..username.."]}\n"
else
t = t..""..k.."- 「 '..v..' 」\n"
end
end
if #list == 0 then
t = " ⌯︙ لا يوجد احد في قائمه المالك"
end
send(msg.chat_id_, msg.id_, t)
end

if text == ("رفع مالك") and msg.reply_to_message_id_ and Sudo(msg) then
if AddChannel(msg.sender_user_id_) == false then
local textchuser = bot_data:get(ban_id..'text:ch:user')
if textchuser then
send(msg.chat_id_, msg.id_,'['..textchuser..']')
else
send(msg.chat_id_, msg.id_,' ⌯︙ لا تستطيع استخدام البوت \n ⌯︙  يرجى الاشتراك بالقناه اولا \n ⌯︙  اشترك هنا ['..bot_data:get(ban_id..'add:ch:username')..']')
end
return false
end
function start_function(extra, result, success)
bot_data:sadd(ban_id..'CoSu'..msg.chat_id_, result.sender_user_id_)
tdcli_function ({ID = "GetUser",user_id_ = result.sender_user_id_},function(arg,data) 
usertext = '\n ⌯︙ الـعـضو   ⋖ ['..data.first_name_..'](t.me/'..(data.username_ or 'g_00_l_d')..')'
status  = '\n ⌯︙ تم ترقيته مالك'
send(msg.chat_id_, msg.id_, usertext..status)
end,nil)
end
tdcli_function ({ID = "GetMessage",chat_id_ = msg.chat_id_,message_id_ = tonumber(msg.reply_to_message_id_)}, start_function, nil)
return false
end
if text and text:match("^رفع مالك@(.*)$") and Sudo(msg) then
local username = text:match("^رفع مالك@(.*)$")
if AddChannel(msg.sender_user_id_) == false then
local textchuser = bot_data:get(ban_id..'text:ch:user')
if textchuser then
send(msg.chat_id_, msg.id_,'['..textchuser..']')
else
send(msg.chat_id_, msg.id_,' ⌯︙ لا تستطيع استخدام البوت \n ⌯︙  يرجى الاشتراك بالقناه اولا \n ⌯︙  اشترك هنا ['..bot_data:get(ban_id..'add:ch:username')..']')
end
return false
end
function start_function(extra, result, success)
if result.id_ then
if (result and result.type_ and result.type_.ID == "ChannelChatInfo") then
send(msg.chat_id_,msg.id_," ⌯︙ عذرا عزيزي المستخدم هاذا معرف قناة يرجى استخدام الامر بصوره صحيحه !")   
return false 
end      
bot_data:sadd(ban_id..'CoSu'..msg.chat_id_, result.id_)
usertext = '\n ⌯︙ الـعـضو   ⋖ ['..result.title_..'](t.me/'..(username or 'g_00_l_d')..')'
status  = '\n ⌯︙ تم ترقيته مالك'
texts = usertext..status
else
texts = ' ⌯︙ لا يوجد حساب بهاذا المعرف'
end
send(msg.chat_id_, msg.id_, texts)
end
tdcli_function ({ID = "SearchPublicChat",username_ = username}, start_function, nil)
return false
end
if text and text:match("^رفع مالك(%d+)$") and Sudo(msg) then
local userid = text:match("^رفع مالك(%d+)$") 
if AddChannel(msg.sender_user_id_) == false then
local textchuser = bot_data:get(ban_id..'text:ch:user')
if textchuser then
send(msg.chat_id_, msg.id_,'['..textchuser..']')
else
send(msg.chat_id_, msg.id_,' ⌯︙ لا تستطيع استخدام البوت \n ⌯︙  يرجى الاشتراك بالقناه اولا \n ⌯︙  اشترك هنا ['..bot_data:get(ban_id..'add:ch:username')..']')
end
return false
end
bot_data:sadd(ban_id..'CoSu'..msg.chat_id_, userid)
tdcli_function ({ID = "GetUser",user_id_ = userid},function(arg,data) 
if data.first_name_ then
usertext = '\n ⌯︙ الـعـضو   ⋖ ['..data.first_name_..'](t.me/'..(data.username_ or 'g_00_l_d')..')'
status  = '\n ⌯︙ تم ترقيته مالك'
send(msg.chat_id_, msg.id_, usertext..status)
else
usertext = '\n ⌯︙ الـعـضو   ⋖ '..userid..''
status  = '\n ⌯︙ تم ترقيته مالك'
send(msg.chat_id_, msg.id_, usertext..status)
end;end,nil)
return false
end
if text == ("تنزيل مالك") and msg.reply_to_message_id_ and Sudo(msg) then
if AddChannel(msg.sender_user_id_) == false then
local textchuser = bot_data:get(ban_id..'text:ch:user')
if textchuser then
send(msg.chat_id_, msg.id_,'['..textchuser..']')
else
send(msg.chat_id_, msg.id_,' ⌯︙ لا تستطيع استخدام البوت \n ⌯︙  يرجى الاشتراك بالقناه اولا \n ⌯︙  اشترك هنا ['..bot_data:get(ban_id..'add:ch:username')..']')
end
return false
end
function start_function(extra, result, success)
bot_data:srem(ban_id..'CoSu'..msg.chat_id_, result.sender_user_id_)
tdcli_function ({ID = "GetUser",user_id_ = result.sender_user_id_},function(arg,data) 
usertext = '\n ⌯︙ الـعـضو   ⋖ ['..data.first_name_..'](t.me/'..(data.username_ or 'g_00_l_d')..')'
status  = '\n ⌯︙ تم تنزيله من مالك'
send(msg.chat_id_, msg.id_, usertext..status)
end,nil)
end
tdcli_function ({ID = "GetMessage",chat_id_ = msg.chat_id_,message_id_ = tonumber(msg.reply_to_message_id_)}, start_function, nil)
return false
end
if text and text:match("^تنزيل مالك@(.*)$") and Sudo(msg) then
local username = text:match("^تنزيل مالك@(.*)$")
if AddChannel(msg.sender_user_id_) == false then
local textchuser = bot_data:get(ban_id..'text:ch:user')
if textchuser then
send(msg.chat_id_, msg.id_,'['..textchuser..']')
else
send(msg.chat_id_, msg.id_,' ⌯︙ لا تستطيع استخدام البوت \n ⌯︙  يرجى الاشتراك بالقناه اولا \n ⌯︙  اشترك هنا ['..bot_data:get(ban_id..'add:ch:username')..']')
end
return false
end
function start_function(extra, result, success)
if result.id_ then
bot_data:srem(ban_id..'CoSu'..msg.chat_id_, result.id_)
usertext = '\n ⌯︙ الـعـضو   ⋖ ['..result.title_..'](t.me/'..(username or 'g_00_l_d')..')'
status  = '\n ⌯︙ تم تنزيله من مالك'
texts = usertext..status
else
texts = ' ⌯︙ لا يوجد حساب بهاذا المعرف'
end
send(msg.chat_id_, msg.id_, texts)
end
tdcli_function ({ID = "SearchPublicChat",username_ = username}, start_function, nil)
return false
end
if text and text:match("^تنزيل مالك(%d+)$") and Sudo(msg) then
local userid = text:match("^تنزيل مالك(%d+)$") 
if AddChannel(msg.sender_user_id_) == false then
local textchuser = bot_data:get(ban_id..'text:ch:user')
if textchuser then
send(msg.chat_id_, msg.id_,'['..textchuser..']')
else
send(msg.chat_id_, msg.id_,' ⌯︙ لا تستطيع استخدام البوت \n ⌯︙  يرجى الاشتراك بالقناه اولا \n ⌯︙  اشترك هنا ['..bot_data:get(ban_id..'add:ch:username')..']')
end
return false
end
bot_data:srem(ban_id..'CoSu'..msg.chat_id_, userid)
tdcli_function ({ID = "GetUser",user_id_ = userid},function(arg,data) 
if data.first_name_ then
usertext = '\n ⌯︙ الـعـضو   ⋖ ['..data.first_name_..'](t.me/'..(data.username_ or 'g_00_l_d')..')'
status  = '\n ⌯︙ تم تنزيله من مالك'
send(msg.chat_id_, msg.id_, usertext..status)
else
usertext = '\n ⌯︙ الـعـضو   ⋖ '..userid..''
status  = '\n ⌯︙ تم تنزيله من مالك'
send(msg.chat_id_, msg.id_, usertext..status)
end;end,nil)
return false
end
------------------------------------------------------------------------

if (msg.content_.sticker_)  and msg.reply_to_message_id_ == 0 and bot_data:get(ban_id.."lock:Lock:Sexy"..msg.chat_id_)=="del" then      
sticker_id = msg.content_.sticker_.sticker_.persistent_id_
st = https.request('https://black-source.tk/BlackTeAM/ImageInfo.php?token='..token..'&url='..sticker_id.."&type=sticker")
eker = JSON.decode(st)
if eker.ok.Info == "Indecent" then
local list = bot_data:smembers(ban_id.."Basic:Constructor"..msg.chat_id_)
t = " ⌯︙ المنشئين الاساسين تعالو مخرب \n•━═━═━═「ɢᴏʟᴅ」═━═━═━•\n"
for k,v in pairs(list) do
local username = bot_data:get(ban_id.."user:Name" .. v)
if username then
t = t..""..k.."- ([@"..username.."])\n"
else
t = t..""..k.."- (`"..v.."`)\n"
end
end
if #list == 0 then
t = " ⌯︙ ماكو منششئين يشوفولك جاره"
end
Reply_Status(msg,msg.sender_user_id_,"reply"," ⌯︙ قام بنشر ملصق اباحيه\n"..t)  
DeleteMessage(msg.chat_id_,{[0] = tonumber(msg.id_),msg.id_})   
end   
end
if (msg.content_.photo_) and msg.reply_to_message_id_ == 0 and bot_data:get(ban_id.."lock:Lock:Sexy"..msg.chat_id_)=="del" then
photo_id = msg.content_.photo_.sizes_[1].photo_.persistent_id_  
Srrt = https.request('https://black-source.tk/BlackTeAM/ImageInfo.php?token='..token..'&url='..photo_id.."&type=photo")
Sto = JSON.decode(Srrt)
if Sto.ok.Info == "Indecent" then
local list = bot_data:smembers(ban_id.."Basic:Constructor"..msg.chat_id_)
t = " ⌯︙ المنشئين الاساسين تعالو مخرب \n•━═━═━═「ɢᴏʟᴅ」═━═━═━•\n"
for k,v in pairs(list) do
local username = bot_data:get(ban_id.."user:Name" .. v)
if username then
t = t..""..k.."- ([@"..username.."])\n"
else
t = t..""..k.."- (`"..v.."`)\n"
end
end
if #list == 0 then
t = " ⌯︙ ماكو منششئين يشوفولك جاره"
end
Reply_Status(msg,msg.sender_user_id_,"reply"," ⌯︙ قام بنشر صوره اباحيه\n"..t)  
DeleteMessage(msg.chat_id_,{[0] = tonumber(msg.id_),msg.id_})   
end   
end
if text == 'تفعيل التحقق' and CoSu(msg) then   
if bot_data:get(ban_id..'CAPTCHA'..msg.chat_id_) then
Text = 'تم تفعيل التحقق'
bot_data:del(ban_id..'CAPTCHA'..msg.chat_id_)  
else
Text = ' ⌯︙ بالتاكيد تم تفعيل امر التحقق'
end
send(msg.chat_id_, msg.id_,Text) 
end
if text == 'تعطيل التحقق' and CoSu(msg) then  
if not bot_data:get(ban_id..'CAPTCHA'..msg.chat_id_) then
bot_data:set(ban_id..'CAPTCHA'..msg.chat_id_,true)  
Text = '\n ⌯︙ تم تعطيل امر التحقق'
else
Text = '\n ⌯︙ بالتاكيد تم تعطيل امر التحقق'
end
send(msg.chat_id_, msg.id_,Text) 
end
if text == 'تفعيل التحويل' and CoSu(msg) then   
if bot_data:get(ban_id..'DRAGOON:change:ban'..msg.chat_id_) then
Text = 'تم تفعيل تحويل الصيغ'
bot_data:del(ban_id..'DRAGOON:change:ban'..msg.chat_id_)  
else
Text = ' ⌯︙ بالتاكيد تم تفعيل امر تحويل'
end
send(msg.chat_id_, msg.id_,Text) 
end
if text == 'تعطيل التحويل' and CoSu(msg) then  
if not bot_data:get(ban_id..'DRAGOON:change:ban'..msg.chat_id_) then
bot_data:set(ban_id..'DRAGOON:change:ban'..msg.chat_id_,true)  
Text = '\n ⌯︙ تم تعطيل امر تحويل'
else
Text = '\n ⌯︙ بالتاكيد تم تعطيل امر تحويل'
end
send(msg.chat_id_, msg.id_,Text) 
end
if text == 'تحويل' and not bot_data:get(ban_id..'DRAGOON:change:ban'..msg.chat_id_) then  
if tonumber(msg.reply_to_message_id_) > 0 then
function by_reply(extra, result, success)   
if result.content_.photo_ then 
local pn = result.content_.photo_.sizes_[1].photo_.persistent_id_
Addsticker(msg,msg.chat_id_,pn,msg.sender_user_id_..'.png')
end   
end
tdcli_function ({ ID = "GetMessage", chat_id_ = msg.chat_id_, message_id_ = tonumber(msg.reply_to_message_id_) }, by_reply, nil)
end
end

if text == 'تحويل' and not bot_data:get(ban_id..'DRAGOON:change:ban'..msg.chat_id_) then  
if tonumber(msg.reply_to_message_id_) > 0 then
function by_reply(extra, result, success)   
if result.content_.Voice_ then 
local mr = result.content_.Voice_.Voice_.persistent_id_ 
Addmp3(msg,msg.chat_id_,mr,msg.sender_user_id_..'.mp3')
end   
end
tdcli_function ({ ID = "GetMessage", chat_id_ = msg.chat_id_, message_id_ = tonumber(msg.reply_to_message_id_) }, by_reply, nil)
end
end
if text == 'تحويل' and not bot_data:get(ban_id..'DRAGOON:change:ban'..msg.chat_id_) then  
if tonumber(msg.reply_to_message_id_) > 0 then
function by_reply(extra, result, success)   
if result.content_.audio_ then 
local mr = result.content_.audio_.audio_.persistent_id_
Addvoi(msg,msg.chat_id_,mr,msg.sender_user_id_..'.ogg')
end   
end
tdcli_function ({ ID = "GetMessage", chat_id_ = msg.chat_id_, message_id_ = tonumber(msg.reply_to_message_id_) }, by_reply, nil)
end
end
if text == 'تحويل' and not bot_data:get(ban_id..'DRAGOON:change:ban'..msg.chat_id_) then  
if tonumber(msg.reply_to_message_id_) > 0 then
function by_reply(extra, result, success)   
if result.content_.sticker_ then 
local Str = result.content_.sticker_.sticker_.persistent_id_ 
Addjpg(msg,msg.chat_id_,Str,msg.sender_user_id_..'.jpg')
end   
end
tdcli_function ({ ID = "GetMessage", chat_id_ = msg.chat_id_, message_id_ = tonumber(msg.reply_to_message_id_) }, by_reply, nil)
end
end

-------------------
------------------------------------------------------------------------
if text == ("مسح الاساسين") and CoSu(msg) then
bot_data:del(ban_id..'Basic:Constructor'..msg.chat_id_)
send(msg.chat_id_, msg.id_, '\n ⌯︙ تم مسح المنشئين الاساسين')
return false
end
if text == 'المنشئين الاساسين' and CoSu(msg) then
local list = bot_data:smembers(ban_id..'Basic:Constructor'..msg.chat_id_)
t = "\n ⌯︙ قائمة المنشئين الاساسين \n•━═━═━═「ɢᴏʟᴅ」═━═━═━•\n"
for k,v in pairs(list) do
local username = bot_data:get(ban_id.."user:Name" .. v)
if username then
t = t..""..k.."- ([@"..username.."])\n"
else
t = t..""..k.."- (`"..v.."`)\n"
end
end
if #list == 0 then
t = " ⌯︙ لا يوجد منشئين اساسين"
end
send(msg.chat_id_, msg.id_, t)
return false
end
if text == ("تاك للمنشئين الاساسين") or text == ("صيح المنشئين الاساسين") then
local list = bot_data:smembers(ban_id..'Basic:Constructor'..msg.chat_id_)
t = "\n ⌯︙ وينكم تعالو يريدوكم بالجروب \n💞 ═───═𝙺𝙻𝙰??𝚁═───═💞\n"
for k,v in pairs(list) do
local username = bot_data:get(ban_id.."user:Name" .. v)
if username then
t = t..""..k.."- {[@"..username.."]}\n"
else
t = t..""..k.."- 「 '..v..' 」\n"
end
end
if #list == 0 then
t = " ⌯︙ لا يوجد منشئين اساسين"
end
send(msg.chat_id_, msg.id_, t)
end
  

if text == ("رفع منشئ اساسي") and msg.reply_to_message_id_ and CoSu(msg) then
if AddChannel(msg.sender_user_id_) == false then
local textchuser = bot_data:get(ban_id..'text:ch:user')
if textchuser then
send(msg.chat_id_, msg.id_,'['..textchuser..']')
else
send(msg.chat_id_, msg.id_,' ⌯︙ لا تستطيع استخدام البوت \n ⌯︙  يرجى الاشتراك بالقناه اولا \n ⌯︙  اشترك هنا ['..bot_data:get(ban_id..'add:ch:username')..']')
end
return false
end
function start_function(extra, result, success)
bot_data:sadd(ban_id..'Basic:Constructor'..msg.chat_id_, result.sender_user_id_)
tdcli_function ({ID = "GetUser",user_id_ = result.sender_user_id_},function(arg,data) 
usertext = '\n ⌯︙ الـعـضو   ⋖ ['..data.first_name_..'](t.me/'..(data.username_ or 'g_00_l_d')..')'
status  = '\n ⌯︙ تم ترقيته منشئ اساسي'
send(msg.chat_id_, msg.id_, usertext..status)
end,nil)
end
tdcli_function ({ID = "GetMessage",chat_id_ = msg.chat_id_,message_id_ = tonumber(msg.reply_to_message_id_)}, start_function, nil)
return false
end
if text and text:match("^رفع منشئ اساسي @(.*)$") and CoSu(msg) then
local username = text:match("^رفع منشئ اساسي @(.*)$")
if AddChannel(msg.sender_user_id_) == false then
local textchuser = bot_data:get(ban_id..'text:ch:user')
if textchuser then
send(msg.chat_id_, msg.id_,'['..textchuser..']')
else
send(msg.chat_id_, msg.id_,' ⌯︙ لا تستطيع استخدام البوت \n ⌯︙  يرجى الاشتراك بالقناه اولا \n ⌯︙  اشترك هنا ['..bot_data:get(ban_id..'add:ch:username')..']')
end
return false
end
function start_function(extra, result, success)
if result.id_ then
if (result and result.type_ and result.type_.ID == "ChannelChatInfo") then
send(msg.chat_id_,msg.id_," ⌯︙ عذرا عزيزي المستخدم هاذا معرف قناة يرجى استخدام الامر بصوره صحيحه !")   
return false 
end      
bot_data:sadd(ban_id..'Basic:Constructor'..msg.chat_id_, result.id_)
usertext = '\n ⌯︙ الـعـضو   ⋖ ['..result.title_..'](t.me/'..(username or 'g_00_l_d')..')'
status  = '\n ⌯︙ تم ترقيته منشئ اساسي'
texts = usertext..status
else
texts = ' ⌯︙ لا يوجد حساب بهاذا المعرف'
end
send(msg.chat_id_, msg.id_, texts)
end
tdcli_function ({ID = "SearchPublicChat",username_ = username}, start_function, nil)
return false
end
if text and text:match("^رفع منشئ اساسي (%d+)$") and CoSu(msg) then
local userid = text:match("^رفع منشئ اساسي (%d+)$") 
if AddChannel(msg.sender_user_id_) == false then
local textchuser = bot_data:get(ban_id..'text:ch:user')
if textchuser then
send(msg.chat_id_, msg.id_,'['..textchuser..']')
else
send(msg.chat_id_, msg.id_,' ⌯︙ لا تستطيع استخدام البوت \n ⌯︙  يرجى الاشتراك بالقناه اولا \n ⌯︙  اشترك هنا ['..bot_data:get(ban_id..'add:ch:username')..']')
end
return false
end
bot_data:sadd(ban_id..'Basic:Constructor'..msg.chat_id_, userid)
tdcli_function ({ID = "GetUser",user_id_ = userid},function(arg,data) 
if data.first_name_ then
usertext = '\n ⌯︙ الـعـضو   ⋖ ['..data.first_name_..'](t.me/'..(data.username_ or 'g_00_l_d')..')'
status  = '\n ⌯︙ تم ترقيته منشئ اساسي'
send(msg.chat_id_, msg.id_, usertext..status)
else
usertext = '\n ⌯︙ الـعـضو   ⋖ '..userid..''
status  = '\n ⌯︙ تم ترقيته منشئ اساسي'
send(msg.chat_id_, msg.id_, usertext..status)
end;end,nil)
return false
end
if text == ("تنزيل منشئ اساسي") and msg.reply_to_message_id_ and CoSu(msg) then
if AddChannel(msg.sender_user_id_) == false then
local textchuser = bot_data:get(ban_id..'text:ch:user')
if textchuser then
send(msg.chat_id_, msg.id_,'['..textchuser..']')
else
send(msg.chat_id_, msg.id_,' ⌯︙ لا تستطيع استخدام البوت \n ⌯︙  يرجى الاشتراك بالقناه اولا \n ⌯︙  اشترك هنا ['..bot_data:get(ban_id..'add:ch:username')..']')
end
return false
end
function start_function(extra, result, success)
bot_data:srem(ban_id..'Basic:Constructor'..msg.chat_id_, result.sender_user_id_)
tdcli_function ({ID = "GetUser",user_id_ = result.sender_user_id_},function(arg,data) 
usertext = '\n ⌯︙ الـعـضو   ⋖ ['..data.first_name_..'](t.me/'..(data.username_ or 'g_00_l_d')..')'
status  = '\n ⌯︙ تم تنزيله من الاساسيين'
send(msg.chat_id_, msg.id_, usertext..status)
end,nil)
end
tdcli_function ({ID = "GetMessage",chat_id_ = msg.chat_id_,message_id_ = tonumber(msg.reply_to_message_id_)}, start_function, nil)
return false
end
if text and text:match("^تنزيل منشئ اساسي @(.*)$") and CoSu(msg) then
local username = text:match("^تنزيل منشئ اساسي @(.*)$")
if AddChannel(msg.sender_user_id_) == false then
local textchuser = bot_data:get(ban_id..'text:ch:user')
if textchuser then
send(msg.chat_id_, msg.id_,'['..textchuser..']')
else
send(msg.chat_id_, msg.id_,' ⌯︙ لا تستطيع استخدام البوت \n ⌯︙  يرجى الاشتراك بالقناه اولا \n ⌯︙  اشترك هنا ['..bot_data:get(ban_id..'add:ch:username')..']')
end
return false
end
function start_function(extra, result, success)
if result.id_ then
bot_data:srem(ban_id..'Basic:Constructor'..msg.chat_id_, result.id_)
usertext = '\n ⌯︙ الـعـضو   ⋖ ['..result.title_..'](t.me/'..(username or 'g_00_l_d')..')'
status  = '\n ⌯︙ تم تنزيله من الاساسيين'
texts = usertext..status
else
texts = ' ⌯︙ لا يوجد حساب بهاذا المعرف'
end
send(msg.chat_id_, msg.id_, texts)
end
tdcli_function ({ID = "SearchPublicChat",username_ = username}, start_function, nil)
return false
end
if text and text:match("^تنزيل منشئ اساسي (%d+)$") and CoSu(msg) then
local userid = text:match("^تنزيل منشئ اساسي (%d+)$") 
if AddChannel(msg.sender_user_id_) == false then
local textchuser = bot_data:get(ban_id..'text:ch:user')
if textchuser then
send(msg.chat_id_, msg.id_,'['..textchuser..']')
else
send(msg.chat_id_, msg.id_,' ⌯︙ لا تستطيع استخدام البوت \n ⌯︙  يرجى الاشتراك بالقناه اولا \n ⌯︙  اشترك هنا ['..bot_data:get(ban_id..'add:ch:username')..']')
end
return false
end
bot_data:srem(ban_id..'Basic:Constructor'..msg.chat_id_, userid)
tdcli_function ({ID = "GetUser",user_id_ = userid},function(arg,data) 
if data.first_name_ then
usertext = '\n ⌯︙ الـعـضو   ⋖ ['..data.first_name_..'](t.me/'..(data.username_ or 'g_00_l_d')..')'
status  = '\n ⌯︙ تم تنزيله من الاساسيين'
send(msg.chat_id_, msg.id_, usertext..status)
else
usertext = '\n ⌯︙ الـعـضو   ⋖ '..userid..''
status  = '\n ⌯︙ تم تنزيله من الاساسيين'
send(msg.chat_id_, msg.id_, usertext..status)
end;end,nil)
return false
end
------------------------------------------------------------------------
if text == 'مسح المنشئين' and BasicConstructor(msg) then
bot_data:del(ban_id..'Constructor'..msg.chat_id_)
texts = ' ⌯︙ تم مسح المنشئين '
send(msg.chat_id_, msg.id_, texts)
end

if text == ("المنشئين") and BasicConstructor(msg) then
local list = bot_data:smembers(ban_id..'Constructor'..msg.chat_id_)
t = "\n ⌯︙ قائمة المنشئين \n•━═━═━═「ɢᴏʟᴅ」═━═━═━•\n"
for k,v in pairs(list) do
local username = bot_data:get(ban_id.."user:Name" .. v)
if username then
t = t..""..k.."- ([@"..username.."])\n"
else
t = t..""..k.."- (`"..v.."`)\n"
end
end
if #list == 0 then
t = " ⌯︙ لا يوجد منشئين"
end
send(msg.chat_id_, msg.id_, t)
end
if text == ("تاك للمنشئين") or text == ("صيح المنشئين") then
local list = bot_data:smembers(ban_id..'Constructor'..msg.chat_id_)
t = "\n ⌯︙ وينكم تعالو يريدوكم بالجروب \n•━═━═━═「ɢᴏʟᴅ」═━═━═━•\n"
for k,v in pairs(list) do
local username = bot_data:get(ban_id.."user:Name" .. v)
if username then
t = t..""..k.."- {[@"..username.."]}\n"
else
t = t..""..k.."- 「 '..v..' 」\n"
end
end
if #list == 0 then
t = " ⌯︙ لا يوجد منشئين"
end
send(msg.chat_id_, msg.id_, t)
end
if text ==("المنشئ") then
tdcli_function ({ID = "GetChannelMembers",channel_id_ = msg.chat_id_:gsub("-100",""),filter_ = {ID = "ChannelMembersAdministrators"},offset_ = 0,limit_ = 100},function(arg,data) 
local admins = data.members_
for i=0 , #admins do
if data.members_[i].status_.ID == "ChatMemberStatusCreator" then
owner_id = admins[i].user_id_
tdcli_function ({ID = "GetUser",user_id_ = owner_id},function(arg,b) 
if b.first_name_ == false then
send(msg.chat_id_, msg.id_," ⌯︙ حساب المنشئ محذوف")
return false  
end
if b.username_ then
UserName = b.username_
else
UserName = 'g_00_l_d'
end
local Text = "⌯︙ منشئ الجروب  ⋖ ["..b.first_name_.."](tg://user?id="..b.id_..")\n"..getbio(b.id_):gsub('لايوجد','')
local msg_id = msg.id_/2097152/0.5
keyboard = {} 
keyboard.inline_keyboard = {
{{text = '• '..b.first_name_..' •', url="t.me/"..UserName}},   
{{text = 'اضف البوت الي مجموعتك' ,url="t.me/"..dofile("./Info.lua").botUserName.."?startgroup=start"}},
}
https.request("https://api.telegram.org/bot"..token..'/sendPhoto?chat_id=' .. msg.chat_id_ .. '&photo=https://t.me/'..UserName..'&caption=' .. URL.escape(Text).."&reply_to_message_id="..msg_id.."&parse_mode=markdown&disable_web_page_preview=true&reply_markup="..JSON.encode(keyboard)) 
tdcli_function ({ID = "GetUser",user_id_ = msg.sender_user_id_},function(extra,result,success)
tdcli_function({ID ="GetChat",chat_id_=msg.chat_id_},function(arg,dp) 
local Name1 = result.first_name_
local Name1 = Name1:gsub('"',"") 
local Name1 = Name1:gsub("'","") 
local Name1 = Name1:gsub("","") 
local Name1 = Name1:gsub("*","") 
local Name1 = Name1:gsub("{","") 
local Name1 = Name1:gsub("}","") 
local Name = '['..Name1..'](tg://user?id='..result.id_..')'
local NameChat = dp.title_
local NameChat = NameChat:gsub('"',"") 
local NameChat = NameChat:gsub("'","") 
local NameChat = NameChat:gsub("","") 
local NameChat = NameChat:gsub("*","") 
local NameChat = NameChat:gsub("{","") 
local NameChat = NameChat:gsub("}","") 
local LinkGp = json:decode(https.request('https://api.telegram.org/bot'..token..'/exportChatInviteLink?chat_id='..msg.chat_id_))
if LinkGp.ok == true then 
LinkGroup = LinkGp.result
else
LinkGroup = 'لا يوجد'
end
sendText(b.id_,"⌯︙مرحبا عزيزي المنشئ هناك شخص يريدك \n⌯︙الشخص  {"..Name.."}\n⌯︙اسم الجروب {"..NameChat.."}\n⌯︙ايدي الجروب {"..msg.chat_id_.."}\n⌯︙رابط الجروب \n ["..LinkGroup.."] ",0,'md')
end,nil)
end,nil)
end,nil)
end
end
end,nil)
end
if text == "رفع منشئ" and msg.reply_to_message_id_ and BasicConstructor(msg) then
if AddChannel(msg.sender_user_id_) == false then
local textchuser = bot_data:get(ban_id..'text:ch:user')
if textchuser then
send(msg.chat_id_, msg.id_,'['..textchuser..']')
else
send(msg.chat_id_, msg.id_,' ⌯︙ لا تستطيع استخدام البوت \n ⌯︙  يرجى الاشتراك بالقناه اولا \n ⌯︙  اشترك هنا ['..bot_data:get(ban_id..'add:ch:username')..']')
end
return false
end
function start_function(extra, result, success)
bot_data:sadd(ban_id..'Constructor'..msg.chat_id_, result.sender_user_id_)
tdcli_function ({ID = "GetUser",user_id_ = result.sender_user_id_},function(arg,data) 
usertext = '\n ⌯︙  الـعـضو   ⋖ ['..data.first_name_..'](t.me/'..(data.username_ or 'g_00_l_d')..')'
status  = '\n ⌯︙ تم ترقيته منشئ'
send(msg.chat_id_, msg.id_, usertext..status)
end,nil)
end
tdcli_function ({ID = "GetMessage",chat_id_ = msg.chat_id_,message_id_ = tonumber(msg.reply_to_message_id_)}, start_function, nil)
end
if text and text:match("^رفع منشئ @(.*)$") and BasicConstructor(msg) then
local username = text:match("^رفع منشئ @(.*)$")
if AddChannel(msg.sender_user_id_) == false then
local textchuser = bot_data:get(ban_id..'text:ch:user')
if textchuser then
send(msg.chat_id_, msg.id_,'['..textchuser..']')
else
send(msg.chat_id_, msg.id_,' ⌯︙ لا تستطيع استخدام البوت \n ⌯︙  يرجى الاشتراك بالقناه اولا \n ⌯︙  اشترك هنا ['..bot_data:get(ban_id..'add:ch:username')..']')
end
return false
end
function start_function(extra, result, success)
if result.id_ then
if (result and result.type_ and result.type_.ID == "ChannelChatInfo") then
send(msg.chat_id_,msg.id_," ⌯︙ عذرا عزيزي المستخدم هاذا معرف قناة يرجى استخدام الامر بصوره صحيحه !")   
return false 
end      
bot_data:sadd(ban_id..'Constructor'..msg.chat_id_, result.id_)
usertext = '\n ⌯︙ الـعـضو   ⋖ ['..result.title_..'](t.me/'..(username or 'g_00_l_d')..')'
status  = '\n ⌯︙ تم ترقيته منشئ'
texts = usertext..status
else
texts = ' ⌯︙ لا يوجد حساب بهاذا المعرف'
end
send(msg.chat_id_, msg.id_, texts)
end
tdcli_function ({ID = "SearchPublicChat",username_ = username}, start_function, nil)
end
------------------------------------------------------------------------
if text and text:match("^رفع منشئ (%d+)$") and BasicConstructor(msg) then
local userid = text:match("^رفع منشئ (%d+)$")
if AddChannel(msg.sender_user_id_) == false then
local textchuser = bot_data:get(ban_id..'text:ch:user')
if textchuser then
send(msg.chat_id_, msg.id_,'['..textchuser..']')
else
send(msg.chat_id_, msg.id_,' ⌯︙ لا تستطيع استخدام البوت \n ⌯︙  يرجى الاشتراك بالقناه اولا \n ⌯︙  اشترك هنا ['..bot_data:get(ban_id..'add:ch:username')..']')
end
return false
end
bot_data:sadd(ban_id..'Constructor'..msg.chat_id_, userid)
tdcli_function ({ID = "GetUser",user_id_ = userid},function(arg,data) 
if data.first_name_ then
usertext = '\n ⌯︙ الـعـضو   ⋖ ['..data.first_name_..'](t.me/'..(data.username_ or 'g_00_l_d')..')'
status  = '\n ⌯︙ تم ترقيته منشئ'
send(msg.chat_id_, msg.id_, usertext..status)
else
usertext = '\n ⌯︙  الـعـضو   ⋖ '..userid..''
status  = '\n ⌯︙ تم ترقيته منشئ'
send(msg.chat_id_, msg.id_, usertext..status)
end;end,nil)
end
if text and text:match("^تنزيل منشئ$") and msg.reply_to_message_id_ and BasicConstructor(msg) then
if AddChannel(msg.sender_user_id_) == false then
local textchuser = bot_data:get(ban_id..'text:ch:user')
if textchuser then
send(msg.chat_id_, msg.id_,'['..textchuser..']')
else
send(msg.chat_id_, msg.id_,' ⌯︙ لا تستطيع استخدام البوت \n ⌯︙  يرجى الاشتراك بالقناه اولا \n ⌯︙  اشترك هنا ['..bot_data:get(ban_id..'add:ch:username')..']')
end
return false
end
function start_function(extra, result, success)
bot_data:srem(ban_id..'Constructor'..msg.chat_id_, result.sender_user_id_)
tdcli_function ({ID = "GetUser",user_id_ = result.sender_user_id_},function(arg,data) 
usertext = '\n ⌯︙ الـعـضو   ⋖ ['..data.first_name_..'](t.me/'..(data.username_ or 'g_00_l_d')..')'
status  = '\n ⌯︙ تم تنزيله من المنشئين'
send(msg.chat_id_, msg.id_, usertext..status)
end,nil)
end
tdcli_function ({ID = "GetMessage",chat_id_ = msg.chat_id_,message_id_ = tonumber(msg.reply_to_message_id_)}, start_function, nil)
end
------------------------------------------------------------------------
if text and text:match("^تنزيل منشئ @(.*)$") and BasicConstructor(msg) then
local username = text:match("^تنزيل منشئ @(.*)$")
if AddChannel(msg.sender_user_id_) == false then
local textchuser = bot_data:get(ban_id..'text:ch:user')
if textchuser then
send(msg.chat_id_, msg.id_,'['..textchuser..']')
else
send(msg.chat_id_, msg.id_,' ⌯︙ لا تستطيع استخدام البوت \n ⌯︙  يرجى الاشتراك بالقناه اولا \n ⌯︙  اشترك هنا ['..bot_data:get(ban_id..'add:ch:username')..']')
end
return false
end
function start_function(extra, result, success)
if result.id_ then
bot_data:srem(ban_id..'Constructor'..msg.chat_id_, result.id_)
usertext = '\n ⌯︙ الـعـضو   ⋖ ['..result.title_..'](t.me/'..(username or 'g_00_l_d')..')'
status  = '\n ⌯︙ تم تنزيله من المنشئين'
texts = usertext..status
else
texts = ' ⌯︙ لا يوجد حساب بهاذا المعرف'
end
send(msg.chat_id_, msg.id_, texts)
end
tdcli_function ({ID = "SearchPublicChat",username_ = username}, start_function, nil)
end
------------------------------------------------------------------------
if text and text:match("^تنزيل منشئ (%d+)$") and BasicConstructor(msg) then
local userid = text:match("^تنزيل منشئ (%d+)$")
if AddChannel(msg.sender_user_id_) == false then
local textchuser = bot_data:get(ban_id..'text:ch:user')
if textchuser then
send(msg.chat_id_, msg.id_,'['..textchuser..']')
else
send(msg.chat_id_, msg.id_,' ⌯︙ لا تستطيع استخدام البوت \n ⌯︙  يرجى الاشتراك بالقناه اولا \n ⌯︙  اشترك هنا ['..bot_data:get(ban_id..'add:ch:username')..']')
end
return false
end
bot_data:srem(ban_id..'Constructor'..msg.chat_id_, userid)
tdcli_function ({ID = "GetUser",user_id_ = userid},function(arg,data) 
if data.first_name_ then
usertext = '\n ⌯︙ الـعـضو   ⋖ ['..data.first_name_..'](t.me/'..(data.username_ or 'g_00_l_d')..')'
status  = '\n ⌯︙ تم تنزيله من المنشئين'
send(msg.chat_id_, msg.id_, usertext..status)
else
usertext = '\n ⌯︙ الـعـضو   ⋖ '..userid..''
status  = '\n ⌯︙ تم تنزيله من المنشئين'
send(msg.chat_id_, msg.id_, usertext..status)
end;end,nil)
end
------------------------------------------------------------------------
if text == 'مسح المدراء' and Constructor(msg) then
bot_data:del(ban_id..'Manager'..msg.chat_id_)
texts = ' ⌯︙ تم مسح المدراء '
send(msg.chat_id_, msg.id_, texts)
end
if text == ("المدراء") and Constructor(msg) then
local list = bot_data:smembers(ban_id..'Manager'..msg.chat_id_)
t = "\n ⌯︙ قائمة المدراء \n•━═━═━═「ɢᴏʟᴅ」═━═━═━•\n"
for k,v in pairs(list) do
local username = bot_data:get(ban_id.."user:Name" .. v)
if username then
t = t..""..k.."- ([@"..username.."])\n"
else
t = t..""..k.."- (`"..v.."`)\n"
end
end
if #list == 0 then
t = " ⌯︙ لا يوجد مدراء"
end
send(msg.chat_id_, msg.id_, t)
end
if text == ("تاك للمدراء") or text == ("صيح المدراء") then
local list = bot_data:smembers(ban_id..'Manager'..msg.chat_id_)
t = "\n ⌯︙ وينكم تعالو يريدوكم بالجروب \n•━═━═━═「ɢᴏʟᴅ」═━═━═━•\n"
for k,v in pairs(list) do
local username = bot_data:get(ban_id.."user:Name" .. v)
if username then
t = t..""..k.."- {[@"..username.."]}\n"
else
t = t..""..k.."- 「 '..v..' 」\n"
end
end
if #list == 0 then
t = " ⌯︙ لا يوجد مدراء"
end
send(msg.chat_id_, msg.id_, t)
end

if text == ("رفع مدير") and msg.reply_to_message_id_ and Constructor(msg) then
if AddChannel(msg.sender_user_id_) == false then
local textchuser = bot_data:get(ban_id..'text:ch:user')
if textchuser then
send(msg.chat_id_, msg.id_,'['..textchuser..']')
else
send(msg.chat_id_, msg.id_,' ⌯︙ لا تستطيع استخدام البوت \n ⌯︙  يرجى الاشتراك بالقناه اولا \n ⌯︙  اشترك هنا ['..bot_data:get(ban_id..'add:ch:username')..']')
end
return false
end
function start_function(extra, result, success)
bot_data:sadd(ban_id..'Manager'..msg.chat_id_, result.sender_user_id_)
tdcli_function ({ID = "GetUser",user_id_ = result.sender_user_id_},function(arg,data) 
usertext = '\n ⌯︙ الـعـضو   ⋖ ['..data.first_name_..'](t.me/'..(data.username_ or 'g_00_l_d')..')'
status  = '\n ⌯︙ تم ترقيته مدير'
send(msg.chat_id_, msg.id_, usertext..status)
end,nil)
end
tdcli_function ({ID = "GetMessage",chat_id_ = msg.chat_id_,message_id_ = tonumber(msg.reply_to_message_id_)}, start_function, nil)
return false
end  
if text and text:match("^رفع مدير @(.*)$") and Constructor(msg) then
local username = text:match("^رفع مدير @(.*)$") 
if AddChannel(msg.sender_user_id_) == false then
local textchuser = bot_data:get(ban_id..'text:ch:user')
if textchuser then
send(msg.chat_id_, msg.id_,'['..textchuser..']')
else
send(msg.chat_id_, msg.id_,' ⌯︙ لا تستطيع استخدام البوت \n ⌯︙  يرجى الاشتراك بالقناه اولا \n ⌯︙  اشترك هنا ['..bot_data:get(ban_id..'add:ch:username')..']')
end
return false
end
function start_function(extra, result, success)
if result.id_ then
if (result and result.type_ and result.type_.ID == "ChannelChatInfo") then
send(msg.chat_id_,msg.id_," ⌯︙ عذرا عزيزي المستخدم هاذا معرف قناة يرجى استخدام الامر بصوره صحيحه !")   
return false 
end      
bot_data:sadd(ban_id..'Manager'..msg.chat_id_, result.id_)
usertext = '\n ⌯︙ الـعـضو   ⋖ ['..result.title_..'](t.me/'..(username or 'g_00_l_d')..')'
status  = '\n ⌯︙ تم ترقيته مدير'
texts = usertext..status
else
texts = ' ⌯︙ لا يوجد حساب بهاذا المعرف'
end
send(msg.chat_id_, msg.id_, texts)
end
tdcli_function ({ID = "SearchPublicChat",username_ = username}, start_function, nil)
return false
end 

if text and text:match("^رفع مدير (%d+)$") and Constructor(msg) then
local userid = text:match("^رفع مدير (%d+)$") 
if AddChannel(msg.sender_user_id_) == false then
local textchuser = bot_data:get(ban_id..'text:ch:user')
if textchuser then
send(msg.chat_id_, msg.id_,'['..textchuser..']')
else
send(msg.chat_id_, msg.id_,' ⌯︙ لا تستطيع استخدام البوت \n ⌯︙  يرجى الاشتراك بالقناه اولا \n ⌯︙  اشترك هنا ['..bot_data:get(ban_id..'add:ch:username')..']')
end
return false
end
bot_data:sadd(ban_id..'Manager'..msg.chat_id_, userid)
tdcli_function ({ID = "GetUser",user_id_ = userid},function(arg,data) 
if data.first_name_ then
usertext = '\n ⌯︙ الـعـضو   ⋖ ['..data.first_name_..'](t.me/'..(data.username_ or 'g_00_l_d')..')'
status  = '\n ⌯︙ تم ترقيته مدير'
send(msg.chat_id_, msg.id_, usertext..status)
else
usertext = '\n ⌯︙ الـعـضو   ⋖ '..userid..''
status  = '\n ⌯︙ تم ترقيته مدير'
send(msg.chat_id_, msg.id_, usertext..status)
end;end,nil)
return false
end  
if text == ("تنزيل مدير") and msg.reply_to_message_id_ and Constructor(msg) then
if AddChannel(msg.sender_user_id_) == false then
local textchuser = bot_data:get(ban_id..'text:ch:user')
if textchuser then
send(msg.chat_id_, msg.id_,'['..textchuser..']')
else
send(msg.chat_id_, msg.id_,' ⌯︙ لا تستطيع استخدام البوت \n ⌯︙  يرجى الاشتراك بالقناه اولا \n ⌯︙  اشترك هنا ['..bot_data:get(ban_id..'add:ch:username')..']')
end
return false
end
function start_function(extra, result, success)
bot_data:srem(ban_id..'Manager'..msg.chat_id_, result.sender_user_id_)
tdcli_function ({ID = "GetUser",user_id_ = result.sender_user_id_},function(arg,data) 
usertext = '\n ⌯︙ الـعـضو   ⋖ ['..data.first_name_..'](t.me/'..(data.username_ or 'g_00_l_d')..')'
status  = '\n ⌯︙ تم تنزيله من المدراء'
send(msg.chat_id_, msg.id_, usertext..status)
end,nil)
end
tdcli_function ({ID = "GetMessage",chat_id_ = msg.chat_id_,message_id_ = tonumber(msg.reply_to_message_id_)}, start_function, nil)
return false
end  
if text and text:match("^تنزيل مدير @(.*)$") and Constructor(msg) then
local username = text:match("^تنزيل مدير @(.*)$")
if AddChannel(msg.sender_user_id_) == false then
local textchuser = bot_data:get(ban_id..'text:ch:user')
if textchuser then
send(msg.chat_id_, msg.id_,'['..textchuser..']')
else
send(msg.chat_id_, msg.id_,' ⌯︙ لا تستطيع استخدام البوت \n ⌯︙  يرجى الاشتراك بالقناه اولا \n ⌯︙  اشترك هنا ['..bot_data:get(ban_id..'add:ch:username')..']')
end
return false
end
function start_function(extra, result, success)
if result.id_ then
bot_data:srem(ban_id..'Manager'..msg.chat_id_, result.id_)
usertext = '\n ⌯︙ الـعـضو   ⋖ ['..result.title_..'](t.me/'..(username or 'g_00_l_d')..')'
status  = '\n ⌯︙ تم تنزيله من المدراء'
texts = usertext..status
else
texts = ' ⌯︙ لا يوجد حساب بهاذا المعرف'
end
send(msg.chat_id_, msg.id_, texts)
end
tdcli_function ({ID = "SearchPublicChat",username_ = username}, start_function, nil)
return false
end  
if text and text:match("^تنزيل مدير (%d+)$") and Constructor(msg) then
local userid = text:match("^تنزيل مدير (%d+)$") 
if AddChannel(msg.sender_user_id_) == false then
local textchuser = bot_data:get(ban_id..'text:ch:user')
if textchuser then
send(msg.chat_id_, msg.id_,'['..textchuser..']')
else
send(msg.chat_id_, msg.id_,' ⌯︙ لا تستطيع استخدام البوت \n ⌯︙  يرجى الاشتراك بالقناه اولا \n ⌯︙  اشترك هنا ['..bot_data:get(ban_id..'add:ch:username')..']')
end
return false
end
bot_data:srem(ban_id..'Manager'..msg.chat_id_, userid)
tdcli_function ({ID = "GetUser",user_id_ = userid},function(arg,data) 
if data.first_name_ then
usertext = '\n ⌯︙ الـعـضو   ⋖ ['..data.first_name_..'](t.me/'..(data.username_ or 'g_00_l_d')..')'
status  = '\n ⌯︙ تم تنزيله من المدراء'
send(msg.chat_id_, msg.id_, usertext..status)
else
usertext = '\n ⌯︙ الـعـضو   ⋖ '..userid..''
status  = '\n ⌯︙ تم تنزيله من المدراء'
send(msg.chat_id_, msg.id_, usertext..status)
end;end,nil)
return false
end
if text == ("رفع انتيمي") and tonumber(msg.reply_to_message_id_) ~= 0 and SudoBot(msg) then
function Function_KLAER(extra, result, success)
bot_data:del(ban_id.."msa3d:ban")
bot_data:sadd(ban_id.."msa3d:ban", result.sender_user_id_)
bot_data:set(ban_id.."id:msa3d:ban", result.sender_user_id_)
Reply_Status(msg,result.sender_user_id_,"reply","⌯︙ تم ترقيته انتيمي في البوت")  
end
tdcli_function ({ID = "GetMessage",chat_id_ = msg.chat_id_,message_id_ = tonumber(msg.reply_to_message_id_)}, Function_KLAER, nil)
return false 
end
if text and text:match("^رفع انتيمي @(.*)$") and SudoBot(msg) then
local username = text:match("^رفع انتيمي @(.*)$")
function Function_KLAER(extra, result, success)
if result.id_ then
if (result and result.type_ and result.type_.ID == "ChannelChatInfo") then
send(msg.chat_id_,msg.id_,"⌯︙ عذرا عزيزي المستخدم هاذا معرف قناة يرجى استخدام الامر بصوره صحيحه !")   
return false 
end      
bot_data:del(ban_id.."msa3d:ban")
bot_data:sadd(ban_id.."msa3d:ban", result.id_)
bot_data:set(ban_id.."id:msa3d:ban", result.id_)
Reply_Status(msg,result.id_,"reply","⌯︙ تم ترقيته انتيمي في البوت")  
else
send(msg.chat_id_, msg.id_,"⌯︙ لا يوجد حساب بهاذا المعرف")
end
end
tdcli_function ({ID = "SearchPublicChat",username_ = username}, Function_KLAER, nil)
return false 
end
if text and text:match("^رفع انتيمي (%d+)$") and SudoBot(msg) then
local userid = text:match("^رفع انتيمي (%d+)$")
bot_data:del(ban_id.."msa3d:ban")
bot_data:sadd(ban_id.."msa3d:ban", userid)
bot_data:set(ban_id.."id:msa3d:ban", userid)
Reply_Status(msg,userid,"reply","⌯︙ تم ترقيته انتيمي في البوت")  
return false 
end
if text == ("تنزيل الانتيمي") and SudoBot(msg) then
function Function_KLAER(extra, result, success)
local id = bot_data:get(ban_id.."id:msa3d:ban")
Reply_Status(msg,id,"reply","⌯︙ تم تنزيله من الانتيمي")  
bot_data:del(ban_id.."msa3d:ban")
bot_data:del(ban_id.."id:msa3d:ban")
end
tdcli_function ({ID = "GetMessage",chat_id_ = msg.chat_id_,message_id_ = tonumber(msg.reply_to_message_id_)}, Function_KLAER, nil)
return false 
end
if text == ("تنزيل انتيمي") and SudoBot(msg) then
function Function_KLAER(extra, result, success)
local id = bot_data:get(ban_id.."id:msa3d:ban")
Reply_Status(msg,id,"reply","⌯︙ تم تنزيله من الانتيمي")  
bot_data:del(ban_id.."msa3d:ban")
bot_data:del(ban_id.."id:msa3d:ban")
end
tdcli_function ({ID = "GetMessage",chat_id_ = msg.chat_id_,message_id_ = tonumber(msg.reply_to_message_id_)}, Function_KLAER, nil)
return false 
end
if text == "الانتيمي" or text == "انتيمي" then
local id = bot_data:get(ban_id.."id:msa3d:ban")
local urrl = https.request('https://api.telegram.org/bot'..token..'/getchat?chat_id='..id)
local json = JSON.decode(urrl)
local name = json.result.first_name
if json.result.username then
username = json.result.username
else
username = 'g_00_l_d'
end
local Name = '〈 الانتيمي 〉 -  '..name..'\n'
keyboard = {} 
keyboard.inline_keyboard = {{{text = name, url="t.me/"..username}},}
local msg_id = msg.id_/2097152/0.5
https.request("https://api.telegram.org/bot"..token..'/sendPhoto?chat_id=' .. msg.chat_id_ .. '&photo=https://t.me/'..username..'&caption=' .. URL.escape(Name).."&reply_to_message_id="..msg_id.."&parse_mode=markdown&disable_web_page_preview=true&reply_markup="..JSON.encode(keyboard)) 
end


if text == "المطور" or text == "مطور" then
local TEXT_SUD = bot_data:get(ban_id..'TEXT_SUDO')
if TEXT_SUDO then 
send(msg.chat_id_, msg.id_,TEXT_SUDO)
else
tdcli_function ({ID = "GetUser",user_id_ = SUDO,},function(arg,result) 
local function taha(extra, taha, success)
if taha.photos_[0] then
local Name = 'ᴅᴇᴠ ɴᴇᴍᴇ -> ['..result.first_name_..'](tg://user?id='..result.id_..')\n'
keyboard = {} 
keyboard.inline_keyboard = {
{
{text = ''..result.first_name_..'', url = "https://t.me/"..result.username_..""},
},
{
{text = 'اضف البوت في مجموعتك ✅' ,url="t.me/"..dofile("./Info.lua").botUserName.."?startgroup=start"},
},
}
local msg_id = msg.id_/2097152/0.5
https.request("https://api.telegram.org/bot"..token..'/sendPhoto?chat_id='..msg.chat_id_..'&caption='..URL.escape(Name)..'&photo='..taha.photos_[0].sizes_[1].photo_.persistent_id_..'&reply_to_message_id='..msg_id..'&parse_mode=markdown&disable_web_page_preview=true&reply_markup='..JSON.encode(keyboard)) 
else 
sendText(msg.chat_id_,Name,msg.id_/2097152/0.5,'md')
 end end
tdcli_function ({ ID = "GetUserProfilePhotos", user_id_ = SUDO, offset_ = 0, limit_ = 1 }, taha, nil)
end,nil)
end
end
------------------------------------------------------------------------ adddev2 sudog
if text == ("رفع مطور ثانوي") and tonumber(msg.reply_to_message_id_) ~= 0 and msa3d(msg) then
function Function_KLAER(extra, result, success)
bot_data:sadd(ban_id.."Dev:ban:2", result.sender_user_id_)
Reply_Status(msg,result.sender_user_id_,"reply","⌯︙ تم ترقيته مطور ثانوي في البوت")  
end
tdcli_function ({ID = "GetMessage",chat_id_ = msg.chat_id_,message_id_ = tonumber(msg.reply_to_message_id_)}, Function_KLAER, nil)
return false 
end
if text and text:match("^رفع مطور ثانوي @(.*)$") and msa3d(msg) then
local username = text:match("^رفع مطور ثانوي @(.*)$")
function Function_KLAER(extra, result, success)
if result.id_ then
if (result and result.type_ and result.type_.ID == "ChannelChatInfo") then
send(msg.chat_id_,msg.id_,"⌯︙ عذرا عزيزي المستخدم هاذا معرف قناة يرجى استخدام الامر بصوره صحيحه !")   
return false 
end      
bot_data:sadd(ban_id.."Dev:ban:2", result.id_)
Reply_Status(msg,result.id_,"reply","⌯︙ تم ترقيته مطور ثانوي في البوت")  
else
send(msg.chat_id_, msg.id_,"⌯︙ لا يوجد حساب بهاذا المعرف")
end
end
tdcli_function ({ID = "SearchPublicChat",username_ = username}, Function_KLAER, nil)
return false 
end
if text and text:match("^رفع مطور ثانوي (%d+)$") and msa3d(msg) then
local userid = text:match("^رفع مطور ثانوي (%d+)$")
bot_data:sadd(ban_id.."Dev:ban:2", userid)
Reply_Status(msg,userid,"reply","⌯︙ تم ترقيته مطور ثانوي في البوت")  
return false 
end
if text == ("تنزيل مطور ثانوي") and tonumber(msg.reply_to_message_id_) ~= 0 and msa3d(msg) then
function Function_KLAER(extra, result, success)
bot_data:srem(ban_id.."Dev:ban:2", result.sender_user_id_)
Reply_Status(msg,result.sender_user_id_,"reply","⌯︙ تم تنزيله من المطور ثانويين")  
end
tdcli_function ({ID = "GetMessage",chat_id_ = msg.chat_id_,message_id_ = tonumber(msg.reply_to_message_id_)}, Function_KLAER, nil)
return false 
end
if text and text:match("^تنزيل مطور ثانوي @(.*)$") and msa3d(msg) then
local username = text:match("^تنزيل مطور ثانوي @(.*)$")
function Function_KLAER(extra, result, success)
if result.id_ then
bot_data:srem(ban_id.."Dev:ban:2", result.id_)
Reply_Status(msg,result.id_,"reply","⌯︙ تم تنزيله من المطور ثانويين")  
else
send(msg.chat_id_, msg.id_,"⌯︙ لا يوجد حساب بهاذا المعرف")
end
end
tdcli_function ({ID = "SearchPublicChat",username_ = username}, Function_KLAER, nil)
return false
end  
if text and text:match("^تنزيل مطور ثانوي (%d+)$") and msa3d(msg) then
local userid = text:match("^تنزيل مطور ثانوي (%d+)$")
bot_data:srem(ban_id.."Dev:ban:2", userid)
Reply_Status(msg,userid,"reply","⌯︙ تم تنزيله من المطور ثانويين")  
return false 
end
if text == ("الثانوين") and msa3d(msg) then
local list = bot_data:smembers(ban_id.."Dev:ban:2")
t = "\n ⌯︙  قائمة مطورين الثانويين للبوت \n•━═━═━═「ɢᴏʟᴅ」═━═━═━•\n"
for k,v in pairs(list) do
local username = bot_data:get(ban_id.."user:Name" .. v)
if username then
t = t..""..k.."- ([@"..username.."])\n"
else
t = t..""..k.."- (`"..v.."`)\n"
end
end
if #list == 0 then
t = " ⌯︙  لا يوجد مطورين ثانويين"
end
send(msg.chat_id_, msg.id_, t)
end
if text == 'تفعيل النسخه التلقائيه' and SudoBot(msg) then  
send(msg.chat_id_, msg.id_,"*⌯︙تم تفعيل النسخه الاحتياطيه التلقائيه*") 
database:del(bot_id.."AutoFile")
end
if text == 'تعطيل النسخه التلقائيه' and SudoBot(msg) then  
send(msg.chat_id_, msg.id_,"*⌯︙تم تعطيل النسخه الاحتياطيه التلقائيه*") 
database:set(bot_id.."AutoFile",true) 
end
if text == ("مسح الثانوين") and SudoBot(msg) then
bot_data:del(ban_id.."Dev:ban:2")
send(msg.chat_id_, msg.id_, "\n ⌯︙ تم مسح قائمة المطورين الثانوين  ")
end
------------------------------------------------------------------------
if text == ("رفع مدير عام") and msg.reply_to_message_id_ and Constructor(msg) then
if AddChannel(msg.sender_user_id_) == false then
local textchuser = bot_data:get(ban_id..'text:ch:user')
if textchuser then
send(msg.chat_id_, msg.id_,'['..textchuser..']')
else
send(msg.chat_id_, msg.id_,' ⌯︙ لا تستطيع استخدام البوت \n ⌯︙  يرجى الاشتراك بالقناه اولا \n ⌯︙  اشترك هنا ['..bot_data:get(ban_id..'add:ch:username')..']')
end
return false
end
function start_function(extra, result, success)
bot_data:sadd(ban_id..'onall'..msg.chat_id_, result.sender_user_id_)
tdcli_function ({ID = "GetUser",user_id_ = result.sender_user_id_},function(arg,data) 
usertext = '\n ⌯︙ الـعـضو   ⋖ ['..data.first_name_..'](t.me/'..(data.username_ or 'g_00_l_d')..')'
status  = '\n ⌯︙ تم ترقيته مدير عام'
send(msg.chat_id_, msg.id_, usertext..status)
end,nil)
end
tdcli_function ({ID = "GetMessage",chat_id_ = msg.chat_id_,message_id_ = tonumber(msg.reply_to_message_id_)}, start_function, nil)
return false
end  
if text and text:match("^رفع مدير عام @(.*)$") and Constructor(msg) then
local username = text:match("^رفع مدير عام @(.*)$") 
if AddChannel(msg.sender_user_id_) == false then
local textchuser = bot_data:get(ban_id..'text:ch:user')
if textchuser then
send(msg.chat_id_, msg.id_,'['..textchuser..']')
else
send(msg.chat_id_, msg.id_,' ⌯︙ لا تستطيع استخدام البوت \n ⌯︙  يرجى الاشتراك بالقناه اولا \n ⌯︙  اشترك هنا ['..bot_data:get(ban_id..'add:ch:username')..']')
end
return false
end
function start_function(extra, result, success)
if result.id_ then
if (result and result.type_ and result.type_.ID == "ChannelChatInfo") then
send(msg.chat_id_,msg.id_," ⌯︙ عذرا عزيزي المستخدم هاذا معرف قناة يرجى استخدام الامر بصوره صحيحه !")   
return false 
end      
bot_data:sadd(ban_id..'onall'..msg.chat_id_, result.id_)
usertext = '\n ⌯︙ الـعـضو   ⋖ ['..result.title_..'](t.me/'..(username or 'g_00_l_d')..')'
status  = '\n ⌯︙ تم ترقيته مدير عام'
texts = usertext..status
else
texts = ' ⌯︙ لا يوجد حساب بهاذا المعرف'
end
send(msg.chat_id_, msg.id_, texts)
end
tdcli_function ({ID = "SearchPublicChat",username_ = username}, start_function, nil)
return false
end 

if text and text:match("^رفع مدير عام (%d+)$") and Constructor(msg) then
local userid = text:match("^رفع مدير عام (%d+)$") 
if AddChannel(msg.sender_user_id_) == false then
local textchuser = bot_data:get(ban_id..'text:ch:user')
if textchuser then
send(msg.chat_id_, msg.id_,'['..textchuser..']')
else
send(msg.chat_id_, msg.id_,' ⌯︙ لا تستطيع استخدام البوت \n ⌯︙  يرجى الاشتراك بالقناه اولا \n ⌯︙  اشترك هنا ['..bot_data:get(ban_id..'add:ch:username')..']')
end
return false
end
bot_data:sadd(ban_id..'onall'..msg.chat_id_, userid)
tdcli_function ({ID = "GetUser",user_id_ = userid},function(arg,data) 
if data.first_name_ then
usertext = '\n ⌯︙ الـعـضو   ⋖ ['..data.first_name_..'](t.me/'..(data.username_ or 'g_00_l_d')..')'
status  = '\n ⌯︙ تم ترقيته مدير عام'
send(msg.chat_id_, msg.id_, usertext..status)
else
usertext = '\n ⌯︙ الـعـضو   ⋖ '..userid..''
status  = '\n ⌯︙ تم ترقيته مدير عام'
send(msg.chat_id_, msg.id_, usertext..status)
end;end,nil)
return false
end  
if text == ("تنزيل مدير عام") and msg.reply_to_message_id_ and Constructor(msg) then
if AddChannel(msg.sender_user_id_) == false then
local textchuser = bot_data:get(ban_id..'text:ch:user')
if textchuser then
send(msg.chat_id_, msg.id_,'['..textchuser..']')
else
send(msg.chat_id_, msg.id_,' ⌯︙ لا تستطيع استخدام البوت \n ⌯︙  يرجى الاشتراك بالقناه اولا \n ⌯︙  اشترك هنا ['..bot_data:get(ban_id..'add:ch:username')..']')
end
return false
end
function start_function(extra, result, success)
bot_data:srem(ban_id..'onall'..msg.chat_id_, result.sender_user_id_)
tdcli_function ({ID = "GetUser",user_id_ = result.sender_user_id_},function(arg,data) 
usertext = '\n ⌯︙ الـعـضو   ⋖ ['..data.first_name_..'](t.me/'..(data.username_ or 'g_00_l_d')..')'
status  = '\n ⌯︙ تم تنزيله من المدراء'
send(msg.chat_id_, msg.id_, usertext..status)
end,nil)
end
tdcli_function ({ID = "GetMessage",chat_id_ = msg.chat_id_,message_id_ = tonumber(msg.reply_to_message_id_)}, start_function, nil)
return false
end  
if text and text:match("^تنزيل مدير عام @(.*)$") and Constructor(msg) then
local username = text:match("^تنزيل مدير عام @(.*)$")
if AddChannel(msg.sender_user_id_) == false then
local textchuser = bot_data:get(ban_id..'text:ch:user')
if textchuser then
send(msg.chat_id_, msg.id_,'['..textchuser..']')
else
send(msg.chat_id_, msg.id_,' ⌯︙ لا تستطيع استخدام البوت \n ⌯︙  يرجى الاشتراك بالقناه اولا \n ⌯︙  اشترك هنا ['..bot_data:get(ban_id..'add:ch:username')..']')
end
return false
end
function start_function(extra, result, success)
if result.id_ then
bot_data:srem(ban_id..'onall'..msg.chat_id_, result.id_)
usertext = '\n ⌯︙ الـعـضو   ⋖ ['..result.title_..'](t.me/'..(username or 'g_00_l_d')..')'
status  = '\n ⌯︙ تم تنزيله من المدراء'
texts = usertext..status
else
texts = ' ⌯︙ لا يوجد حساب بهاذا المعرف'
end
send(msg.chat_id_, msg.id_, texts)
end
tdcli_function ({ID = "SearchPublicChat",username_ = username}, start_function, nil)
return false
end  
if text and text:match("^تنزيل مدير عام (%d+)$") and Constructor(msg) then
local userid = text:match("^تنزيل مدير عام (%d+)$") 
if AddChannel(msg.sender_user_id_) == false then
local textchuser = bot_data:get(ban_id..'text:ch:user')
if textchuser then
send(msg.chat_id_, msg.id_,'['..textchuser..']')
else
send(msg.chat_id_, msg.id_,' ⌯︙ لا تستطيع استخدام البوت \n ⌯︙  يرجى الاشتراك بالقناه اولا \n ⌯︙  اشترك هنا ['..bot_data:get(ban_id..'add:ch:username')..']')
end
return false
end
bot_data:srem(ban_id..'onall'..msg.chat_id_, userid)
tdcli_function ({ID = "GetUser",user_id_ = userid},function(arg,data) 
if data.first_name_ then
usertext = '\n ⌯︙ الـعـضو   ⋖ ['..data.first_name_..'](t.me/'..(data.username_ or 'g_00_l_d')..')'
status  = '\n ⌯︙ تم تنزيله من المدراء'
send(msg.chat_id_, msg.id_, usertext..status)
else
usertext = '\n ⌯︙ الـعـضو   ⋖ '..userid..''
status  = '\n ⌯︙ تم تنزيله من المدراء'
send(msg.chat_id_, msg.id_, usertext..status)
end;end,nil)
return false
end
------------------------------------------------------------------------
if text == ("رفع ادمن عام") and msg.reply_to_message_id_ and Constructor(msg) then
if AddChannel(msg.sender_user_id_) == false then
local textchuser = bot_data:get(ban_id..'text:ch:user')
if textchuser then
send(msg.chat_id_, msg.id_,'['..textchuser..']')
else
send(msg.chat_id_, msg.id_,' ⌯︙ لا تستطيع استخدام البوت \n ⌯︙  يرجى الاشتراك بالقناه اولا \n ⌯︙  اشترك هنا ['..bot_data:get(ban_id..'add:ch:username')..']')
end
return false
end
function start_function(extra, result, success)
bot_data:sadd(ban_id..'moall'..msg.chat_id_, result.sender_user_id_)
tdcli_function ({ID = "GetUser",user_id_ = result.sender_user_id_},function(arg,data) 
usertext = '\n ⌯︙ الـعـضو   ⋖ ['..data.first_name_..'](t.me/'..(data.username_ or 'g_00_l_d')..')'
status  = '\n ⌯︙ تم ترقيته ادمن عام'
send(msg.chat_id_, msg.id_, usertext..status)
end,nil)
end
tdcli_function ({ID = "GetMessage",chat_id_ = msg.chat_id_,message_id_ = tonumber(msg.reply_to_message_id_)}, start_function, nil)
return false
end  
if text and text:match("^رفع ادمن عام @(.*)$") and Constructor(msg) then
local username = text:match("^رفع ادمن عام @(.*)$") 
if AddChannel(msg.sender_user_id_) == false then
local textchuser = bot_data:get(ban_id..'text:ch:user')
if textchuser then
send(msg.chat_id_, msg.id_,'['..textchuser..']')
else
send(msg.chat_id_, msg.id_,' ⌯︙ لا تستطيع استخدام البوت \n ⌯︙  يرجى الاشتراك بالقناه اولا \n ⌯︙  اشترك هنا ['..bot_data:get(ban_id..'add:ch:username')..']')
end
return false
end
function start_function(extra, result, success)
if result.id_ then
if (result and result.type_ and result.type_.ID == "ChannelChatInfo") then
send(msg.chat_id_,msg.id_," ⌯︙ عذرا عزيزي المستخدم هاذا معرف قناة يرجى استخدام الامر بصوره صحيحه !")   
return false 
end      
bot_data:sadd(ban_id..'moall'..msg.chat_id_, result.id_)
usertext = '\n ⌯︙ الـعـضو   ⋖ ['..result.title_..'](t.me/'..(username or 'textchuser')..')'
status  = '\n ⌯︙ تم ترقيته ادمن عام'
texts = usertext..status
else
texts = ' ⌯︙ لا يوجد حساب بهاذا المعرف'
end
send(msg.chat_id_, msg.id_, texts)
end
tdcli_function ({ID = "SearchPublicChat",username_ = username}, start_function, nil)
return false
end 

if text and text:match("^رفع ادمن عام (%d+)$") and Constructor(msg) then
local userid = text:match("^رفع ادمن عام (%d+)$") 
if AddChannel(msg.sender_user_id_) == false then
local textchuser = bot_data:get(ban_id..'text:ch:user')
if textchuser then
send(msg.chat_id_, msg.id_,'['..textchuser..']')
else
send(msg.chat_id_, msg.id_,' ⌯︙ لا تستطيع استخدام البوت \n ⌯︙  يرجى الاشتراك بالقناه اولا \n ⌯︙  اشترك هنا ['..bot_data:get(ban_id..'add:ch:username')..']')
end
return false
end
bot_data:sadd(ban_id..'moall'..msg.chat_id_, userid)
tdcli_function ({ID = "GetUser",user_id_ = userid},function(arg,data) 
if data.first_name_ then
usertext = '\n ⌯︙ الـعـضو   ⋖ ['..data.first_name_..'](t.me/'..(data.username_ or 'g_00_l_d')..')'
status  = '\n ⌯︙ تم ترقيته ادمن عام'
send(msg.chat_id_, msg.id_, usertext..status)
else
usertext = '\n ⌯︙ الـعـضو   ⋖ '..userid..''
status  = '\n ⌯︙ تم ترقيته ادمن عام'
send(msg.chat_id_, msg.id_, usertext..status)
end;end,nil)
return false
end  
if text == ("تنزيل ادمن عام") and msg.reply_to_message_id_ and Constructor(msg) then
if AddChannel(msg.sender_user_id_) == false then
local textchuser = bot_data:get(ban_id..'text:ch:user')
if textchuser then
send(msg.chat_id_, msg.id_,'['..textchuser..']')
else
send(msg.chat_id_, msg.id_,' ⌯︙ لا تستطيع استخدام البوت \n ⌯︙  يرجى الاشتراك بالقناه اولا \n ⌯︙  اشترك هنا ['..bot_data:get(ban_id..'add:ch:username')..']')
end
return false
end
function start_function(extra, result, success)
bot_data:srem(ban_id..'moall'..msg.chat_id_, result.sender_user_id_)
tdcli_function ({ID = "GetUser",user_id_ = result.sender_user_id_},function(arg,data) 
usertext = '\n ⌯︙ الـعـضو   ⋖ ['..data.first_name_..'](t.me/'..(data.username_ or 'g_00_l_d')..')'
status  = '\n ⌯︙ تم تنزيله من الادمنه'
send(msg.chat_id_, msg.id_, usertext..status)
end,nil)
end
tdcli_function ({ID = "GetMessage",chat_id_ = msg.chat_id_,message_id_ = tonumber(msg.reply_to_message_id_)}, start_function, nil)
return false
end  
if text and text:match("^تنزيل ادمن عام @(.*)$") and Constructor(msg) then
local username = text:match("^تنزيل ادمن عام @(.*)$")
if AddChannel(msg.sender_user_id_) == false then
local textchuser = bot_data:get(ban_id..'text:ch:user')
if textchuser then
send(msg.chat_id_, msg.id_,'['..textchuser..']')
else
send(msg.chat_id_, msg.id_,' ⌯︙ لا تستطيع استخدام البوت \n ⌯︙  يرجى الاشتراك بالقناه اولا \n ⌯︙  اشترك هنا ['..bot_data:get(ban_id..'add:ch:username')..']')
end
return false
end
function start_function(extra, result, success)
if result.id_ then
bot_data:srem(ban_id..'moall'..msg.chat_id_, result.id_)
usertext = '\n ⌯︙ الـعـضو   ⋖ ['..result.title_..'](t.me/'..(username or 'g_00_l_d')..')'
status  = '\n ⌯︙ تم تنزيله من الادمنه'
texts = usertext..status
else
texts = ' ⌯︙ لا يوجد حساب بهاذا المعرف'
end
send(msg.chat_id_, msg.id_, texts)
end
tdcli_function ({ID = "SearchPublicChat",username_ = username}, start_function, nil)
return false
end  
if text and text:match("^تنزيل ادمن عام (%d+)$") and Constructor(msg) then
local userid = text:match("^تنزيل ادمن عام (%d+)$") 
if AddChannel(msg.sender_user_id_) == false then
local textchuser = bot_data:get(ban_id..'text:ch:user')
if textchuser then
send(msg.chat_id_, msg.id_,'['..textchuser..']')
else
send(msg.chat_id_, msg.id_,' ⌯︙ لا تستطيع استخدام البوت \n ⌯︙  يرجى الاشتراك بالقناه اولا \n ⌯︙  اشترك هنا ['..bot_data:get(ban_id..'add:ch:username')..']')
end
return false
end
bot_data:srem(ban_id..'moall'..msg.chat_id_, userid)
tdcli_function ({ID = "GetUser",user_id_ = userid},function(arg,data) 
if data.first_name_ then
usertext = '\n ⌯︙ الـعـضو   ⋖ ['..data.first_name_..'](t.me/'..(data.username_ or 'g_00_l_d')..')'
status  = '\n ⌯︙ تم تنزيله من الادمنه'
send(msg.chat_id_, msg.id_, usertext..status)
else
usertext = '\n ⌯︙ الـعـضو   ⋖ '..userid..''
status  = '\n ⌯︙ تم تنزيله من الادمنه'
send(msg.chat_id_, msg.id_, usertext..status)
end;end,nil)
return false
end
------------------------------------------------------------------------
if text ==("رفع الادمنيه") and Manager(msg) then
tdcli_function ({ID = "GetChannelMembers",channel_id_ = msg.chat_id_:gsub("-100",""),filter_ = {ID = "ChannelMembersAdministrators"},offset_ = 0,limit_ = 100},function(arg,data) 
local num2 = 0
local admins = data.members_
for i=0 , #admins do
if data.members_[i].bot_info_ == false and data.members_[i].status_.ID == "ChatMemberStatusEditor" then
bot_data:sadd(ban_id.."Mod:User"..msg.chat_id_, admins[i].user_id_)
num2 = num2 + 1
tdcli_function ({ID = "GetUser",user_id_ = admins[i].user_id_},function(arg,b) 
if b.username_ == true then
end
if b.first_name_ == false then
bot_data:srem(ban_id.."Mod:User"..msg.chat_id_, admins[i].user_id_)
end
end,nil)   
else
bot_data:srem(ban_id.."Mod:User"..msg.chat_id_, admins[i].user_id_)
end
end
if num2 == 0 then
send(msg.chat_id_, msg.id_," ⌯︙ لا يوجد ادمنيه ليتم رفعهم") 
else
send(msg.chat_id_, msg.id_," ⌯︙ تمت ترقيه { "..num2.." } من الادمنيه") 
end
end,nil)   
end
if text == 'مسح الادمنيه' and Manager(msg) then
bot_data:del(ban_id..'Mod:User'..msg.chat_id_)
send(msg.chat_id_, msg.id_, ' ⌯︙ تم مسح الادمنيه')
end
if text == ("الادمنيه") and Manager(msg) then
local list = bot_data:smembers(ban_id..'Mod:User'..msg.chat_id_)
t = "\n ⌯︙ قائمة الادمنيه \n•━═━═━═「ɢᴏʟᴅ」═━═━═━•\n"
for k,v in pairs(list) do
local username = bot_data:get(ban_id.."user:Name" .. v)
if username then
t = t..""..k.."- ([@"..username.."])\n"
else
t = t..""..k.."- (`"..v.."`)\n"
end
end
if #list == 0 then
t = " ⌯︙ لا يوجد ادمنيه"
end
send(msg.chat_id_, msg.id_, t)
end
if text == ("تاك للادمنيه") or text == ("صيح الادمنيه") then
local list = bot_data:smembers(ban_id..'Mod:User'..msg.chat_id_)
t = "\n ⌯︙ وينكم تعالو يريدوكم بالجروب \n•━═━═━═「ɢᴏʟᴅ」═━═━═━•\n"
for k,v in pairs(list) do
local username = bot_data:get(ban_id.."user:Name" .. v)
if username then
t = t..""..k.."- {[@"..username.."]}\n"
else
t = t..""..k.."- 「 '..v..' 」\n"
end
end
if #list == 0 then
t = " ⌯︙ لا يوجد ادمنيه"
end
send(msg.chat_id_, msg.id_, t)
end
if text == ("رفع ادمن") and msg.reply_to_message_id_ and Manager(msg) then
if AddChannel(msg.sender_user_id_) == false then
local textchuser = bot_data:get(ban_id..'text:ch:user')
if textchuser then
send(msg.chat_id_, msg.id_,'['..textchuser..']')
else
send(msg.chat_id_, msg.id_,' ⌯︙ لا تستطيع استخدام البوت \n ⌯︙  يرجى الاشتراك بالقناه اولا \n ⌯︙  اشترك هنا ['..bot_data:get(ban_id..'add:ch:username')..']')
end
return false
end
function start_function(extra, result, success)
if bot_data:get(ban_id..'Lock:Add:Bot'..msg.chat_id_) and not Constructor(msg) then
send(msg.chat_id_, msg.id_,' ⌯︙ تم تعطيل الرفع') 
return false
end
bot_data:sadd(ban_id..'Mod:User'..msg.chat_id_, result.sender_user_id_)
tdcli_function ({ID = "GetUser",user_id_ = result.sender_user_id_},function(arg,data) 
usertext = '\n ⌯︙ الـعـضو   ⋖ ['..data.first_name_..'](t.me/'..(data.username_ or 'g_00_l_d')..')'
status  = '\n ⌯︙ تم ترقيته ادمن'
send(msg.chat_id_, msg.id_, usertext..status)
end,nil)
end
tdcli_function ({ID = "GetMessage",chat_id_ = msg.chat_id_,message_id_ = tonumber(msg.reply_to_message_id_)}, start_function, nil)
return false
end
if text and text:match("^رفع ادمن @(.*)$") and Manager(msg) then
local username = text:match("^رفع ادمن @(.*)$")
if AddChannel(msg.sender_user_id_) == false then
local textchuser = bot_data:get(ban_id..'text:ch:user')
if textchuser then
send(msg.chat_id_, msg.id_,'['..textchuser..']')
else
send(msg.chat_id_, msg.id_,' ⌯︙ لا تستطيع استخدام البوت \n ⌯︙  يرجى الاشتراك بالقناه اولا \n ⌯︙  اشترك هنا ['..bot_data:get(ban_id..'add:ch:username')..']')
end
return false
end
if bot_data:get(ban_id..'Lock:Add:Bot'..msg.chat_id_) and not Constructor(msg) then
send(msg.chat_id_, msg.id_,' ⌯︙ تم تعطيل الرفع') 
return false
end
function start_function(extra, result, success)
if result.id_ then
if (result and result.type_ and result.type_.ID == "ChannelChatInfo") then
send(msg.chat_id_,msg.id_," ⌯︙ عذرا عزيزي المستخدم هاذا معرف قناة يرجى استخدام الامر بصوره صحيحه !")   
return false 
end      
bot_data:sadd(ban_id..'Mod:User'..msg.chat_id_, result.id_)
usertext = '\n ⌯︙ الـعـضو   ⋖ ['..result.title_..'](t.me/'..(username or 'g_00_l_d')..')'
status  = '\n ⌯︙ تم ترقيته ادمن'
texts = usertext..status
else
texts = ' ⌯︙ لا يوجد حساب بهاذا المعرف'
end
send(msg.chat_id_, msg.id_, texts)
end
tdcli_function ({ID = "SearchPublicChat",username_ = username}, start_function, nil)
return false
end
if text and text:match("^رفع ادمن (%d+)$") and Manager(msg) then
local userid = text:match("^رفع ادمن (%d+)$")
if AddChannel(msg.sender_user_id_) == false then
local textchuser = bot_data:get(ban_id..'text:ch:user')
if textchuser then
send(msg.chat_id_, msg.id_,'['..textchuser..']')
else
send(msg.chat_id_, msg.id_,' ⌯︙ لا تستطيع استخدام البوت \n ⌯︙  يرجى الاشتراك بالقناه اولا \n ⌯︙  اشترك هنا ['..bot_data:get(ban_id..'add:ch:username')..']')
end
return false
end
if bot_data:get(ban_id..'Lock:Add:Bot'..msg.chat_id_) and not Constructor(msg) then
send(msg.chat_id_, msg.id_,' ⌯︙ تم تعطيل الرفع') 
return false
end
bot_data:sadd(ban_id..'Mod:User'..msg.chat_id_, userid)
tdcli_function ({ID = "GetUser",user_id_ = userid},function(arg,data) 
if data.first_name_ then
usertext = '\n ⌯︙ الـعـضو   ⋖ ['..data.first_name_..'](t.me/'..(data.username_ or 'g_00_l_d')..')'
status  = '\n ⌯︙ تم ترقيته ادمن'
send(msg.chat_id_, msg.id_, usertext..status)
else
usertext = '\n ⌯︙ الـعـضو   ⋖ '..userid..''
status  = '\n ⌯︙ تم ترقيته ادمن'
send(msg.chat_id_, msg.id_, usertext..status)
end;end,nil)
return false
end
if text == ("تنزيل ادمن") and msg.reply_to_message_id_ and Manager(msg) then
if AddChannel(msg.sender_user_id_) == false then
local textchuser = bot_data:get(ban_id..'text:ch:user')
if textchuser then
send(msg.chat_id_, msg.id_,'['..textchuser..']')
else
send(msg.chat_id_, msg.id_,' ⌯︙ لا تستطيع استخدام البوت \n ⌯︙  يرجى الاشتراك بالقناه اولا \n ⌯︙  اشترك هنا ['..bot_data:get(ban_id..'add:ch:username')..']')
end
return false
end
function start_function(extra, result, success)
bot_data:srem(ban_id..'Mod:User'..msg.chat_id_, result.sender_user_id_)
tdcli_function ({ID = "GetUser",user_id_ = result.sender_user_id_},function(arg,data) 
usertext = '\n ⌯︙ الـعـضو   ⋖ ['..data.first_name_..'](t.me/'..(data.username_ or 'g_00_l_d')..')'
status  = '\n ⌯︙ تم تنزيله من الادمنيه'
send(msg.chat_id_, msg.id_, usertext..status)
end,nil)
end
tdcli_function ({ID = "GetMessage",chat_id_ = msg.chat_id_,message_id_ = tonumber(msg.reply_to_message_id_)}, start_function, nil)
return false
end
if text and text:match("^تنزيل ادمن @(.*)$") and Manager(msg) then
local username = text:match("^تنزيل ادمن @(.*)$") 
if AddChannel(msg.sender_user_id_) == false then
local textchuser = bot_data:get(ban_id..'text:ch:user')
if textchuser then
send(msg.chat_id_, msg.id_,'['..textchuser..']')
else
send(msg.chat_id_, msg.id_,' ⌯︙ لا تستطيع استخدام البوت \n ⌯︙  يرجى الاشتراك بالقناه اولا \n ⌯︙  اشترك هنا ['..bot_data:get(ban_id..'add:ch:username')..']')
end
return false
end
function start_function(extra, result, success)
if result.id_ then
bot_data:srem(ban_id..'Mod:User'..msg.chat_id_, result.id_)
usertext = '\n ⌯︙ الـعـضو   ⋖ ['..result.title_..'](t.me/'..(username or 'g_00_l_d')..')'
status  = '\n ⌯︙ تم تنزيله من الادمنيه'
texts = usertext..status
else
texts = ' ⌯︙ لا يوجد حساب بهاذا المعرف'
end
send(msg.chat_id_, msg.id_, texts)
end
tdcli_function ({ID = "SearchPublicChat",username_ = username}, start_function, nil)
return false
end
if text and text:match("^تنزيل ادمن (%d+)$") and Manager(msg) then
local userid = text:match("^تنزيل ادمن (%d+)$")
if AddChannel(msg.sender_user_id_) == false then
local textchuser = bot_data:get(ban_id..'text:ch:user')
if textchuser then
send(msg.chat_id_, msg.id_,'['..textchuser..']')
else
send(msg.chat_id_, msg.id_,' ⌯︙ لا تستطيع استخدام البوت \n ⌯︙  يرجى الاشتراك بالقناه اولا \n ⌯︙  اشترك هنا ['..bot_data:get(ban_id..'add:ch:username')..']')
end
return false
end
bot_data:srem(ban_id..'Mod:User'..msg.chat_id_, userid)
tdcli_function ({ID = "GetUser",user_id_ = userid},function(arg,data) 
if data.first_name_ then
usertext = '\n ⌯︙ الـعـضو   ⋖ ['..data.first_name_..'](t.me/'..(data.username_ or 'g_00_l_d')..')'
status  = '\n ⌯︙ تم تنزيله من الادمنيه'
send(msg.chat_id_, msg.id_, usertext..status)
else
usertext = '\n ⌯︙ الـعـضو   ⋖ '..userid..''
status  = '\n ⌯︙ تم تنزيله من الادمنيه'
send(msg.chat_id_, msg.id_, usertext..status)
end;end,nil)
return false
end
if text == 'مسح المنظفين' and BasicConstructor(msg) then
bot_data:del(ban_id..'Boody:MN:TF'..msg.chat_id_)
send(msg.chat_id_, msg.id_, ' ⌯︙ تم مسح المنظفين')
end
if text == ("المنظفين") and BasicConstructor(msg) then
local list = bot_data:smembers(ban_id..'Boody:MN:TF'..msg.chat_id_)
t = "\n ⌯︙ قائمة المنظفين \n━━━━━━𝓓𝓡𝓖━━━━━━\n"
for k,v in pairs(list) do
local username = bot_data:get(ban_id.."user:Name" .. v)
if username then
t = t..""..k.."- ([@"..username.."])\n"
else
t = t..""..k.."- (`"..v.."`)\n"
end
end
if #list == 0 then
t = " ⌯︙ لا يوجد المنظفين"
end
send(msg.chat_id_, msg.id_, t)
end
if text == ("تاك للمنظفين") or text == ("صيح المنظفين") then
local list = bot_data:smembers(ban_id..'Boody:MN:TF'..msg.chat_id_)
t = "\n ⌯︙ وينكم تعالو يريدوكم بالجروب \n━━━━━━𝓓𝓡𝓖━━━━━━\n"
for k,v in pairs(list) do
local username = bot_data:get(ban_id.."user:Name" .. v)
if username then
t = t..""..k.."- {[@"..username.."]}\n"
else
t = t..""..k.."- 「 '..v..' 」\n"
end
end
if #list == 0 then
t = " ⌯︙ لا يوجد منظفيه"
end
send(msg.chat_id_, msg.id_, t)
end
if text == ("رفع منظف") and msg.reply_to_message_id_ and BasicConstructor(msg) then
if AddChannel(msg.sender_user_id_) == false then
local textchuser = bot_data:get(ban_id..'text:ch:user')
if textchuser then
send(msg.chat_id_, msg.id_,'['..textchuser..']')
else
send(msg.chat_id_, msg.id_,' ⌯︙ لا تستطيع استخدام البوت \n ⌯︙  يرجى الاشتراك بالقناه اولا \n ⌯︙  اشترك هنا ['..bot_data:get(ban_id..'add:ch:username')..']')
end
return false
end
function start_function(extra, result, success)
if bot_data:get(ban_id..'Lock:Add:Bot'..msg.chat_id_) and not BasicConstructor(msg) then
send(msg.chat_id_, msg.id_,' ⌯︙ تم تعطيل الرفع') 
return false
end
bot_data:sadd(ban_id..'Boody:MN:TF'..msg.chat_id_, result.sender_user_id_)
tdcli_function ({ID = "GetUser",user_id_ = result.sender_user_id_},function(arg,data) 
usertext = '\n ⌯︙ الـعـضو   ⋖ ['..data.first_name_..'](t.me/'..(data.username_ or 'g_00_l_d')..')'
status  = '\n ⌯︙ تم ترقيته منظف'
send(msg.chat_id_, msg.id_, usertext..status)
end,nil)
end
tdcli_function ({ID = "GetMessage",chat_id_ = msg.chat_id_,message_id_ = tonumber(msg.reply_to_message_id_)}, start_function, nil)
return false
end
if text and text:match("^رفع منظف @(.*)$") and BasicConstructor(msg) then
local username = text:match("^رفع منظف @(.*)$")
if AddChannel(msg.sender_user_id_) == false then
local textchuser = bot_data:get(ban_id..'text:ch:user')
if textchuser then
send(msg.chat_id_, msg.id_,'['..textchuser..']')
else
send(msg.chat_id_, msg.id_,' ⌯︙ لا تستطيع استخدام البوت \n ⌯︙  يرجى الاشتراك بالقناه اولا \n ⌯︙  اشترك هنا ['..bot_data:get(ban_id..'add:ch:username')..']')
end
return false
end
if bot_data:get(ban_id..'Lock:Add:Bot'..msg.chat_id_) and not BasicConstructor(msg) then
send(msg.chat_id_, msg.id_,' ⌯︙ تم تعطيل الرفع') 
return false
end
function start_function(extra, result, success)
if result.id_ then
if (result and result.type_ and result.type_.ID == "ChannelChatInfo") then
send(msg.chat_id_,msg.id_," ⌯︙ عذرا عزيزي المستخدم هاذا معرف قناة يرجى استخدام الامر بصوره صحيحه !")   
return false 
end      
bot_data:sadd(ban_id..'Boody:MN:TF'..msg.chat_id_, result.id_)
usertext = '\n ⌯︙ الـعـضو   ⋖ ['..result.title_..'](t.me/'..(username or 'g_00_l_d')..')'
status  = '\n ⌯︙ تم ترقيته منظف'
texts = usertext..status
else
texts = ' ⌯︙ لا يوجد حساب بهاذا المعرف'
end
send(msg.chat_id_, msg.id_, texts)
end
tdcli_function ({ID = "SearchPublicChat",username_ = username}, start_function, nil)
return false
end
if text and text:match("^رفع منظف (%d+)$") and BasicConstructor(msg) then
local userid = text:match("^رفع منظف (%d+)$")
if AddChannel(msg.sender_user_id_) == false then
local textchuser = bot_data:get(ban_id..'text:ch:user')
if textchuser then
send(msg.chat_id_, msg.id_,'['..textchuser..']')
else
send(msg.chat_id_, msg.id_,' ⌯︙ لا تستطيع استخدام البوت \n ⌯︙  يرجى الاشتراك بالقناه اولا \n ⌯︙  اشترك هنا ['..bot_data:get(ban_id..'add:ch:username')..']')
end
return false
end
if bot_data:get(ban_id..'Lock:Add:Bot'..msg.chat_id_) and not BasicConstructor(msg) then
send(msg.chat_id_, msg.id_,' ⌯︙ تم تعطيل الرفع') 
return false
end
bot_data:sadd(ban_id..'Boody:MN:TF'..msg.chat_id_, userid)
tdcli_function ({ID = "GetUser",user_id_ = userid},function(arg,data) 
if data.first_name_ then
usertext = '\n ⌯︙ الـعـضو   ⋖ ['..data.first_name_..'](t.me/'..(data.username_ or 'g_00_l_d')..')'
status  = '\n ⌯︙ تم ترقيته منظف'
send(msg.chat_id_, msg.id_, usertext..status)
else
usertext = '\n ⌯︙ الـعـضو   ⋖ '..userid..''
status  = '\n ⌯︙ تم ترقيته منظف'
send(msg.chat_id_, msg.id_, usertext..status)
end;end,nil)
return false
end
if text == ("تنزيل منظف") and msg.reply_to_message_id_ and BasicConstructor(msg) then
if AddChannel(msg.sender_user_id_) == false then
local textchuser = bot_data:get(ban_id..'text:ch:user')
if textchuser then
send(msg.chat_id_, msg.id_,'['..textchuser..']')
else
send(msg.chat_id_, msg.id_,' ⌯︙ لا تستطيع استخدام البوت \n ⌯︙  يرجى الاشتراك بالقناه اولا \n ⌯︙  اشترك هنا ['..bot_data:get(ban_id..'add:ch:username')..']')
end
return false
end
function start_function(extra, result, success)
bot_data:srem(ban_id..'Boody:MN:TF'..msg.chat_id_, result.sender_user_id_)
tdcli_function ({ID = "GetUser",user_id_ = result.sender_user_id_},function(arg,data) 
usertext = '\n ⌯︙ الـعـضو   ⋖ ['..data.first_name_..'](t.me/'..(data.username_ or 'g_00_l_d')..')'
status  = '\n ⌯︙ تم تنزيله من المنظفين'
send(msg.chat_id_, msg.id_, usertext..status)
end,nil)
end
tdcli_function ({ID = "GetMessage",chat_id_ = msg.chat_id_,message_id_ = tonumber(msg.reply_to_message_id_)}, start_function, nil)
return false
end
if text and text:match("^تنزيل منظف @(.*)$") and BasicConstructor(msg) then
local username = text:match("^تنزيل منظف @(.*)$") 
if AddChannel(msg.sender_user_id_) == false then
local textchuser = bot_data:get(ban_id..'text:ch:user')
if textchuser then
send(msg.chat_id_, msg.id_,'['..textchuser..']')
else
send(msg.chat_id_, msg.id_,' ⌯︙ لا تستطيع استخدام البوت \n ⌯︙  يرجى الاشتراك بالقناه اولا \n ⌯︙  اشترك هنا ['..bot_data:get(ban_id..'add:ch:username')..']')
end
return false
end
function start_function(extra, result, success)
if result.id_ then
bot_data:srem(ban_id..'Boody:MN:TF'..msg.chat_id_, result.id_)
usertext = '\n ⌯︙ الـعـضو   ⋖ ['..result.title_..'](t.me/'..(username or 'g_00_l_d')..')'
status  = '\n ⌯︙ تم تنزيله من المنظفين'
texts = usertext..status
else
texts = ' ⌯︙ لا يوجد حساب بهاذا المعرف'
end
send(msg.chat_id_, msg.id_, texts)
end
tdcli_function ({ID = "SearchPublicChat",username_ = username}, start_function, nil)
return false
end
if text and text:match("^تنزيل منظف (%d+)$") and BasicConstructor(msg) then
local userid = text:match("^تنزيل منظف (%d+)$")
if AddChannel(msg.sender_user_id_) == false then
local textchuser = bot_data:get(ban_id..'text:ch:user')
if textchuser then
send(msg.chat_id_, msg.id_,'['..textchuser..']')
else
send(msg.chat_id_, msg.id_,' ⌯︙ لا تستطيع استخدام البوت \n ⌯︙  يرجى الاشتراك بالقناه اولا \n ⌯︙  اشترك هنا ['..bot_data:get(ban_id..'add:ch:username')..']')
end
return false
end
bot_data:srem(ban_id..'Boody:MN:TF'..msg.chat_id_, userid)
tdcli_function ({ID = "GetUser",user_id_ = userid},function(arg,data) 
if data.first_name_ then
usertext = '\n ⌯︙ الـعـضو   ⋖ ['..data.first_name_..'](t.me/'..(data.username_ or 'g_00_l_d')..')'
status  = '\n ⌯︙ تم تنزيله من المنظفين'
send(msg.chat_id_, msg.id_, usertext..status)
else
usertext = '\n ⌯︙ الـعـضو   ⋖ '..userid..''
status  = '\n ⌯︙ تم تنزيله من المنظفين'
send(msg.chat_id_, msg.id_, usertext..status)
end;end,nil)
return false
end
------------------------------------------------------------------------
if text == ("طرد") and msg.reply_to_message_id_ ~=0 and Mod(msg) then
if AddChannel(msg.sender_user_id_) == false then
local textchuser = bot_data:get(ban_id..'text:ch:user')
if textchuser then
send(msg.chat_id_, msg.id_,'['..textchuser..']')
else
send(msg.chat_id_, msg.id_,' ⌯︙ لا تستطيع استخدام البوت \n ⌯︙  يرجى الاشتراك بالقناه اولا \n ⌯︙  اشترك هنا ['..bot_data:get(ban_id..'add:ch:username')..']')
end
return false
end
if bot_data:get(ban_id..'Lock:kick'..msg.chat_id_) and not Constructor(msg) then
send(msg.chat_id_, msg.id_,' ⌯︙ تم تعطيل الطرد') 
return false
end
function start_function(extra, result, success)
if tonumber(result.sender_user_id_) == tonumber(ban_id) then  
send(msg.chat_id_, msg.id_, " ⌯︙ لا تسطيع طرد البوت ")
return false 
end
if Can_or_NotCan(result.sender_user_id_, msg.chat_id_) == true then
send(msg.chat_id_, msg.id_, '\n ⌯︙ عذرا لا تستطيع طرد ( '..Rutba(result.sender_user_id_,msg.chat_id_)..' )')
else
tdcli_function ({ ID = "ChangeChatMemberStatus", chat_id_ = msg.chat_id_, user_id_ = result.id_, status_ = { ID = "ChatMemberStatusKicked" },},function(arg,data) 
if (data and data.code_ and data.code_ == 400 and data.message_ == "CHAT_ADMIN_REQUIRED") then 
send(msg.chat_id_, msg.id_,' ⌯︙  ليس لدي صلاحية حظر المستخدمين يرجى تفعيلها !') 
return false  
end
if msg.can_be_deleted_ == false then 
send(msg.chat_id_, msg.id_,' ⌯︙ البوت ليس ادمن يرجى ترقيتي !') 
return false  
end
tdcli_function ({ID = "GetUser",user_id_ = result.sender_user_id_},function(arg,data) 
usertext = '\n ⌯︙ الـعـضو   ⋖ ['..data.first_name_..'](t.me/'..(data.username_ or 'g_00_l_d')..')'
statusk  = '\n ⌯︙ تم طرد الـعـضو '
send(msg.chat_id_, msg.id_, usertext..statusk)
end,nil)
chat_kick(result.chat_id_, result.sender_user_id_)
end,nil)   
end
end
tdcli_function ({ID = "GetMessage",chat_id_ = msg.chat_id_,message_id_ = tonumber(msg.reply_to_message_id_)}, start_function, nil)
return false
end  
if text and text:match("^طرد @(.*)$") and Mod(msg) then 
local username = text:match("^طرد @(.*)$")
if AddChannel(msg.sender_user_id_) == false then
local textchuser = bot_data:get(ban_id..'text:ch:user')
if textchuser then
send(msg.chat_id_, msg.id_,'['..textchuser..']')
else
send(msg.chat_id_, msg.id_,' ⌯︙ لا تستطيع استخدام البوت \n ⌯︙  يرجى الاشتراك بالقناه اولا \n ⌯︙  اشترك هنا ['..bot_data:get(ban_id..'add:ch:username')..']')
end
return false
end
if bot_data:get(ban_id..'Lock:kick'..msg.chat_id_) and not Constructor(msg) then
send(msg.chat_id_, msg.id_,' ⌯︙ تم تعطيل الطرد') 
return false
end
function start_function(extra, result, success)
if result.id_ then
if tonumber(result.id_) == tonumber(ban_id) then  
send(msg.chat_id_, msg.id_, " ⌯︙ لا تسطيع طرد البوت ")
return false 
end
if Can_or_NotCan(result.id_, msg.chat_id_) == true then
send(msg.chat_id_, msg.id_, '\n ⌯︙ عذرا لا تستطيع طرد ( '..Rutba(result.id_,msg.chat_id_)..' )')
else
tdcli_function ({ ID = "ChangeChatMemberStatus", chat_id_ = msg.chat_id_, user_id_ = result.id_, status_ = { ID = "ChatMemberStatusKicked" },},function(arg,data) 
if (result and result.type_ and result.type_.ID == "ChannelChatInfo") then
send(msg.chat_id_,msg.id_,"⚠| عذرا عزيزي المستخدم هاذا معرف قناة يرجى استخدام الامر بصوره صحيحه !")   
return false 
end      
if (data and data.code_ and data.code_ == 400 and data.message_ == "CHAT_ADMIN_REQUIRED") then 
send(msg.chat_id_, msg.id_,' ⌯︙  ليس لدي صلاحية حظر المستخدمين يرجى تفعيلها !') 
return false  
end
if msg.can_be_deleted_ == false then 
send(msg.chat_id_, msg.id_,' ⌯︙ البوت ليس ادمن يرجى ترقيتي !') 
return false  
end
usertext = '\n ⌯︙ الـعـضو   ⋖ ['..result.title_..'](t.me/'..(username or 'g_00_l_d')..')'
statusk  = '\n ⌯︙ تم طرد الـعـضو '
texts = usertext..statusk
chat_kick(msg.chat_id_, result.id_)
send(msg.chat_id_, msg.id_, texts)
end,nil)   
end
else
send(msg.chat_id_, msg.id_, ' ⌯︙ لا يوجد حساب بهاذا المعرف')
end
end
tdcli_function ({ID = "SearchPublicChat",username_ = username}, start_function, nil)
return false
end  

if text and text:match("^طرد (%d+)$") and Mod(msg) then 
local userid = text:match("^طرد (%d+)$") 
if AddChannel(msg.sender_user_id_) == false then
local textchuser = bot_data:get(ban_id..'text:ch:user')
if textchuser then
send(msg.chat_id_, msg.id_,'['..textchuser..']')
else
send(msg.chat_id_, msg.id_,' ⌯︙ لا تستطيع استخدام البوت \n ⌯︙  يرجى الاشتراك بالقناه اولا \n ⌯︙  اشترك هنا ['..bot_data:get(ban_id..'add:ch:username')..']')
end
return false
end
if bot_data:get(ban_id..'Lock:kick'..msg.chat_id_) and not Constructor(msg) then
send(msg.chat_id_, msg.id_,' ⌯︙ تم تعطيل الطرد') 
return false
end
if tonumber(userid) == tonumber(ban_id) then  
send(msg.chat_id_, msg.id_, " ⌯︙ لا تسطيع طرد البوت ")
return false 
end
if Can_or_NotCan(userid, msg.chat_id_) == true then
send(msg.chat_id_, msg.id_, '\n ⌯︙ عذرا لا تستطيع طرد ( '..Rutba(userid,msg.chat_id_)..' )')
else
tdcli_function ({ ID = "ChangeChatMemberStatus", chat_id_ = msg.chat_id_, user_id_ = userid, status_ = { ID = "ChatMemberStatusKicked" },},function(arg,data) 
if (data and data.code_ and data.code_ == 400 and data.message_ == "CHAT_ADMIN_REQUIRED") then 
send(msg.chat_id_, msg.id_,' ⌯︙ ليس لدي صلاحية حظر المستخدمين يرجى تفعيلها !') 
return false  
end
if msg.can_be_deleted_ == false then 
send(msg.chat_id_, msg.id_,' ⌯︙ البوت ليس ادمن يرجى ترقيتي !') 
return false  
end
chat_kick(msg.chat_id_, userid)
tdcli_function ({ID = "GetUser",user_id_ = userid},function(arg,data) 
if data.first_name_ then
 usertext = '\n ⌯︙ الـعـضو   ⋖ ['..data.first_name_..'](t.me/'..(data.username_ or 'g_00_l_d')..')'
 statusk  = '\n ⌯︙ تم طرد الـعـضو '
send(msg.chat_id_, msg.id_, usertext..statusk)
else
 usertext = '\n ⌯︙ الـعـضو   ⋖ '..userid..''
 statusk  = '\n ⌯︙ تم طرد الـعـضو '
send(msg.chat_id_, msg.id_, usertext..statusk)
end;end,nil)
end,nil)   
end
return false
end
------------------------------------------------------------------------
------------------------------------------------------------------------
if text == 'مسح المميزين' and Mod(msg) then
bot_data:del(ban_id..'Special:User'..msg.chat_id_)
send(msg.chat_id_, msg.id_, ' ⌯︙ تم مسح المميزين')
end
if text == ("المميزين") and Mod(msg) then
local list = bot_data:smembers(ban_id..'Special:User'..msg.chat_id_)
t = "\n ⌯︙ قائمة مميزين الجروب \n•━═━═━═「ɢᴏʟᴅ」═━═━═━•\n"
for k,v in pairs(list) do
local username = bot_data:get(ban_id.."user:Name" .. v)
if username then
t = t..""..k.."- ([@"..username.."])\n"
else
t = t..""..k.."- (`"..v.."`)\n"
end
end
if #list == 0 then
t = " ⌯︙ لا يوجد مميزين"
end
send(msg.chat_id_, msg.id_, t)
end
if text == ("تاك للمميزين") or text == ("صيح المميزين") then
local list = bot_data:smembers(ban_id..'Special:User'..msg.chat_id_)
t = "\n ⌯︙ وينكم تعالو يريدوكم بالجروب \n•━═━═━═「ɢᴏʟᴅ」═━═━═━•\n"
for k,v in pairs(list) do
local username = bot_data:get(ban_id.."user:Name" .. v)
if username then
t = t..""..k.."- {[@"..username.."]}\n"
else
t = t..""..k.."- 「 '..v..' 」\n"
end
end
if #list == 0 then
t = " ⌯︙ لا يوجد مميزين"
end
send(msg.chat_id_, msg.id_, t)
end
if text == ("رفع مميز") and tonumber(msg.reply_to_message_id_) ~= 0 and Mod(msg) then
if AddChannel(msg.sender_user_id_) == false then
local textchuser = bot_data:get(ban_id..'text:ch:user')
if textchuser then
send(msg.chat_id_, msg.id_,'['..textchuser..']')
else
send(msg.chat_id_, msg.id_,' ⌯︙ لا تستطيع استخدام البوت \n ⌯︙  يرجى الاشتراك بالقناه اولا \n ⌯︙  اشترك هنا ['..bot_data:get(ban_id..'add:ch:username')..']')
end
return false
end
if bot_data:get(ban_id..'Lock:Add:Bot'..msg.chat_id_) and not Constructor(msg) then
send(msg.chat_id_, msg.id_,' ⌯︙ تم تعطيل الرفع') 
return false
end
function start_function(extra, result, success)
bot_data:sadd(ban_id..'Special:User'..msg.chat_id_, result.sender_user_id_)
tdcli_function ({ID = "GetUser",user_id_ = result.sender_user_id_},function(arg,data) 
usertext = '\n ⌯︙ الـعـضو   ⋖ ['..data.first_name_..'](t.me/'..(data.username_ or 'g_00_l_d')..')'
local  statuss  = '\n ⌯︙ تم ترقيته مميز'
send(msg.chat_id_, msg.id_, usertext..statuss)
end,nil)
end
tdcli_function ({ID = "GetMessage",chat_id_ = msg.chat_id_,message_id_ = tonumber(msg.reply_to_message_id_)}, start_function, nil)
return false
end
if text and text:match("^رفع مميز @(.*)$") and Mod(msg) then
local username = text:match("^رفع مميز @(.*)$") 
if AddChannel(msg.sender_user_id_) == false then
local textchuser = bot_data:get(ban_id..'text:ch:user')
if textchuser then
send(msg.chat_id_, msg.id_,'['..textchuser..']')
else
send(msg.chat_id_, msg.id_,' ⌯︙ لا تستطيع استخدام البوت \n ⌯︙  يرجى الاشتراك بالقناه اولا \n ⌯︙  اشترك هنا ['..bot_data:get(ban_id..'add:ch:username')..']')
end
return false
end
if bot_data:get(ban_id..'Lock:Add:Bot'..msg.chat_id_) and not Constructor(msg) then
send(msg.chat_id_, msg.id_,' ⌯︙ تم تعطيل الرفع') 
return false
end
function start_function(extra, result, success)
if result.id_ then
if (result and result.type_ and result.type_.ID == "ChannelChatInfo") then
send(msg.chat_id_,msg.id_," ⌯︙ عذرا عزيزي المستخدم هاذا معرف قناة يرجى استخدام الامر بصوره صحيحه !")   
return false 
end      
bot_data:sadd(ban_id..'Special:User'..msg.chat_id_, result.id_)
usertext = '\n ⌯︙ الـعـضو   ⋖ ['..result.title_..'](t.me/'..(username or 'g_00_l_d')..')'
local  statuss  = '\n ⌯︙ تم ترقيته مميز'
texts = usertext..statuss
else
texts = ' ⌯︙ لا يوجد حساب بهاذا المعرف'
end
send(msg.chat_id_, msg.id_, texts)
end
tdcli_function ({ID = "SearchPublicChat",username_ = username}, start_function, nil)
return false
end

if text and text:match("^رفع مميز (%d+)$") and Mod(msg) then
local userid = text:match("^رفع مميز (%d+)$")
if AddChannel(msg.sender_user_id_) == false then
local textchuser = bot_data:get(ban_id..'text:ch:user')
if textchuser then
send(msg.chat_id_, msg.id_,'['..textchuser..']')
else
send(msg.chat_id_, msg.id_,' ⌯︙ لا تستطيع استخدام البوت \n ⌯︙  يرجى الاشتراك بالقناه اولا \n ⌯︙  اشترك هنا ['..bot_data:get(ban_id..'add:ch:username')..']')
end
return false
end
if bot_data:get(ban_id..'Lock:Add:Bot'..msg.chat_id_) and not Constructor(msg) then
send(msg.chat_id_, msg.id_,' ⌯︙ تم تعطيل الرفع') 
return false
end
bot_data:sadd(ban_id..'Special:User'..msg.chat_id_, userid)
tdcli_function ({ID = "GetUser",user_id_ = userid},function(arg,data) 
if data.first_name_ then
usertext = '\n ⌯︙ الـعـضو   ⋖ ['..data.first_name_..'](t.me/'..(data.username_ or 'g_00_l_d')..')'
local  statuss  = '\n ⌯︙ تم ترقيته مميز'
send(msg.chat_id_, msg.id_, usertext..statuss)
else
usertext = '\n ⌯︙ الـعـضو   ⋖ '..userid..''
local  statuss  = '\n ⌯︙ تم ترقيته مميز'
send(msg.chat_id_, msg.id_, usertext..statuss)
end;end,nil)
return false
end

if (text == ("تنزيل مميز")) and msg.reply_to_message_id_ and Mod(msg) then
if AddChannel(msg.sender_user_id_) == false then
local textchuser = bot_data:get(ban_id..'text:ch:user')
if textchuser then
send(msg.chat_id_, msg.id_,'['..textchuser..']')
else
send(msg.chat_id_, msg.id_,' ⌯︙ لا تستطيع استخدام البوت \n ⌯︙  يرجى الاشتراك بالقناه اولا \n ⌯︙  اشترك هنا ['..bot_data:get(ban_id..'add:ch:username')..']')
end
return false
end
function start_function(extra, result, success)
bot_data:srem(ban_id..'Special:User'..msg.chat_id_, result.sender_user_id_)
tdcli_function ({ID = "GetUser",user_id_ = result.sender_user_id_},function(arg,data) 
usertext = '\n ⌯︙ الـعـضو   ⋖ ['..data.first_name_..'](t.me/'..(data.username_ or 'g_00_l_d')..')'
status  = '\n ⌯︙ تم تنزيله من المميزين'
send(msg.chat_id_, msg.id_, usertext..status)
end,nil)
end
tdcli_function ({ID = "GetMessage",chat_id_ = msg.chat_id_,message_id_ = tonumber(msg.reply_to_message_id_)}, start_function, nil)
return false
end
if text and text:match("^تنزيل مميز @(.*)$") and Mod(msg) then
local username = text:match("^تنزيل مميز @(.*)$") 
if AddChannel(msg.sender_user_id_) == false then
local textchuser = bot_data:get(ban_id..'text:ch:user')
if textchuser then
send(msg.chat_id_, msg.id_,'['..textchuser..']')
else
send(msg.chat_id_, msg.id_,' ⌯︙ لا تستطيع استخدام البوت \n ⌯︙  يرجى الاشتراك بالقناه اولا \n ⌯︙  اشترك هنا ['..bot_data:get(ban_id..'add:ch:username')..']')
end
return false
end
function start_function(extra, result, success)
if result.id_ then
bot_data:srem(ban_id..'Special:User'..msg.chat_id_, result.id_)
usertext = '\n ⌯︙ الـعـضو   ⋖ ['..result.title_..'](t.me/'..(username or 'g_00_l_d')..')'
status  = '\n ⌯︙ تم تنزيله من المميزين'
texts = usertext..status
else
texts = ' ⌯︙ لا يوجد حساب بهاذا المعرف'
end
send(msg.chat_id_, msg.id_, texts)
end
tdcli_function ({ID = "SearchPublicChat",username_ = username}, start_function, nil)
return false
end
if text and text:match("^تنزيل مميز (%d+)$") and Mod(msg) then
local userid = text:match("^تنزيل مميز (%d+)$") 
if AddChannel(msg.sender_user_id_) == false then
local textchuser = bot_data:get(ban_id..'text:ch:user')
if textchuser then
send(msg.chat_id_, msg.id_,'['..textchuser..']')
else
send(msg.chat_id_, msg.id_,' ⌯︙ لا تستطيع استخدام البوت \n ⌯︙  يرجى الاشتراك بالقناه اولا \n ⌯︙  اشترك هنا ['..bot_data:get(ban_id..'add:ch:username')..']')
end
return false
end
bot_data:srem(ban_id..'Special:User'..msg.chat_id_, userid)
tdcli_function ({ID = "GetUser",user_id_ = userid},function(arg,data) 
if data.first_name_ then
usertext = '\n ⌯︙ لعضو  ⋖ ['..data.first_name_..'](t.me/'..(data.username_ or 'g_00_l_d')..')'
status  = '\n ⌯︙ تم تنزيله من المميزين'
send(msg.chat_id_, msg.id_, usertext..status)
else
usertext = '\n ⌯︙ الـعـضو   ⋖ '..userid..''
status  = '\n ⌯︙ تم تنزيله من المميزين'
send(msg.chat_id_, msg.id_, usertext..status)
end;end,nil)
return false
end  
------------------------------------------------------------------------
if text == 'مسح المتوحدين' and Mod(msg) then
bot_data:del(ban_id..'Mote:User'..msg.chat_id_)
send(msg.chat_id_, msg.id_, ' ⌯︙ تم مسح جميع المتوحدين')
end
if text == ("تاك للمتوحدين") and Mod(msg) then
local list = bot_data:smembers(ban_id..'Mote:User'..msg.chat_id_)
t = "\n ⌯︙ قائمة متوحدين الجروب \n⧬━┅┅┄⟞❲[𝗦𝗼𝘂𝗿𝗰𝗲 𝗚𝗼𝗹𝗱](t.me/g_00_l_d)❳⟝┄┉┉━⧬\n"
for k,v in pairs(list) do
local username = bot_data:get(ban_id.."user:Name" .. v)
if username then
t = t..""..k.." ⋖ المتوحد [@"..username.."]\n"
else
t = t..""..k.." ⋖ المتوحد `"..v.."`\n"
end
end
if #list == 0 then
t = " ⌯︙ لا يوجد متوحدين"
end
send(msg.chat_id_, msg.id_, t)
end
---------
if text == ("رفع متوحد") and tonumber(msg.reply_to_message_id_) ~= 0 and Mod(msg) then
if AddChannel(msg.sender_user_id_) == false then
local textchuser = bot_data:get(ban_id..'text:ch:user')
if textchuser then
send(msg.chat_id_, msg.id_,'['..textchuser..']')
else
send(msg.chat_id_, msg.id_,' ⌯︙ لا تستطيع استخدام البوت \n ⌯︙  يرجى الاشتراك بالقناه اولا \n ⌯︙  اشترك هنا ['..bot_data:get(ban_id..'add:ch:username')..']')
end
return false
end
if bot_data:get(ban_id..'Lock:Add:Bot'..msg.chat_id_) and not Constructor(msg) then
send(msg.chat_id_, msg.id_,' ⌯︙ تم تعطيل الرفع') 
return false
end
if text == 'كتم' then
local Text = [[
خليك ساكت بقه زي الخنزير
]]
keyboard = {} 
keyboard.inline_keyboard = {
{{text = '𝗦𝗼𝘂𝗿𝗰𝗲 𝗚𝗼𝗹𝗱', url="t.me/g_00_l_d"}},
}
local msg_id = msg.id_/2097152/0.5
https.request("https://api.telegram.org/bot"..token..'/sendanimation?chat_id=' .. msg.chat_id_ .. '&animation=https://t.me/aslak8/64&caption=' .. URL.escape(Text).."&reply_to_message_id="..msg_id.."&parse_mode=markdown&disable_web_page_preview=true&reply_markup="..JSON.encode(keyboard))
end
if text == 'حظر' then
local Text = [[
برا يا كلاب
]]
keyboard = {} 
keyboard.inline_keyboard = {
{{text = '𝗦𝗼𝘂𝗿𝗰𝗲 𝗚𝗼𝗹𝗱', url="t.me/g_00_l_d"}},
}
local msg_id = msg.id_/2097152/0.5
https.request("https://api.telegram.org/bot"..token..'/sendanimation?chat_id=' .. msg.chat_id_ .. '&animation=https://t.me/aslak8/63&caption=' .. URL.escape(Text).."&reply_to_message_id="..msg_id.."&parse_mode=markdown&disable_web_page_preview=true&reply_markup="..JSON.encode(keyboard))
end
function start_function(extra, result, success)
bot_data:sadd(ban_id..'Mote:User'..msg.chat_id_, result.sender_user_id_)
tdcli_function ({ID = "GetUser",user_id_ = result.sender_user_id_},function(arg,data) 
usertext = '\n ⌯︙ الـعـضو   ⋖ ['..data.first_name_..'](t.me/'..(data.username_ or 'g_00_l_d')..')'
local  statuss  = '\n ⌯︙ تم رفع الـعـضو  متوحد في الجروب \n'
send(msg.chat_id_, msg.id_, usertext..statuss)
end,nil)
end
tdcli_function ({ID = "GetMessage",chat_id_ = msg.chat_id_,message_id_ = tonumber(msg.reply_to_message_id_)}, start_function, nil)
return false
end

if (text == ("تنزيل متوحد")) and msg.reply_to_message_id_ and Mod(msg) then
if AddChannel(msg.sender_user_id_) == false then
local textchuser = bot_data:get(ban_id..'text:ch:user')
if textchuser then
send(msg.chat_id_, msg.id_,'['..textchuser..']')
else
send(msg.chat_id_, msg.id_,' ⌯︙ لا تستطيع استخدام البوت \n ⌯︙  يرجى الاشتراك بالقناه اولا \n ⌯︙  اشترك هنا ['..bot_data:get(ban_id..'add:ch:username')..']')
end
return false
end
function start_function(extra, result, success)
bot_data:srem(ban_id..'Mote:User'..msg.chat_id_, result.sender_user_id_)
tdcli_function ({ID = "GetUser",user_id_ = result.sender_user_id_},function(arg,data) 
usertext = '\n ⌯︙ الـعـضو   ⋖ ['..data.first_name_..'](t.me/'..(data.username_ or 'g_00_l_d')..')'
status  = '\n ⌯︙ تم تنزيل الـعـضو  متوحد في الجروب\n'
send(msg.chat_id_, msg.id_, usertext..status)
end,nil)
end
tdcli_function ({ID = "GetMessage",chat_id_ = msg.chat_id_,message_id_ = tonumber(msg.reply_to_message_id_)}, start_function, nil)
return false
end
-----------------------------------------------------
if text == "زوجتي" or text == "مراتي" and Mod(msg) then
local list = bot_data:smembers(ban_id..'Mode:User'..msg.chat_id_)
t = "\n ⌯︙ قائمه زوجات الجروب \n ⌯︙═───═❲[𝗦𝗼𝘂𝗿𝗰𝗲 𝗚𝗼𝗹𝗱](t.me/g_00_l_d)❳═───═??\n"
for k,v in pairs(list) do
local username = bot_data:get(ban_id.."user:Name" .. v)
if username then
t = t..""..k.." ⋖ الزوجه [@"..username.."]\n"
else
t = t..""..k.." ⋖ الزوجه `"..v.."`\n"
end
end
if #list == 0 then
t = " ⌯︙ مع الاسف لا يوجد زوجه"
end
send(msg.chat_id_, msg.id_, t)
end
---------
if text == ("رفع زوجتي") or text == ("زواج") and tonumber(msg.reply_to_message_id_) ~= 0 and Mod(msg) then
function start_function(extra, result, success)
bot_data:sadd(msg.sender_user_id_..'YYYBD-zoaag1', result.sender_user_id_)
bot_data:sadd(result.sender_user_id_..'YYYBD-zoaag2', msg.sender_user_id_)
tdcli_function ({ID = "GetUser",user_id_ = result.sender_user_id_},function(arg,data) 
tdcli_function ({ID = "GetUser",user_id_ = msg.sender_user_id_},function(arg,ay) 
usertext = '\n ⌯︙ العضــو  ⋖ ['..ay.first_name_..'](tg://user?id='..msg.sender_user_id_..')'
..'\n⌯︙ مع ['..data.first_name_..'](tg://user?id='..result.sender_user_id_..')'
local statuss  = '\n ⌯︙ تم زواجكم بنجاح \n'
send(msg.chat_id_, msg.id_, usertext..statuss)
end,nil)
end,nil)
end
tdcli_function ({ID = "GetMessage",chat_id_ = msg.chat_id_,message_id_ = tonumber(msg.reply_to_message_id_)}, start_function, nil)
return false
end

if text == ("تنزيل زوجتي") or text == ("طلاق") and msg.reply_to_message_id_ and Mod(msg) then
function start_function(extra, result, success)
bot_data:srem(ban_id..'Mode:User'..msg.chat_id_, result.sender_user_id_)
tdcli_function ({ID = "GetUser",user_id_ = result.sender_user_id_},function(arg,data) 
usertext = '\n ⌯︙ العضــو  ⋖ ['..data.first_name_..'](t.me/'..(data.username_ or 'g_00_l_d')..')'
status  = '\n ⌯︙ تم تنزيل العضــو الزوجات من الجروب\n'
send(msg.chat_id_, msg.id_, usertext..status)
end,nil)
end
tdcli_function ({ID = "GetMessage",chat_id_ = msg.chat_id_,message_id_ = tonumber(msg.reply_to_message_id_)}, start_function, nil)
return false
end
-----------------------------------------------------
if text == 'مسح الكلاب' and Mod(msg) then
bot_data:del(ban_id..'Modde:User'..msg.chat_id_)
send(msg.chat_id_, msg.id_, ' ⌯︙ تم مسح جميع الكلاب')
end
if text == ("تاك للكلاب") and Mod(msg) then
local list = bot_data:smembers(ban_id..'Modde:User'..msg.chat_id_)
t = "\n ⌯︙ قائمه كلاب الجروب \n•━═━═━═「ɢᴏʟᴅ」═━═━═━•\n"
for k,v in pairs(list) do
local username = bot_data:get(ban_id.."user:Name" .. v)
if username then
t = t..""..k.." ⋖ الكلب [@"..username.."]\n"
else
t = t..""..k.." ⋖ الكلب `"..v.."`\n"
end
end
if #list == 0 then
t = " ⌯︙ مع الاسف لا يوجد كلاب"
end
send(msg.chat_id_, msg.id_, t)
end
---------
if text == ("رفع كلب") and tonumber(msg.reply_to_message_id_) ~= 0 and Mod(msg) then
if AddChannel(msg.sender_user_id_) == false then
local textchuser = bot_data:get(ban_id..'text:ch:user')
if textchuser then
send(msg.chat_id_, msg.id_,'['..textchuser..']')
else
send(msg.chat_id_, msg.id_,' ⌯︙ لا تستطيع استخدام البوت \n ⌯︙  يرجى الاشتراك بالقناه اولا \n ??  اشترك هنا ['..bot_data:get(ban_id..'add:ch:username')..']')
end
return false
end
if bot_data:get(ban_id..'Lock:Add:Bot'..msg.chat_id_) and not Constructor(msg) then
send(msg.chat_id_, msg.id_,' ⌯︙ تم تعطيل الرفع') 
return false
end
function start_function(extra, result, success)
bot_data:sadd(ban_id..'Modde:User'..msg.chat_id_, result.sender_user_id_)
tdcli_function ({ID = "GetUser",user_id_ = result.sender_user_id_},function(arg,data) 
usertext = '\n ⌯︙ العضــو  ⋖ ['..data.first_name_..'](t.me/'..(data.username_ or 'g_00_l_d')..')'
local  statuss  = '\n ⌯︙ تم رفع العضــو كلب في الجروب \n'
send(msg.chat_id_, msg.id_, usertext..statuss)
end,nil)
end
tdcli_function ({ID = "GetMessage",chat_id_ = msg.chat_id_,message_id_ = tonumber(msg.reply_to_message_id_)}, start_function, nil)
return false
end

if (text == ("تنزيل كلب")) and msg.reply_to_message_id_ and Mod(msg) then
if AddChannel(msg.sender_user_id_) == false then
local textchuser = bot_data:get(ban_id..'text:ch:user')
if textchuser then
send(msg.chat_id_, msg.id_,'['..textchuser..']')
else
send(msg.chat_id_, msg.id_,' ⌯︙ لا تستطيع استخدام البوت \n ⌯︙  يرجى الاشتراك بالقناه اولا \n ⌯︙  اشترك هنا ['..bot_data:get(ban_id..'add:ch:username')..']')
end
return false
end
function start_function(extra, result, success)
bot_data:srem(ban_id..'Modde:User'..msg.chat_id_, result.sender_user_id_)
tdcli_function ({ID = "GetUser",user_id_ = result.sender_user_id_},function(arg,data) 
usertext = '\n ⌯︙ العضــو  ⋖ ['..data.first_name_..'](t.me/'..(data.username_ or 'g_00_l_d')..')'
status  = '\n ⌯︙ تم تنزيل العضــو كلب من الجروب\n'
send(msg.chat_id_, msg.id_, usertext..status)
end,nil)
end
tdcli_function ({ID = "GetMessage",chat_id_ = msg.chat_id_,message_id_ = tonumber(msg.reply_to_message_id_)}, start_function, nil)
return false
end
-----------------------------------------------------
if text == 'ممسح الحمير' and Mod(msg) then
bot_data:del(ban_id..'Sakl:User'..msg.chat_id_)
send(msg.chat_id_, msg.id_, ' ⌯︙ تم تنزيل جميع حمير من الجروب')
end
if text == ("تاك للحمير") and Mod(msg) then
local list = bot_data:smembers(ban_id..'Sakl:User'..msg.chat_id_)
t = "\n ⌯︙ قائمة حمير الجروب \n•━═━═━═「ɢᴏʟᴅ」═━═━═━•\n"
for k,v in pairs(list) do
local username = bot_data:get(ban_id.."user:Name" .. v)
if username then
t = t..""..k.." ⋖ الحمار [@"..username.."]\n"
else
t = t..""..k.." ⋖ الحمار `"..v.."`\n"
end
end
if #list == 0 then
t = " ⌯︙ لا يوجد حمير"
end
send(msg.chat_id_, msg.id_, t)
end
---------
if text == ("رفع حمار") and tonumber(msg.reply_to_message_id_) ~= 0 and Mod(msg) then
if AddChannel(msg.sender_user_id_) == false then
local textchuser = bot_data:get(ban_id..'text:ch:user')
if textchuser then
send(msg.chat_id_, msg.id_,'['..textchuser..']')
else
send(msg.chat_id_, msg.id_,' ⌯︙ لا تستطيع استخدام البوت \n ⌯︙  يرجى الاشتراك بالقناه اولا \n ⌯︙  اشترك هنا ['..bot_data:get(ban_id..'add:ch:username')..']')
end
return false
end
if bot_data:get(ban_id..'Lock:Add:Bot'..msg.chat_id_) and not Constructor(msg) then
send(msg.chat_id_, msg.id_,' ⌯︙ تم تعطيل الرفع') 
return false
end
function start_function(extra, result, success)
bot_data:sadd(ban_id..'Sakl:User'..msg.chat_id_, result.sender_user_id_)
tdcli_function ({ID = "GetUser",user_id_ = result.sender_user_id_},function(arg,data) 
usertext = '\n ⌯︙ الـعـضو   ⋖ ['..data.first_name_..'](t.me/'..(data.username_ or 'g_00_l_d')..')'
local  statuss  = '\n ⌯︙ تم رفع المتهم حمار بالجروب\n ⌯︙ الان اصبح حمار الجروب'
send(msg.chat_id_, msg.id_, usertext..statuss)
end,nil)
end
tdcli_function ({ID = "GetMessage",chat_id_ = msg.chat_id_,message_id_ = tonumber(msg.reply_to_message_id_)}, start_function, nil)
return false
end


if (text == ("تنزيل حمار")) and msg.reply_to_message_id_ and Mod(msg) then
if AddChannel(msg.sender_user_id_) == false then
local textchuser = bot_data:get(ban_id..'text:ch:user')
if textchuser then
send(msg.chat_id_, msg.id_,'['..textchuser..']')
else
send(msg.chat_id_, msg.id_,' ⌯︙ لا تستطيع استخدام البوت \n ⌯︙  يرجى الاشتراك بالقناه اولا \n ⌯︙  اشترك هنا ['..bot_data:get(ban_id..'add:ch:username')..']')
end
return false
end
function start_function(extra, result, success)
bot_data:srem(ban_id..'Sakl:User'..msg.chat_id_, result.sender_user_id_)
tdcli_function ({ID = "GetUser",user_id_ = result.sender_user_id_},function(arg,data) 
usertext = '\n ?? الـعـضو   ⋖ ['..data.first_name_..'](t.me/'..(data.username_ or 'g_00_l_d')..')'
status  = '\n ⌯︙ تم تنزيل الـعـضو  حمار\n'
send(msg.chat_id_, msg.id_, usertext..status)
end,nil)
end
tdcli_function ({ID = "GetMessage",chat_id_ = msg.chat_id_,message_id_ = tonumber(msg.reply_to_message_id_)}, start_function, nil)
return false
end
if text == 'غنيلي' or text == 'استوري' or text == 'لو خيروك بالصوره' or text == 'تويت بالصوره' or text == 'ثيم' then
if not Mod(msg) then
send(msg.chat_id_, msg.id_,' هذا الامر لا يخصك')
return false
end
local Text =[[
تم تغير الكلمه الي جولد اكتب جولد وسوف يظهر لك بعض زراير اختار ماتريده 
the source ɢᴏʟᴅ the best source on tele
]]
keyboard = {} 
keyboard.inline_keyboard = {
{
{text = 'ɢᴏʟᴅ', callback_data="t.me/g_00_l_d"},
},
}
local msg_id = msg.id_/2097152/0.5
https.request("https://api.telegram.org/bot"..token..'/sendMessage?chat_id=' .. msg.chat_id_ .. '&text=' .. URL.escape(Text).."&reply_to_message_id="..msg_id.."&parse_mode=markdown&disable_web_page_preview=true&reply_markup="..JSON.encode(keyboard))
return false
end 

if text == 'جولد' then
if not Mod(msg) then
send(msg.chat_id_, msg.id_,' هذا الامر لا يخصك')
return false
end
local Text =[[
لاي شي تريده	 اضغط ع زر 
]]
keyboard = {} 
keyboard.inline_keyboard = {
{
{text = 'غنيلي', callback_data="/allstate"},{text = 'استوري', callback_data="/lklpo"},
},
{
{text = 'ثيم', callback_data="/chair"},
},
{
{text = 'تويت بالصوره', callback_data="/ljljkj"},{text = 'لو خيروك بالصوره', callback_data="/asr4"},
},
{
{text = 'كتبات اخري', callback_data="/lp8qy"},
},
}
local msg_id = msg.id_/2097152/0.5
https.request("https://api.telegram.org/bot"..token..'/sendMessage?chat_id=' .. msg.chat_id_ .. '&text=' .. URL.escape(Text).."&reply_to_message_id="..msg_id.."&parse_mode=markdown&disable_web_page_preview=true&reply_markup="..JSON.encode(keyboard))
return false
end
-----------------------------------------------------
if text == 'مسح الوتكات' and Mod(msg) then
bot_data:del(ban_id..'Motte:User'..msg.chat_id_)
send(msg.chat_id_, msg.id_, ' ⌯︙ تم تنزيل جميع وتكات الجروب')
end
if text == ("تاك للوتكات") and Mod(msg) then
local list = bot_data:smembers(ban_id..'Motte:User'..msg.chat_id_)
t = "\n ⌯︙ قائمة وتكات الجروب \n•━═━═━═「ɢᴏʟᴅ」═━═━═━•\n"
for k,v in pairs(list) do
local username = bot_data:get(ban_id.."user:Name" .. v)
if username then
t = t..""..k.." ⋖ الوتكه [@"..username.."]\n"
else
t = t..""..k.." ⋖ الوتكه `"..v.."`\n"
end
end
if #list == 0 then
t = " ⌯︙ لا يوجد وتكات"
end
send(msg.chat_id_, msg.id_, t)
end
---------
if text == ("رفع وتكه") and tonumber(msg.reply_to_message_id_) ~= 0 and Mod(msg) then
if AddChannel(msg.sender_user_id_) == false then
local textchuser = bot_data:get(ban_id..'text:ch:user')
if textchuser then
send(msg.chat_id_, msg.id_,'['..textchuser..']')
else
send(msg.chat_id_, msg.id_,' ⌯︙ لا تستطيع استخدام البوت \n ⌯︙  يرجى الاشتراك بالقناه اولا \n ⌯︙  اشترك هنا ['..bot_data:get(ban_id..'add:ch:username')..']')
end
return false
end
if bot_data:get(ban_id..'Lock:Add:Bot'..msg.chat_id_) and not Constructor(msg) then
send(msg.chat_id_, msg.id_,' ⌯︙ تم تعطيل الرفع') 
return false
end
function start_function(extra, result, success)
bot_data:sadd(ban_id..'Motte:User'..msg.chat_id_, result.sender_user_id_)
tdcli_function ({ID = "GetUser",user_id_ = result.sender_user_id_},function(arg,data) 
usertext = '\n ⌯︙ الـعـضو   ⋖ ['..data.first_name_..'](t.me/'..(data.username_ or 'g_00_l_d')..')'
local  statuss  = '\n ⌯︙ تم رفع وتكه في الجروب\n'
send(msg.chat_id_, msg.id_, usertext..statuss)
end,nil)
end
tdcli_function ({ID = "GetMessage",chat_id_ = msg.chat_id_,message_id_ = tonumber(msg.reply_to_message_id_)}, start_function, nil)
return false
end

if (text == ("تنزيل وتكه")) and msg.reply_to_message_id_ and Mod(msg) then
if AddChannel(msg.sender_user_id_) == false then
local textchuser = bot_data:get(ban_id..'text:ch:user')
if textchuser then
send(msg.chat_id_, msg.id_,'['..textchuser..']')
else
send(msg.chat_id_, msg.id_,' ⌯︙ لا تستطيع استخدام البوت \n ⌯︙  يرجى الاشتراك بالقناه اولا \n ⌯︙  اشترك هنا ['..bot_data:get(ban_id..'add:ch:username')..']')
end
return false
end
function start_function(extra, result, success)
bot_data:srem(ban_id..'Motte:User'..msg.chat_id_, result.sender_user_id_)
tdcli_function ({ID = "GetUser",user_id_ = result.sender_user_id_},function(arg,data) 
usertext = '\n ⌯︙ الـعـضو   ⋖ ['..data.first_name_..'](t.me/'..(data.username_ or 'g_00_l_d')..')'
status  = '\n ⌯︙ تم تنزيل وتكه في الجروب\n'
send(msg.chat_id_, msg.id_, usertext..status)
end,nil)
end
tdcli_function ({ID = "GetMessage",chat_id_ = msg.chat_id_,message_id_ = tonumber(msg.reply_to_message_id_)}, start_function, nil)
return false
end
-----------------------------------------------------
if text == 'مسح القرده' and Mod(msg) then
bot_data:del(ban_id..'Motee:User'..msg.chat_id_)
send(msg.chat_id_, msg.id_, ' ⌯︙ تم تنزيل جميع القرده بالجروب')
end
if text == ("تاك للقرود") and Mod(msg) then
local list = bot_data:smembers(ban_id..'Motee:User'..msg.chat_id_)
t = "\n ⌯︙ قائمة القرود الجروب \n•━═━═━═「ɢᴏʟᴅ」═━═━═━•\n"
for k,v in pairs(list) do
local username = bot_data:get(ban_id.."user:Name" .. v)
if username then
t = t..""..k.." ⋖ القرد [@"..username.."]\n"
else
t = t..""..k.." ⋖ القرد `"..v.."`\n"
end
end
if #list == 0 then
t = " ⌯︙ لا يوجد قرد"
end
send(msg.chat_id_, msg.id_, t)
end
---------
if text == ("رفع قرد") and tonumber(msg.reply_to_message_id_) ~= 0 and Mod(msg) then
if AddChannel(msg.sender_user_id_) == false then
local textchuser = bot_data:get(ban_id..'text:ch:user')
if textchuser then
send(msg.chat_id_, msg.id_,'['..textchuser..']')
else
send(msg.chat_id_, msg.id_,' ⌯︙ لا تستطيع استخدام البوت \n ⌯︙  يرجى الاشتراك بالقناه اولا \n ⌯︙  اشترك هنا ['..bot_data:get(ban_id..'add:ch:username')..']')
end
return false
end
if bot_data:get(ban_id..'Lock:Add:Bot'..msg.chat_id_) and not Constructor(msg) then
send(msg.chat_id_, msg.id_,' ⌯︙ تم تعطيل الرفع') 
return false
end
function start_function(extra, result, success)
bot_data:sadd(ban_id..'Motee:User'..msg.chat_id_, result.sender_user_id_)
tdcli_function ({ID = "GetUser",user_id_ = result.sender_user_id_},function(arg,data) 
usertext = '\n ⌯︙ الـعـضو   ⋖ ['..data.first_name_..'](t.me/'..(data.username_ or 'g_00_l_d')..')'
local  statuss  = '\n ⌯︙ تم رفع قرد في الجروب\n ⌯︙ تعال حبي استلم موزه'
send(msg.chat_id_, msg.id_, usertext..statuss)
end,nil)
end
tdcli_function ({ID = "GetMessage",chat_id_ = msg.chat_id_,message_id_ = tonumber(msg.reply_to_message_id_)}, start_function, nil)
return false
end

if (text == ("تنزيل قرد")) and msg.reply_to_message_id_ and Mod(msg) then
if AddChannel(msg.sender_user_id_) == false then
local textchuser = bot_data:get(ban_id..'text:ch:user')
if textchuser then
send(msg.chat_id_, msg.id_,'['..textchuser..']')
else
send(msg.chat_id_, msg.id_,' ⌯︙ لا تستطيع استخدام البوت \n ⌯︙  يرجى الاشتراك بالقناه اولا \n ⌯︙  اشترك هنا ['..bot_data:get(ban_id..'add:ch:username')..']')
end
return false
end
function start_function(extra, result, success)
bot_data:srem(ban_id..'Motee:User'..msg.chat_id_, result.sender_user_id_)
tdcli_function ({ID = "GetUser",user_id_ = result.sender_user_id_},function(arg,data) 
usertext = '\n ⌯︙ الـعـضو   ⋖ ['..data.first_name_..'](t.me/'..(data.username_ or 'g_00_l_d')..')'
status  = '\n ⌯︙ تم تنزيل قرد من الجروب\n ⌯︙ رجع موزه حبي'
send(msg.chat_id_, msg.id_, usertext..status)
end,nil)
end
tdcli_function ({ID = "GetMessage",chat_id_ = msg.chat_id_,message_id_ = tonumber(msg.reply_to_message_id_)}, start_function, nil)
return false
end
-----------------------------------------------------
if text == 'مسح الارامل' and Mod(msg) then
bot_data:del(ban_id..'Bro:User'..msg.chat_id_)
send(msg.chat_id_, msg.id_, ' ⌯︙ تم تنزيل جميع الارامل بالجروب')
end
if text == ("تاك للارامل") and Mod(msg) then
local list = bot_data:smembers(ban_id..'Bro:User'..msg.chat_id_)
t = "\n ⌯︙ قائمة ارامل الجروب \n•━═━═━═「ɢᴏʟᴅ」═━═━═━•\n"
for k,v in pairs(list) do
local username = bot_data:get(ban_id.."user:Name" .. v)
if username then
t = t..""..k.." ⋖ الارمله [@"..username.."]\n"
else
t = t..""..k.." ⋖ الارمله `"..v.."`\n"
end
end
if #list == 0 then
t = " ⌯︙ لا يوجد ارامل"
end
send(msg.chat_id_, msg.id_, t)
end
---------
if text == ("رفع ارمله") and tonumber(msg.reply_to_message_id_) ~= 0 and Mod(msg) then
if AddChannel(msg.sender_user_id_) == false then
local textchuser = bot_data:get(ban_id..'text:ch:user')
if textchuser then
send(msg.chat_id_, msg.id_,'['..textchuser..']')
else
send(msg.chat_id_, msg.id_,' ⌯︙ لا تستطيع استخدام البوت \n ⌯︙  يرجى الاشتراك بالقناه اولا \n ⌯︙  اشترك هنا ['..bot_data:get(ban_id..'add:ch:username')..']')
end
return false
end
if bot_data:get(ban_id..'Lock:Add:Bot'..msg.chat_id_) and not Constructor(msg) then
send(msg.chat_id_, msg.id_,' ⌯︙ تم تعطيل الرفع') 
return false
end
function start_function(extra, result, success)
bot_data:sadd(ban_id..'Bro:User'..msg.chat_id_, result.sender_user_id_)
tdcli_function ({ID = "GetUser",user_id_ = result.sender_user_id_},function(arg,data) 
usertext = '\n ⌯︙ الـعـضو   ⋖ ['..data.first_name_..'](t.me/'..(data.username_ or 'g_00_l_d')..')'
local  statuss  = '\n ⌯︙ تم رفع ارمله في الجروب\n'
send(msg.chat_id_, msg.id_, usertext..statuss)
end,nil)
end
tdcli_function ({ID = "GetMessage",chat_id_ = msg.chat_id_,message_id_ = tonumber(msg.reply_to_message_id_)}, start_function, nil)
return false
end

if (text == ("تنزيل ارمله")) and msg.reply_to_message_id_ and Mod(msg) then
if AddChannel(msg.sender_user_id_) == false then
local textchuser = bot_data:get(ban_id..'text:ch:user')
if textchuser then
send(msg.chat_id_, msg.id_,'['..textchuser..']')
else
send(msg.chat_id_, msg.id_,' ⌯︙ لا تستطيع استخدام البوت \n ⌯︙  يرجى الاشتراك بالقناه اولا \n ⌯︙  اشترك هنا ['..bot_data:get(ban_id..'add:ch:username')..']')
end
return false
end
function start_function(extra, result, success)
bot_data:srem(ban_id..'Bro:User'..msg.chat_id_, result.sender_user_id_)
tdcli_function ({ID = "GetUser",user_id_ = result.sender_user_id_},function(arg,data) 
usertext = '\n ⌯︙ الـعـضو   ⋖ ['..data.first_name_..'](t.me/'..(data.username_ or 'g_00_l_d')..')'
status  = '\n ⌯︙ تم تنزيل ارمله من الجروب\n'
send(msg.chat_id_, msg.id_, usertext..status)
end,nil)
end
tdcli_function ({ID = "GetMessage",chat_id_ = msg.chat_id_,message_id_ = tonumber(msg.reply_to_message_id_)}, start_function, nil)
return false
end
-----------------------------------------------------
if text == 'مسح الخولات' and Mod(msg) then
bot_data:del(ban_id..'Girl:User'..msg.chat_id_)
send(msg.chat_id_, msg.id_, ' ⌯︙ تم تنزيل جميع الخولات بالجروب')
end
if text == ("تاك للخولات") and Mod(msg) then
local list = bot_data:smembers(ban_id..'Girl:User'..msg.chat_id_)
t = "\n ⌯︙ قائمة خولات الجروب \n•━═━═━═「ɢᴏʟᴅ」═━═━═━•\n"
for k,v in pairs(list) do
local username = bot_data:get(ban_id.."user:Name" .. v)
if username then
t = t..""..k.." ⋖ الخول [@"..username.."]\n"
else
t = t..""..k.." ⋖ الخول `"..v.."`\n"
end
end
if #list == 0 then
t = " ⌯︙ لا يوجد خولات"
end
send(msg.chat_id_, msg.id_, t)
end
---------
if text == ("رفع خول") and tonumber(msg.reply_to_message_id_) ~= 0 and Mod(msg) then
if AddChannel(msg.sender_user_id_) == false then
local textchuser = bot_data:get(ban_id..'text:ch:user')
if textchuser then
send(msg.chat_id_, msg.id_,'['..textchuser..']')
else
send(msg.chat_id_, msg.id_,' ⌯︙ لا تستطيع استخدام البوت \n ⌯︙  يرجى الاشتراك بالقناه اولا \n ⌯︙  اشترك هنا ['..bot_data:get(ban_id..'add:ch:username')..']')
end
return false
end
if bot_data:get(ban_id..'Lock:Add:Bot'..msg.chat_id_) and not Constructor(msg) then
send(msg.chat_id_, msg.id_,' ⌯︙ تم تعطيل الرفع') 
return false
end
function start_function(extra, result, success)
bot_data:sadd(ban_id..'Girl:User'..msg.chat_id_, result.sender_user_id_)
tdcli_function ({ID = "GetUser",user_id_ = result.sender_user_id_},function(arg,data) 
usertext = '\n ⌯︙ الـعـضو   ⋖ ['..data.first_name_..'](t.me/'..(data.username_ or 'g_00_l_d')..')'
local  statuss  = '\n ⌯︙ تم رفع خول في الجروب\n'
send(msg.chat_id_, msg.id_, usertext..statuss)
end,nil)
end
tdcli_function ({ID = "GetMessage",chat_id_ = msg.chat_id_,message_id_ = tonumber(msg.reply_to_message_id_)}, start_function, nil)
return false
end

if (text == ("تنزيل خول")) and msg.reply_to_message_id_ and Mod(msg) then
if AddChannel(msg.sender_user_id_) == false then
local textchuser = bot_data:get(ban_id..'text:ch:user')
if textchuser then
send(msg.chat_id_, msg.id_,'['..textchuser..']')
else
send(msg.chat_id_, msg.id_,' ⌯︙ لا تستطيع استخدام البوت \n ⌯︙  يرجى الاشتراك بالقناه اولا \n ⌯︙  اشترك هنا ['..bot_data:get(ban_id..'add:ch:username')..']')
end
return false
end
function start_function(extra, result, success)
bot_data:srem(ban_id..'Girl:User'..msg.chat_id_, result.sender_user_id_)
tdcli_function ({ID = "GetUser",user_id_ = result.sender_user_id_},function(arg,data) 
usertext = '\n ⌯︙ الـعـضو   ⋖ ['..data.first_name_..'](t.me/'..(data.username_ or 'textchuser')..')'
status  = '\n ⌯︙ تم تنزيل خول من الجروب\n'
send(msg.chat_id_, msg.id_, usertext..status)
end,nil)
end
tdcli_function ({ID = "GetMessage",chat_id_ = msg.chat_id_,message_id_ = tonumber(msg.reply_to_message_id_)}, start_function, nil)
return false
end
-----------------------------------------------------
if text == 'مسح البقرات' and Mod(msg) then
bot_data:del(ban_id..'Bakra:User'..msg.chat_id_)
send(msg.chat_id_, msg.id_, ' ⌯︙ تم تنزيل جميع البقرات بالجروب')
end
if text == ("تاك للبقرات") and Mod(msg) then
local list = bot_data:smembers(ban_id..'Bakra:User'..msg.chat_id_)
t = "\n ⌯︙ قائمة البقرات الجروب \n•━═━═━═「ɢᴏʟᴅ」═━═━═━•\n"
for k,v in pairs(list) do
local username = bot_data:get(ban_id.."user:Name" .. v)
if username then
t = t..""..k.." ⋖ البقره [@"..username.."]\n"
else
t = t..""..k.." ⋖ البقره "..v.."\n"
end
end
if #list == 0 then
t = " ⌯︙ لا يوجد البقره"
end
send(msg.chat_id_, msg.id_, t)
end
---------
if text == ("رفع بقره") and tonumber(msg.reply_to_message_id_) ~= 0 and Mod(msg) then
if AddChannel(msg.sender_user_id_) == false then
local textchuser = bot_data:get(ban_id..'text:ch:user')
if textchuser then
send(msg.chat_id_, msg.id_,'['..textchuser..']')
else
send(msg.chat_id_, msg.id_,' ⌯︙ لا تستطيع استخدام البوت \n ⌯︙  يرجى الاشتراك بالقناه اولا \n ⌯︙  اشترك هنا ['..bot_data:get(ban_id..'add:ch:username')..']')
end
return false
end
if bot_data:get(ban_id..'Lock:Add:Bot'..msg.chat_id_) and not Constructor(msg) then
send(msg.chat_id_, msg.id_,' ⌯︙ تم تعطيل الرفع') 
return false
end
function start_function(extra, result, success)
bot_data:sadd(ban_id..'Bakra:User'..msg.chat_id_, result.sender_user_id_)
tdcli_function ({ID = "GetUser",user_id_ = result.sender_user_id_},function(arg,data) 
usertext = '\n ⌯︙ الـعـضو   ⋖ ['..data.first_name_..'](t.me/'..(data.username_ or 'g_00_l_d')..')'
local  statuss  = '\n ⌯︙ تم رفع بقره في الجروب\n ⌯︙ ها يالهايشه تع احلبك'
send(msg.chat_id_, msg.id_, usertext..statuss)
end,nil)
end
tdcli_function ({ID = "GetMessage",chat_id_ = msg.chat_id_,message_id_ = tonumber(msg.reply_to_message_id_)}, start_function, nil)
return false
end

if (text == ("تنزيل بقره")) and msg.reply_to_message_id_ and Mod(msg) then
if AddChannel(msg.sender_user_id_) == false then
local textchuser = bot_data:get(ban_id..'text:ch:user')
if textchuser then
send(msg.chat_id_, msg.id_,'['..textchuser..']')
else
send(msg.chat_id_, msg.id_,' ⌯︙ لا تستطيع استخدام البوت \n??  يرجى الاشتراك بالقناه اولا \n ⌯︙  اشترك هنا ['..bot_data:get(ban_id..'add:ch:username')..']')
end
return false
end
function start_function(extra, result, success)
bot_data:srem(ban_id..'Bakra:User'..msg.chat_id_, result.sender_user_id_)
tdcli_function ({ID = "GetUser",user_id_ = result.sender_user_id_},function(arg,data) 
usertext = '\n ⌯︙ الـعـضو   ⋖ ['..data.first_name_..'](t.me/'..(data.username_ or 'g_00_l_d')..')'
status  = '\n ⌯︙ تم تنزيل بقره من الجروب\n ⌯︙ تعال هاك حليب مالتك'
send(msg.chat_id_, msg.id_, usertext..status)
end,nil)
end
tdcli_function ({ID = "GetMessage",chat_id_ = msg.chat_id_,message_id_ = tonumber(msg.reply_to_message_id_)}, start_function, nil)
return false
end
-----------------------------------------------------
if text == 'مسح المزز' and Mod(msg) then
bot_data:del(ban_id..'Tele:User'..msg.chat_id_)
send(msg.chat_id_, msg.id_, ' ⌯︙ تم تنزيل جميع المزز بالجروب')
end
if text == ("تاك للمزز") and Mod(msg) then
local list = bot_data:smembers(ban_id..'Tele:User'..msg.chat_id_)
t = "\n ⌯︙ قائمة مزز الجروب \n•━═━═━═「ɢᴏʟᴅ」═━═━═━•\n"
for k,v in pairs(list) do
local username = bot_data:get(ban_id.."user:Name" .. v)
if username then
t = t..""..k.." ⋖ االمزه@"..username.."]\n"
else
t = t..""..k.." ⋖ المزه "..v.."\n"
end
end
if #list == 0 then
t = " ⌯︙ لا يوجد مزز"
end
send(msg.chat_id_, msg.id_, t)
end
---------
if text == ("رفع مزه") and tonumber(msg.reply_to_message_id_) ~= 0 and Mod(msg) then
if AddChannel(msg.sender_user_id_) == false then
local textchuser = bot_data:get(ban_id..'text:ch:user')
if textchuser then
send(msg.chat_id_, msg.id_,'['..textchuser..']')
else
send(msg.chat_id_, msg.id_,' ⌯︙ لا تستطيع استخدام البوت \n ⌯︙  يرجى الاشتراك بالقناه اولا \n ⌯︙  اشترك هنا ['..bot_data:get(ban_id..'add:ch:username')..']')
end
return false
end
if bot_data:get(ban_id..'Lock:Add:Bot'..msg.chat_id_) and not Constructor(msg) then
send(msg.chat_id_, msg.id_,' ⌯︙ تم تعطيل الرفع') 
return false
end
function start_function(extra, result, success)
bot_data:sadd(ban_id..'Tele:User'..msg.chat_id_, result.sender_user_id_)
tdcli_function ({ID = "GetUser",user_id_ = result.sender_user_id_},function(arg,data) 
usertext = '\n ⌯︙ الـعـضو   ⋖ ['..data.first_name_..'](t.me/'..(data.username_ or 'g_00_l_d')..')'
local  statuss  = '\n ⌯︙ تم رفع مزه في الجروب\n'
send(msg.chat_id_, msg.id_, usertext..statuss)
end,nil)
end
tdcli_function ({ID = "GetMessage",chat_id_ = msg.chat_id_,message_id_ = tonumber(msg.reply_to_message_id_)}, start_function, nil)
return false
end

if (text == ("تنزيل مزه")) and msg.reply_to_message_id_ and Mod(msg) then
if AddChannel(msg.sender_user_id_) == false then
local textchuser = bot_data:get(ban_id..'text:ch:user')
if textchuser then
send(msg.chat_id_, msg.id_,'['..textchuser..']')
else
send(msg.chat_id_, msg.id_,' ⌯︙ لا تستطيع استخدام البوت \n ⌯︙  يرجى الاشتراك بالقناه اولا \n ⌯︙  اشترك هنا ['..bot_data:get(ban_id..'add:ch:username')..']')
end
return false
end
function start_function(extra, result, success)
bot_data:srem(ban_id..'Tele:User'..msg.chat_id_, result.sender_user_id_)
tdcli_function ({ID = "GetUser",user_id_ = result.sender_user_id_},function(arg,data) 
usertext = '\n ⌯︙ الـعـضو   ⋖ ['..data.first_name_..'](t.me/'..(data.username_ or 'g_00_l_d')..')'
status  = '\n ⌯︙ تم تنزيل مزه من الجروب\n'
send(msg.chat_id_, msg.id_, usertext..status)
end,nil)
end
tdcli_function ({ID = "GetMessage",chat_id_ = msg.chat_id_,message_id_ = tonumber(msg.reply_to_message_id_)}, start_function, nil)
return false
end
-----------------------------------------------------
if text == 'مسح الاكساس' and Mod(msg) then
bot_data:del(ban_id..'Zahf:User'..msg.chat_id_)
send(msg.chat_id_, msg.id_, ' ⌯︙ تم تنزيل جميع االاكساس')
end
if text == ("تاك للاكساس") and Mod(msg) then
local list = bot_data:smembers(ban_id..'Zahf:User'..msg.chat_id_)
t = "\n ⌯︙ قائمة كساس الجروب \n•━═━═━═「ɢᴏʟᴅ」═━═━═━•\n"
for k,v in pairs(list) do
local username = bot_data:get(ban_id.."user:Name" .. v)
if username then
t = t..""..k.." ⋖ االكس[@"..username.."]\n"
else
t = t..""..k.." ⋖ الكس "..v.."\n"
end
end
if #list == 0 then
t = " ⌯︙ لا يوجد كس"
end
send(msg.chat_id_, msg.id_, t)
end
---------
if text == ("رفع كس") and tonumber(msg.reply_to_message_id_) ~= 0 and Mod(msg) then
if AddChannel(msg.sender_user_id_) == false then
local textchuser = bot_data:get(ban_id..'text:ch:user')
if textchuser then
send(msg.chat_id_, msg.id_,'['..textchuser..']')
else
send(msg.chat_id_, msg.id_,' ⌯︙ لا تستطيع استخدام البوت \n ⌯︙  يرجى الاشتراك بالقناه اولا \n ⌯︙  اشترك هنا ['..bot_data:get(ban_id..'add:ch:username')..']')
end
return false
end
if bot_data:get(ban_id..'Lock:Add:Bot'..msg.chat_id_) and not Constructor(msg) then
send(msg.chat_id_, msg.id_,' ⌯︙ تم تعطيل الرفع') 
return false
end
function start_function(extra, result, success)
bot_data:sadd(ban_id..'Zahf:User'..msg.chat_id_, result.sender_user_id_)
tdcli_function ({ID = "GetUser",user_id_ = result.sender_user_id_},function(arg,data) 
usertext = '\n ⌯︙ الـعـضو   ⋖ ['..data.first_name_..'](t.me/'..(data.username_ or 'g_00_l_d')..')'
local  statuss  = '\n ⌯︙ تم رفع كس في الجروب\n'
send(msg.chat_id_, msg.id_, usertext..statuss)
end,nil)
end
tdcli_function ({ID = "GetMessage",chat_id_ = msg.chat_id_,message_id_ = tonumber(msg.reply_to_message_id_)}, start_function, nil)
return false
end

if (text == ("تنزيل كس")) and msg.reply_to_message_id_ and Mod(msg) then
if AddChannel(msg.sender_user_id_) == false then
local textchuser = bot_data:get(ban_id..'text:ch:user')
if textchuser then
send(msg.chat_id_, msg.id_,'['..textchuser..']')
else
send(msg.chat_id_, msg.id_,' ⌯︙ لا تستطيع استخدام البوت \n ⌯︙  يرجى الاشتراك بالقناه اولا \n ⌯︙  اشترك هنا ['..bot_data:get(ban_id..'add:ch:username')..']')
end
return false
end
function start_function(extra, result, success)
bot_data:srem(ban_id..'Zahf:User'..msg.chat_id_, result.sender_user_id_)
tdcli_function ({ID = "GetUser",user_id_ = result.sender_user_id_},function(arg,data) 
usertext = '\n ⌯︙ الـعـضو   ⋖ ['..data.first_name_..'](t.me/'..(data.username_ or 'g_00_l_d')..')'
status  = '\n ⌯︙ تم تنزيل كس من الجروب\n'
send(msg.chat_id_, msg.id_, usertext..status)
end,nil)
end
tdcli_function ({ID = "GetMessage",chat_id_ = msg.chat_id_,message_id_ = tonumber(msg.reply_to_message_id_)}, start_function, nil)
return false
end
if text == 'مسح قلبي' and Mod(msg) then
bot_data:del(ban_id..'Zahf:User'..msg.chat_id_)
send(msg.chat_id_, msg.id_, ' ⌯︙ تم تنزيل جميع القلوب ')
end
if text == ("تاك لقلبي") and Mod(msg) then
local list = bot_data:smembers(ban_id..'Zahf:User'..msg.chat_id_)
t = "\n ⌯︙ قائمة القلوب في الجروب\n•━═━═━═「ɢᴏʟᴅ」═━═━═━•\n"
for k,v in pairs(list) do
local username = bot_data:get(ban_id.."user:Name" .. v)
if username then
t = t..""..k.."⋖ قلبي [@"..username.."]\n"
else
t = t..""..k.."⋖ قلبي "..v.."\n"
end
end
if #list == 0 then
t = " ⌯︙ لا يوجد قلوب"
end
send(msg.chat_id_, msg.id_, t)
end
---------
if text == ("رفع قلبي") and tonumber(msg.reply_to_message_id_) ~= 0 and Mod(msg) then
if AddChannel(msg.sender_user_id_) == false then
local textchuser = bot_data:get(ban_id..'text:ch:user')
if textchuser then
send(msg.chat_id_, msg.id_,'['..textchuser..']')
else
send(msg.chat_id_, msg.id_,' ⌯︙ لا تستطيع استخدام البوت \n ⌯︙  يرجى الاشتراك بالقناه اولا \n ⌯︙  اشترك هنا ['..bot_data:get(ban_id..'add:ch:username')..']')
end
return false
end
if bot_data:get(ban_id..'Lock:Add:Bot'..msg.chat_id_) and not Constructor(msg) then
send(msg.chat_id_, msg.id_,' ⌯︙ تم تعطيل الرفع') 
return false
end
function start_function(extra, result, success)
bot_data:sadd(ban_id..'Zahf:User'..msg.chat_id_, result.sender_user_id_)
tdcli_function ({ID = "GetUser",user_id_ = result.sender_user_id_},function(arg,data) 
usertext = '\n ⌯︙ الـعـضو  ⋖ ['..data.first_name_..'](t.me/'..(data.username_ or 'g_00_l_d')..')'
local  statuss  = '\n ⌯︙ تم رفع قلبي في الجروب\n'
send(msg.chat_id_, msg.id_, usertext..statuss)
end,nil)
end
tdcli_function ({ID = "GetMessage",chat_id_ = msg.chat_id_,message_id_ = tonumber(msg.reply_to_message_id_)}, start_function, nil)
return false
end

if (text == ("تنزيل قلبي")) and msg.reply_to_message_id_ and Mod(msg) then
if AddChannel(msg.sender_user_id_) == false then
local textchuser = bot_data:get(ban_id..'text:ch:user')
if textchuser then
send(msg.chat_id_, msg.id_,'['..textchuser..']')
else
send(msg.chat_id_, msg.id_,' ⌯︙ لا تستطيع استخدام البوت \n ⌯︙  يرجى الاشتراك بالقناه اولا \n ⌯︙  اشترك هنا ['..bot_data:get(ban_id..'add:ch:username')..']')
end
return false
end
function start_function(extra, result, success)
bot_data:srem(ban_id..'Zahf:User'..msg.chat_id_, result.sender_user_id_)
tdcli_function ({ID = "GetUser",user_id_ = result.sender_user_id_},function(arg,data) 
usertext = '\n ⌯︙ الـعـضو  ⋖ ['..data.first_name_..'](t.me/'..(data.username_ or 'g_00_l_d')..')'
status  = '\n ⌯︙ تم تنزيل قلبي من الجروب\n'
send(msg.chat_id_, msg.id_, usertext..status)
end,nil)
end
tdcli_function ({ID = "GetMessage",chat_id_ = msg.chat_id_,message_id_ = tonumber(msg.reply_to_message_id_)}, start_function, nil)
return false
end
-----------------------------------------------------
if text == 'مسح ابني' and Mod(msg) then
bot_data:del(ban_id..'Zahf:User'..msg.chat_id_)
send(msg.chat_id_, msg.id_, ' ⌯︙ تم تنزيل جميع أولادي')
end
if text == ("تاك لولادي") and Mod(msg) then
local list = bot_data:smembers(ban_id..'Zahf:User'..msg.chat_id_)
t = "\n ⌯︙ قائمة كساس الجروب \n•━═━═━═「ɢᴏʟᴅ」═━═━═━•\n"
for k,v in pairs(list) do
local username = bot_data:get(ban_id.."user:Name" .. v)
if username then
t = t..""..k.."⋖ ابني [@"..username.."]\n"
else
t = t..""..k.."⋖ ابني "..v.."\n"
end
end
if #list == 0 then
t = " ⌯︙ لا يوجد ابني"
end
send(msg.chat_id_, msg.id_, t)
end
---------
if text == ("رفع ابني") and tonumber(msg.reply_to_message_id_) ~= 0 and Mod(msg) then
if AddChannel(msg.sender_user_id_) == false then
local textchuser = bot_data:get(ban_id..'text:ch:user')
if textchuser then
send(msg.chat_id_, msg.id_,'['..textchuser..']')
else
send(msg.chat_id_, msg.id_,' ⌯︙ لا تستطيع استخدام البوت \n ⌯︙  يرجى الاشتراك بالقناه اولا \n ⌯︙  اشترك هنا ['..bot_data:get(ban_id..'add:ch:username')..']')
end
return false
end
if bot_data:get(ban_id..'Lock:Add:Bot'..msg.chat_id_) and not Constructor(msg) then
send(msg.chat_id_, msg.id_,' ⌯︙ تم تعطيل الرفع') 
return false
end
function start_function(extra, result, success)
bot_data:sadd(ban_id..'Zahf:User'..msg.chat_id_, result.sender_user_id_)
tdcli_function ({ID = "GetUser",user_id_ = result.sender_user_id_},function(arg,data) 
usertext = '\n ⌯︙ الـعـضو  ⋖ ['..data.first_name_..'](t.me/'..(data.username_ or 'g_00_l_d')..')'
local  statuss  = '\n ⌯︙ تم رفع ابني في الجروب\n'
send(msg.chat_id_, msg.id_, usertext..statuss)
end,nil)
end
tdcli_function ({ID = "GetMessage",chat_id_ = msg.chat_id_,message_id_ = tonumber(msg.reply_to_message_id_)}, start_function, nil)
return false
end

if (text == ("تنزيل ابني")) and msg.reply_to_message_id_ and Mod(msg) then
if AddChannel(msg.sender_user_id_) == false then
local textchuser = bot_data:get(ban_id..'text:ch:user')
if textchuser then
send(msg.chat_id_, msg.id_,'['..textchuser..']')
else
send(msg.chat_id_, msg.id_,' ⌯︙ لا تستطيع استخدام البوت \n ⌯︙  يرجى الاشتراك بالقناه اولا \n ⌯︙  اشترك هنا ['..bot_data:get(ban_id..'add:ch:username')..']')
end
return false
end
function start_function(extra, result, success)
bot_data:srem(ban_id..'Zahf:User'..msg.chat_id_, result.sender_user_id_)
tdcli_function ({ID = "GetUser",user_id_ = result.sender_user_id_},function(arg,data) 
usertext = '\n ⌯︙ الـعـضو  ⋖ ['..data.first_name_..'](t.me/'..(data.username_ or 'g_00_l_d')..')'
status  = '\n ⌯︙ تم تنزيل ابني من الجروب\n'
send(msg.chat_id_, msg.id_, usertext..status)
end,nil)
end
tdcli_function ({ID = "GetMessage",chat_id_ = msg.chat_id_,message_id_ = tonumber(msg.reply_to_message_id_)}, start_function, nil)
return false
end
-----------------------------------------------------
if text == 'مسح بنتي' and Mod(msg) then
bot_data:del(ban_id..'Zahf:User'..msg.chat_id_)
send(msg.chat_id_, msg.id_, ' ⌯︙ تم تنزيل جميع االاكساس')
end
if text == ("تاك لبناتي") and Mod(msg) then
local list = bot_data:smembers(ban_id..'Zahf:User'..msg.chat_id_)
t = "\n ⌯︙ قائمة بناتي الجروب \n•━═━═━═「ɢᴏʟᴅ」═━═━═━•\n"
for k,v in pairs(list) do
local username = bot_data:get(ban_id.."user:Name" .. v)
if username then
t = t..""..k.."⋖ بنتي [@"..username.."]\n"
else
t = t..""..k.."⋖ بنتي"..v.."\n"
end
end
if #list == 0 then
t = " ⌯︙ لا يوجد بنات"
end
send(msg.chat_id_, msg.id_, t)
end
---------
if text == ("رفع بنتي") and tonumber(msg.reply_to_message_id_) ~= 0 and Mod(msg) then
if AddChannel(msg.sender_user_id_) == false then
local textchuser = bot_data:get(ban_id..'text:ch:user')
if textchuser then
send(msg.chat_id_, msg.id_,'['..textchuser..']')
else
send(msg.chat_id_, msg.id_,' ⌯︙ لا تستطيع استخدام البوت \n ⌯︙  يرجى الاشتراك بالقناه اولا \n ⌯︙  اشترك هنا ['..bot_data:get(ban_id..'add:ch:username')..']')
end
return false
end
if bot_data:get(ban_id..'Lock:Add:Bot'..msg.chat_id_) and not Constructor(msg) then
send(msg.chat_id_, msg.id_,' ⌯︙ تم تعطيل الرفع') 
return false
end
function start_function(extra, result, success)
bot_data:sadd(ban_id..'Zahf:User'..msg.chat_id_, result.sender_user_id_)
tdcli_function ({ID = "GetUser",user_id_ = result.sender_user_id_},function(arg,data) 
usertext = '\n ⌯︙ الـعـضو  ⋖ ['..data.first_name_..'](t.me/'..(data.username_ or 'g_00_l_d')..')'
local  statuss  = '\n ⌯︙ تم رفع بنتي في الجروب\n'
send(msg.chat_id_, msg.id_, usertext..statuss)
end,nil)
end
tdcli_function ({ID = "GetMessage",chat_id_ = msg.chat_id_,message_id_ = tonumber(msg.reply_to_message_id_)}, start_function, nil)
return false
end

if (text == ("تنزيل بنتي")) and msg.reply_to_message_id_ and Mod(msg) then
if AddChannel(msg.sender_user_id_) == false then
local textchuser = bot_data:get(ban_id..'text:ch:user')
if textchuser then
send(msg.chat_id_, msg.id_,'['..textchuser..']')
else
send(msg.chat_id_, msg.id_,' ⌯︙ لا تستطيع استخدام البوت \n ⌯︙  يرجى الاشتراك بالقناه اولا \n ⌯︙  اشترك هنا ['..bot_data:get(ban_id..'add:ch:username')..']')
end
return false
end
function start_function(extra, result, success)
bot_data:srem(ban_id..'Zahf:User'..msg.chat_id_, result.sender_user_id_)
tdcli_function ({ID = "GetUser",user_id_ = result.sender_user_id_},function(arg,data) 
usertext = '\n ⌯︙ الـعـضو  ⋖ ['..data.first_name_..'](t.me/'..(data.username_ or 'g_00_l_d')..')'
status  = '\n ⌯︙ تم تنزيل بنتي من الجروب\n'
send(msg.chat_id_, msg.id_, usertext..status)
end,nil)
end
tdcli_function ({ID = "GetMessage",chat_id_ = msg.chat_id_,message_id_ = tonumber(msg.reply_to_message_id_)}, start_function, nil)
return false
end
-----------------------------------------------------
if text == 'مسح خاين' and Mod(msg) then
bot_data:del(ban_id..'Zahf:User'..msg.chat_id_)
send(msg.chat_id_, msg.id_, ' ⌯︙ تم تنزيل جميع االاكساس')
end
if text == ("تاك للخاينين") and Mod(msg) then
local list = bot_data:smembers(ban_id..'Zahf:User'..msg.chat_id_)
t = "\n ⌯︙ قائمة الخاينين الجروب \n•━═━═━═「ɢᴏʟᴅ」═━═━═━•\n"
for k,v in pairs(list) do
local username = bot_data:get(ban_id.."user:Name" .. v)
if username then
t = t..""..k.."⋖ خاين [@"..username.."]\n"
else
t = t..""..k.."⋖ خاين"..v.."\n"
end
end
if #list == 0 then
t = " ⌯︙ لا يوجد خاينين"
end
send(msg.chat_id_, msg.id_, t)
end
---------
if text == ("رفع خاين") and tonumber(msg.reply_to_message_id_) ~= 0 and Mod(msg) then
if AddChannel(msg.sender_user_id_) == false then
local textchuser = bot_data:get(ban_id..'text:ch:user')
if textchuser then
send(msg.chat_id_, msg.id_,'['..textchuser..']')
else
send(msg.chat_id_, msg.id_,' ⌯︙ لا تستطيع استخدام البوت \n ⌯︙  يرجى الاشتراك بالقناه اولا \n ⌯︙  اشترك هنا ['..bot_data:get(ban_id..'add:ch:username')..']')
end
return false
end
if bot_data:get(ban_id..'Lock:Add:Bot'..msg.chat_id_) and not Constructor(msg) then
send(msg.chat_id_, msg.id_,' ⌯︙ تم تعطيل الرفع') 
return false
end
function start_function(extra, result, success)
bot_data:sadd(ban_id..'Zahf:User'..msg.chat_id_, result.sender_user_id_)
tdcli_function ({ID = "GetUser",user_id_ = result.sender_user_id_},function(arg,data) 
usertext = '\n ⌯︙ الـعـضو  ⋖ ['..data.first_name_..'](t.me/'..(data.username_ or 'g_00_l_d')..')'
local  statuss  = '\n ⌯︙ تم رفع خاين في الجروب\n'
send(msg.chat_id_, msg.id_, usertext..statuss)
end,nil)
end
tdcli_function ({ID = "GetMessage",chat_id_ = msg.chat_id_,message_id_ = tonumber(msg.reply_to_message_id_)}, start_function, nil)
return false
end

if (text == ("تنزيل خاين")) and msg.reply_to_message_id_ and Mod(msg) then
if AddChannel(msg.sender_user_id_) == false then
local textchuser = bot_data:get(ban_id..'text:ch:user')
if textchuser then
send(msg.chat_id_, msg.id_,'['..textchuser..']')
else
send(msg.chat_id_, msg.id_,' ⌯︙ لا تستطيع استخدام البوت \n ⌯︙  يرجى الاشتراك بالقناه اولا \n ⌯︙  اشترك هنا ['..bot_data:get(ban_id..'add:ch:username')..']')
end
return false
end
function start_function(extra, result, success)
bot_data:srem(ban_id..'Zahf:User'..msg.chat_id_, result.sender_user_id_)
tdcli_function ({ID = "GetUser",user_id_ = result.sender_user_id_},function(arg,data) 
usertext = '\n ⌯︙ الـعـضو  ⋖ ['..data.first_name_..'](t.me/'..(data.username_ or 'g_00_l_d')..')'
status  = '\n ⌯︙ تم تنزيل خاين من الجروب\n'
send(msg.chat_id_, msg.id_, usertext..status)
end,nil)
end
tdcli_function ({ID = "GetMessage",chat_id_ = msg.chat_id_,message_id_ = tonumber(msg.reply_to_message_id_)}, start_function, nil)
return false
end
-----------------------------------------------------
if text == 'تنزيل الرقصات' and Mod(msg) then
bot_data:del(ban_id..'Zahf:User'..msg.chat_id_)
send(msg.chat_id_, msg.id_, ' ⌯︙ تم تنزيل جميع زواحف')
end
if text == ("تاك للرقاصات") and Mod(msg) then
local list = bot_data:smembers(ban_id..'Zahf:User'..msg.chat_id_)
t = "\n ⌯︙ قائمة رقاصات الجروب \n•━═━═━═「ɢᴏʟᴅ」═━═━═━•\n"
for k,v in pairs(list) do
local username = bot_data:get(ban_id.."user:Name" .. v)
if username then
t = t..""..k.." ⋖ الرقاصه [@"..username.."]\n"
else
t = t..""..k.." ⋖ الرقاصه "..v.."\n"
end
end
if #list == 0 then
t = " ⌯︙ لا يوجد رقاصات"
end
send(msg.chat_id_, msg.id_, t)
end
---------
if text == ("رفع رقاصه") and tonumber(msg.reply_to_message_id_) ~= 0 and Mod(msg) then
if AddChannel(msg.sender_user_id_) == false then
local textchuser = bot_data:get(ban_id..'text:ch:user')
if textchuser then
send(msg.chat_id_, msg.id_,'['..textchuser..']')
else
send(msg.chat_id_, msg.id_,' ⌯︙ لا تستطيع استخدام البوت \n ⌯︙ يرجى الاشتراك بالقناه اولا \n ⌯︙ اشترك هنا ['..bot_data:get(ban_id..'add:ch:username')..']')
end
return false
end
if bot_data:get(ban_id..'Lock:Add:Bot'..msg.chat_id_) and not Constructor(msg) then
send(msg.chat_id_, msg.id_,' ⌯︙ تم تعطيل الرفع') 
return false
end
function start_function(extra, result, success)
bot_data:sadd(ban_id..'Zahf:User'..msg.chat_id_, result.sender_user_id_)
tdcli_function ({ID = "GetUser",user_id_ = result.sender_user_id_},function(arg,data) 
usertext = '\n ?? الـعـضو   ⋖ ['..data.first_name_..'](t.me/'..(data.username_ or 'g_00_l_d')..')'
local statuss = '\n ⌯︙ تم رفع رقاصه في الجروب\n ⌯︙ مبقتش شريفه لا اله الي الله'
send(msg.chat_id_, msg.id_, usertext..statuss)
end,nil)
end
tdcli_function ({ID = "GetMessage",chat_id_ = msg.chat_id_,message_id_ = tonumber(msg.reply_to_message_id_)}, start_function, nil)
return false
end

if (text == ("تنزيل رقاصه")) and msg.reply_to_message_id_ and Mod(msg) then
if AddChannel(msg.sender_user_id_) == false then
local textchuser = bot_data:get(ban_id..'text:ch:user')
if textchuser then
send(msg.chat_id_, msg.id_,'['..textchuser..']')
else
send(msg.chat_id_, msg.id_,' ⌯︙ لا تستطيع استخدام البوت \n ⌯︙ يرجى الاشتراك بالقناه اولا \n ⌯︙ اشترك هنا ['..bot_data:get(ban_id..'add:ch:username')..']')
end
return false
end
function start_function(extra, result, success)
bot_data:srem(ban_id..'Zahf:User'..msg.chat_id_, result.sender_user_id_)
tdcli_function ({ID = "GetUser",user_id_ = result.sender_user_id_},function(arg,data) 
usertext = '\n ⌯︙ الـعـضو   ⋖ ['..data.first_name_..'](t.me/'..(data.username_ or 'g_00_l_d')..')'
status = '\n ?? تم تنزيل رقاصه من الجروب\n ⌯︙ بقت شريفه لا اله الي الله'
send(msg.chat_id_, msg.id_, usertext..status)
end,nil)
end
tdcli_function ({ID = "GetMessage",chat_id_ = msg.chat_id_,message_id_ = tonumber(msg.reply_to_message_id_)}, start_function, nil)
return false
end
-----------------------------------------------------
if text == 'تنزيل المتناكين' and Mod(msg) then
bot_data:del(ban_id..'Jred:User'..msg.chat_id_)
send(msg.chat_id_, msg.id_, ' ⌯︙ تم تنزيل جميع جريزي')
end
if text == ("تاك للمتناكين") and Mod(msg) then
local list = bot_data:smembers(ban_id..'Jred:User'..msg.chat_id_)
t = "\n ⌯︙ قائمة المتناكين الجروب \n•━═━═━═「ɢᴏʟᴅ」═━═━═━•\n"
for k,v in pairs(list) do
local username = bot_data:get(ban_id.."user:Name" .. v)
if username then
t = t..""..k.." ⋖ المتناك [@"..username.."]\n"
else
t = t..""..k.." ⋖ المتناك "..v.."\n"
end
end
if #list == 0 then
t = " ⌯︙ لا يوجد متناكين"
end
send(msg.chat_id_, msg.id_, t)
end
---------
if text == ("رفع علي زبي") and tonumber(msg.reply_to_message_id_) ~= 0 and Mod(msg) then
if AddChannel(msg.sender_user_id_) == false then
local textchuser = bot_data:get(ban_id..'text:ch:user')
if textchuser then
send(msg.chat_id_, msg.id_,'['..textchuser..']')
else
send(msg.chat_id_, msg.id_,' ⌯︙ لا تستطيع استخدام البوت \n ⌯︙ يرجى الاشتراك بالقناه اولا \n ⌯︙ اشترك هنا ['..bot_data:get(ban_id..'add:ch:username')..']')
end
return false
end
if bot_data:get(ban_id..'Lock:Add:Bot'..msg.chat_id_) and not Constructor(msg) then
send(msg.chat_id_, msg.id_,' ⌯︙ تم تعطيل الرفع') 
return false
end
function start_function(extra, result, success)
bot_data:sadd(ban_id..'Jred:User'..msg.chat_id_, result.sender_user_id_)
tdcli_function ({ID = "GetUser",user_id_ = result.sender_user_id_},function(arg,data) 
usertext = '\n ⌯︙ الـعـضو   ⋖ ['..data.first_name_..'](t.me/'..(data.username_ or 'g_00_l_d')..')'
local statuss = '\n ⌯︙ تم رفع الـعـضو  علي زبك بنجاح\n ⌯︙ تفضل ابدا نيك'
send(msg.chat_id_, msg.id_, usertext..statuss)
end,nil)
end
tdcli_function ({ID = "GetMessage",chat_id_ = msg.chat_id_,message_id_ = tonumber(msg.reply_to_message_id_)}, start_function, nil)
return false
end

if (text == ("تنزيل من زبي")) and msg.reply_to_message_id_ and Mod(msg) then
if AddChannel(msg.sender_user_id_) == false then
local textchuser = bot_data:get(ban_id..'text:ch:user')
if textchuser then
send(msg.chat_id_, msg.id_,'['..textchuser..']')
else
send(msg.chat_id_, msg.id_,' ⌯︙ لا تستطيع استخدام البوت \n ⌯︙ يرجى الاشتراك بالقناه اولا \n ⌯︙ اشترك هنا ['..bot_data:get(ban_id..'add:ch:username')..']')
end
return false
end
function start_function(extra, result, success)
bot_data:srem(ban_id..'Jred:User'..msg.chat_id_, result.sender_user_id_)
tdcli_function ({ID = "GetUser",user_id_ = result.sender_user_id_},function(arg,data) 
usertext = '\n ⌯︙ الـعـضو   ⋖ ['..data.first_name_..'](t.me/'..(data.username_ or 'g_00_l_d')..')'
status = '\n ⌯︙ تم تنزيل الـعـضو  من زبك\n ⌯︙ هيفضل متناك بردو'
send(msg.chat_id_, msg.id_, usertext..status)
end,nil)
end
tdcli_function ({ID = "GetMessage",chat_id_ = msg.chat_id_,message_id_ = tonumber(msg.reply_to_message_id_)}, start_function, nil)
return false
end

if text == 'مسح الحكاكين' and Mod(msg) then
bot_data:del(ban_id..'Zahf:User'..msg.chat_id_)
send(msg.chat_id_, msg.id_, ' ⌯︙ تم مسح كل الحكاكين')
end
if text == ("تاك للحكاكين") and Mod(msg) then
local list = bot_data:smembers(ban_id..'Zahf:User'..msg.chat_id_)
t = "\n ⌯︙ قائمة حكاكين الجروب \n•━═━═━═「ɢᴏʟᴅ」═━═━═━•\n"
for k,v in pairs(list) do
local username = bot_data:get(ban_id.."user:Name" .. v)
if username then
t = t..""..k.."⋖ الحكاك [@"..username.."]\n"
else
t = t..""..k.."⋖ الحكاك `"..v.."`\n"
end
end
if #list == 0 then
t = " ⌯︙ لا يوجد حكاك"
end
send(msg.chat_id_, msg.id_, t)
end
---------
if text == ("رفع حكاك") and tonumber(msg.reply_to_message_id_) ~= 0 and Mod(msg) then
if AddChannel(msg.sender_user_id_) == false then
local textchuser = bot_data:get(ban_id..'text:ch:user')
if textchuser then
send(msg.chat_id_, msg.id_,'['..textchuser..']')
else
send(msg.chat_id_, msg.id_,' ⌯︙ لا تستطيع استخدام البوت \n ⌯︙  يرجى الاشتراك بالقناه اولا \n ⌯︙  اشترك هنا ['..bot_data:get(ban_id..'add:ch:username')..']')
end
return false
end
if bot_data:get(ban_id..'Lock:Add:Bot'..msg.chat_id_) and not Constructor(msg) then
send(msg.chat_id_, msg.id_,' ⌯︙ تم تعطيل الرفع') 
return false
end
function start_function(extra, result, success)
bot_data:sadd(ban_id..'Zahf:User'..msg.chat_id_, result.sender_user_id_)
tdcli_function ({ID = "GetUser",user_id_ = result.sender_user_id_},function(arg,data) 
usertext = '\n ⌯︙ الـعـضو  ⋖ ['..data.first_name_..'](t.me/'..(data.username_ or 'g_00_l_d')..')'
local  statuss  = '\n ⌯︙ تم رفع حكاك في الجروب\n ⌯︙ احمرت ولا لسا'
send(msg.chat_id_, msg.id_, usertext..statuss)
end,nil)
end
tdcli_function ({ID = "GetMessage",chat_id_ = msg.chat_id_,message_id_ = tonumber(msg.reply_to_message_id_)}, start_function, nil)
return false
end

if (text == ("تنزيل حكاك")) and msg.reply_to_message_id_ and Mod(msg) then
if AddChannel(msg.sender_user_id_) == false then
local textchuser = bot_data:get(ban_id..'text:ch:user')
if textchuser then
send(msg.chat_id_, msg.id_,'['..textchuser..']')
else
send(msg.chat_id_, msg.id_,' ⌯︙ لا تستطيع استخدام البوت \n ⌯︙  يرجى الاشتراك بالقناه اولا \n ⌯︙  اشترك هنا ['..bot_data:get(ban_id..'add:ch:username')..']')
end
return false
end
function start_function(extra, result, success)
bot_data:srem(ban_id..'Zahf:User'..msg.chat_id_, result.sender_user_id_)
tdcli_function ({ID = "GetUser",user_id_ = result.sender_user_id_},function(arg,data) 
usertext = '\n ⌯︙ الـعـضو  ⋖ ['..data.first_name_..'](t.me/'..(data.username_ or 'g_00_l_d')..')'
status  = '\n ⌯︙ تم تنزيل حكاك من الجروب\n ⌯︙ لا يسطت هيفضل حكاك رسمي'
send(msg.chat_id_, msg.id_, usertext..status)
end,nil)
end
tdcli_function ({ID = "GetMessage",chat_id_ = msg.chat_id_,message_id_ = tonumber(msg.reply_to_message_id_)}, start_function, nil)
return false
end
if text == 'مسح النسوان' and Mod(msg) then
bot_data:del(ban_id..'Girl:User'..msg.chat_id_)
send(msg.chat_id_, msg.id_, ' ⌯︙ تم مسح كل النسوان بالجروب')
end
if text == ("تاك للنسوان") and Mod(msg) then
local list = bot_data:smembers(ban_id..'Girl:User'..msg.chat_id_)
t = "\n ⌯︙ قائمة نسوان الجروب \n•━═━═━═「ɢᴏʟᴅ」═━═━═━•\n"
for k,v in pairs(list) do
local username = bot_data:get(ban_id.."user:Name" .. v)
if username then
t = t..""..k.."⋖ المره [@"..username.."]\n"
else
t = t..""..k.."⋖ المره `"..v.."`\n"
end
end
if #list == 0 then
t = " ⌯︙ لا يوجد نسوان غيرك"
end
send(msg.chat_id_, msg.id_, t)
end
---------
if text == ("رفع مره") and tonumber(msg.reply_to_message_id_) ~= 0 and Mod(msg) then
if AddChannel(msg.sender_user_id_) == false then
local textchuser = bot_data:get(ban_id..'text:ch:user')
if textchuser then
send(msg.chat_id_, msg.id_,'['..textchuser..']')
else
send(msg.chat_id_, msg.id_,' ⌯︙ لا تستطيع استخدام البوت \n ⌯︙  يرجى الاشتراك بالقناه اولا \n ⌯︙  اشترك هنا ['..bot_data:get(ban_id..'add:ch:username')..']')
end
return false
end
if bot_data:get(ban_id..'Lock:Add:Bot'..msg.chat_id_) and not Constructor(msg) then
send(msg.chat_id_, msg.id_,' ⌯︙ تم تعطيل الرفع') 
return false
end
function start_function(extra, result, success)
bot_data:sadd(ban_id..'Girl:User'..msg.chat_id_, result.sender_user_id_)
tdcli_function ({ID = "GetUser",user_id_ = result.sender_user_id_},function(arg,data) 
usertext = '\n ⌯︙ الـعـضو  ⋖ ['..data.first_name_..'](t.me/'..(data.username_ or 'g_00_l_d')..')'
local  statuss  = '\n ⌯︙ تم رفع مره في الجروب\n ⌯︙ ها صرتي من نسواني تعي ندخل'
send(msg.chat_id_, msg.id_, usertext..statuss)
end,nil)
end
tdcli_function ({ID = "GetMessage",chat_id_ = msg.chat_id_,message_id_ = tonumber(msg.reply_to_message_id_)}, start_function, nil)
return false
end

if (text == ("تنزيل مره")) and msg.reply_to_message_id_ and Mod(msg) then
if AddChannel(msg.sender_user_id_) == false then
local textchuser = bot_data:get(ban_id..'text:ch:user')
if textchuser then
send(msg.chat_id_, msg.id_,'['..textchuser..']')
else
send(msg.chat_id_, msg.id_,' ⌯︙ لا تستطيع استخدام البوت \n ⌯︙  يرجى الاشتراك بالقناه اولا \n ⌯︙  اشترك هنا ['..bot_data:get(ban_id..'add:ch:username')..']')
end
return false
end
function start_function(extra, result, success)
bot_data:srem(ban_id..'Girl:User'..msg.chat_id_, result.sender_user_id_)
tdcli_function ({ID = "GetUser",user_id_ = result.sender_user_id_},function(arg,data) 
usertext = '\n ⌯︙ الـعـضو  ⋖ ['..data.first_name_..'](t.me/'..(data.username_ or 'g_00_l_d')..')'
status  = '\n ⌯︙ تم تنزيل مره من الجروب\n ⌯︙ بتاعي غضبان عليكي ليوم الدين'
send(msg.chat_id_, msg.id_, usertext..status)
end,nil)
end
tdcli_function ({ID = "GetMessage",chat_id_ = msg.chat_id_,message_id_ = tonumber(msg.reply_to_message_id_)}, start_function, nil)
return false
end
if text == 'مسح المتزوجين' and Mod(msg) then
bot_data:del(ban_id..'Mode:User'..msg.chat_id_)
send(msg.chat_id_, msg.id_, ' ⌯︙ تم مسح جميع المتزوجين')
end
if text == ("تاك للمتزوجين") and Mod(msg) then
local list = bot_data:smembers(ban_id..'Mode:User'..msg.chat_id_)
t = "\n ⌯︙ قائمه ازواج الجروب \n•━═━═━═「ɢᴏʟᴅ」═━═━═━•\n"
for k,v in pairs(list) do
local username = bot_data:get(ban_id.."user:Name" .. v)
if username then
t = t..""..k.."⋖ الزوج [@"..username.."]\n"
else
t = t..""..k.."⋖ الزوجه `"..v.."`\n"
end
end
if #list == 0 then
t = " ⌯︙ مع الاسف لا يوجد متزوجين"
end
send(msg.chat_id_, msg.id_, t)
end
---------
if text == ("زواج") and tonumber(msg.reply_to_message_id_) ~= 0 and Mod(msg) then
if AddChannel(msg.sender_user_id_) == false then
local textchuser = bot_data:get(ban_id..'text:ch:user')
if textchuser then
send(msg.chat_id_, msg.id_,'['..textchuser..']')
else
send(msg.chat_id_, msg.id_,' ⌯︙ لا تستطيع استخدام البوت \n ⌯︙  يرجى الاشتراك بالقناه اولا \n ⌯︙  اشترك هنا ['..bot_data:get(ban_id..'add:ch:username')..']')
end
return false
end
if bot_data:get(ban_id..'Lock:Add:Bot'..msg.chat_id_) and not Constructor(msg) then
send(msg.chat_id_, msg.id_,' ⌯︙ تم تعطيل الرفع') 
return false
end
function start_function(extra, result, success)
bot_data:sadd(ban_id..'Mode:User'..msg.chat_id_, result.sender_user_id_)
tdcli_function ({ID = "GetUser",user_id_ = result.sender_user_id_},function(arg,data) 
usertext = '\n ⌯︙ العضــو ⋖ ['..data.first_name_..'](t.me/'..(data.username_ or 'g_00_l_d')..')'
local  statuss  = '\n ⌯︙ تم زواجكم بنجاح في الجروب \n ⌯︙ الطلاق امتي عشان ابقي موجود '
send(msg.chat_id_, msg.id_, usertext..statuss)
end,nil)
end
tdcli_function ({ID = "GetMessage",chat_id_ = msg.chat_id_,message_id_ = tonumber(msg.reply_to_message_id_)}, start_function, nil)
return false
end

if (text == ("طلاق")) and msg.reply_to_message_id_ and Mod(msg) then
if AddChannel(msg.sender_user_id_) == false then
local textchuser = bot_data:get(ban_id..'text:ch:user')
if textchuser then
send(msg.chat_id_, msg.id_,'['..textchuser..']')
else
send(msg.chat_id_, msg.id_,' ⌯︙ لا تستطيع استخدام البوت \n ⌯︙  يرجى الاشتراك بالقناه اولا \n ⌯︙  اشترك هنا ['..bot_data:get(ban_id..'add:ch:username')..']')
end
return false
end
function start_function(extra, result, success)
bot_data:srem(ban_id..'Mode:User'..msg.chat_id_, result.sender_user_id_)
tdcli_function ({ID = "GetUser",user_id_ = result.sender_user_id_},function(arg,data) 
usertext = '\n ⌯︙ العضــو ⋖ ['..data.first_name_..'](t.me/'..(data.username_ or 'g_00_l_d')..')'
status  = '\n ⌯︙ تم طلاقكم بنجاح في الجروب\n ⌯︙ اوجعو تاني ونبي'
send(msg.chat_id_, msg.id_, usertext..status)
end,nil)
end
tdcli_function ({ID = "GetMessage",chat_id_ = msg.chat_id_,message_id_ = tonumber(msg.reply_to_message_id_)}, start_function, nil)
return false
end 
-----------------------------------------------------
if text == 'مسح الميتين' and Mod(msg) then
bot_data:del(ban_id..'Zahf:User'..msg.chat_id_)
send(msg.chat_id_, msg.id_, ' ⌯︙ تم تنزيل جميع االاكساس')
end
if text == ("تاك للميتنين") and Mod(msg) then
local list = bot_data:smembers(ban_id..'Zahf:User'..msg.chat_id_)
t = "\n ⌯︙ قائمة الميتنين \n•━═━═━═「ɢᴏʟᴅ」═━═━═━•\n"
for k,v in pairs(list) do
local username = bot_data:get(ban_id.."user:Name" .. v)
if username then
t = t..""..k.." ⋖ الميت[@"..username.."]\n"
else
t = t..""..k.." ⋖ الميت "..v.."\n"
end
end
if #list == 0 then
t = " ⌯︙ لا يوجد ميتين"
end
send(msg.chat_id_, msg.id_, t)
end
---------
if text == ("تخ") and tonumber(msg.reply_to_message_id_) ~= 0 and Mod(msg) then
if AddChannel(msg.sender_user_id_) == false then
local textchuser = bot_data:get(ban_id..'text:ch:user')
if textchuser then
send(msg.chat_id_, msg.id_,'['..textchuser..']')
else
send(msg.chat_id_, msg.id_,' ⌯︙ لا تستطيع استخدام البوت \n ⌯︙  يرجى الاشتراك بالقناه اولا \n ⌯︙  اشترك هنا ['..bot_data:get(ban_id..'add:ch:username')..']')
end
return false
end
if bot_data:get(ban_id..'Lock:Add:Bot'..msg.chat_id_) and not Constructor(msg) then
send(msg.chat_id_, msg.id_,' ⌯︙ تم تعطيل القتل') 
return false
end
function start_function(extra, result, success)
bot_data:sadd(ban_id..'Zahf:User'..msg.chat_id_, result.sender_user_id_)
tdcli_function ({ID = "GetUser",user_id_ = result.sender_user_id_},function(arg,data) 
usertext = '\n ⌯︙ الـعـضو   ⋖ ['..data.first_name_..'](t.me/'..(data.username_ or 'g_00_l_d')..')'
local  statuss  = '\n ⌯︙تم قتله بنجاح\n'
send(msg.chat_id_, msg.id_, usertext..statuss)
end,nil)
end
tdcli_function ({ID = "GetMessage",chat_id_ = msg.chat_id_,message_id_ = tonumber(msg.reply_to_message_id_)}, start_function, nil)
return false
end

if (text == ("اصحه")) and msg.reply_to_message_id_ and Mod(msg) then
if AddChannel(msg.sender_user_id_) == false then
local textchuser = bot_data:get(ban_id..'text:ch:user')
if textchuser then
send(msg.chat_id_, msg.id_,'['..textchuser..']')
else
send(msg.chat_id_, msg.id_,' ⌯︙ لا تستطيع استخدام البوت \n ⌯︙  يرجى الاشتراك بالقناه اولا \n ⌯︙  اشترك هنا ['..bot_data:get(ban_id..'add:ch:username')..']')
end
return false
end
function start_function(extra, result, success)
bot_data:srem(ban_id..'Zahf:User'..msg.chat_id_, result.sender_user_id_)
tdcli_function ({ID = "GetUser",user_id_ = result.sender_user_id_},function(arg,data) 
usertext = '\n ⌯︙ الـعـضو   ⋖ ['..data.first_name_..'](t.me/'..(data.username_ or 'g_00_l_d')..')'
status  = '\n ⌯︙ تم رجوع للحياه\n'
send(msg.chat_id_, msg.id_, usertext..status)
end,nil)
end
tdcli_function ({ID = "GetMessage",chat_id_ = msg.chat_id_,message_id_ = tonumber(msg.reply_to_message_id_)}, start_function, nil)
return false
end
if text == 'مسح المحظورين' and Mod(msg) then
bot_data:del(ban_id..'DRG:User'..msg.chat_id_)
send(msg.chat_id_, msg.id_, '\n ⌯︙ تم مسح المحظورين')
end
if text == ("المحظورين") then
local list = bot_data:smembers(ban_id..'DRG:User'..msg.chat_id_)
t = "\n ⌯︙ قائمة محظورين الجروب \n•━═━═━═「ɢᴏʟᴅ」═━═━═━•\n"
for k,v in pairs(list) do
local username = bot_data:get(ban_id.."user:Name" .. v)
if username then
t = t..""..k.."- ([@"..username.."])\n"
else
t = t..""..k.."- (`"..v.."`)\n"
end
end
if #list == 0 then
t = " ⌯︙ لا يوجد محظورين"
end
send(msg.chat_id_, msg.id_, t)
end
if text == ("حظر") and msg.reply_to_message_id_ ~= 0 and Mod(msg) then
if AddChannel(msg.sender_user_id_) == false then
local textchuser = bot_data:get(ban_id..'text:ch:user')
if textchuser then
send(msg.chat_id_, msg.id_,'['..textchuser..']')
else
send(msg.chat_id_, msg.id_,' ⌯︙ لا تستطيع استخدام البوت \n ⌯︙  يرجى الاشتراك بالقناه اولا \n ⌯︙  اشترك هنا ['..bot_data:get(ban_id..'add:ch:username')..']')
end
return false
end
if bot_data:get(ban_id..'Lock:kick'..msg.chat_id_) and not Constructor(msg) then
send(msg.chat_id_, msg.id_,' ⌯︙ تم تعطيل الحظر') 
return false
end
function start_function(extra, result, success)
if tonumber(result.sender_user_id_) == tonumber(ban_id) then  
send(msg.chat_id_, msg.id_, " ⌯︙ لا تسطيع حظر البوت ")
return false 
end
if Can_or_NotCan(result.sender_user_id_, msg.chat_id_) == true then
send(msg.chat_id_, msg.id_, '\n ⌯︙ عذرا لا تستطيع حظر ( '..Rutba(result.sender_user_id_,msg.chat_id_)..' )')
else
tdcli_function ({ ID = "ChangeChatMemberStatus", chat_id_ = msg.chat_id_, user_id_ = result.sender_user_id_, status_ = { ID = "ChatMemberStatusKicked" },},function(arg,data) 
if (data and data.code_ and data.code_ == 400 and data.message_ == "CHAT_ADMIN_REQUIRED") then 
send(msg.chat_id_, msg.id_,' ⌯︙ ليس لدي صلاحية حظر المستخدمين يرجى تفعيلها !') 
return false  
end
if msg.can_be_deleted_ == false then 
send(msg.chat_id_, msg.id_,' ⌯︙ البوت ليس ادمن يرجى ترقيتي !') 
return false  
end
bot_data:sadd(ban_id..'DRG:User'..msg.chat_id_, result.sender_user_id_)
tdcli_function ({ID = "GetUser",user_id_ = result.sender_user_id_},function(arg,data) 
usertext = '\n ⌯︙ الـعـضو   ⋖ ['..data.first_name_..'](t.me/'..(data.username_ or 'g_00_l_d')..')'
status  = '\n ⌯︙ تم حظره'
send(msg.chat_id_, msg.id_, usertext..status)
end,nil)
chat_kick(result.chat_id_, result.sender_user_id_)
end,nil)   
end
end
tdcli_function ({ID = "GetMessage",chat_id_ = msg.chat_id_,message_id_ = tonumber(msg.reply_to_message_id_)}, start_function, nil)
return false
end

if text and text:match("^حظر @(.*)$") and Mod(msg) then
local username = text:match("^حظر @(.*)$")
if bot_data:get(ban_id..'Lock:kick'..msg.chat_id_) and not Constructor(msg) then
send(msg.chat_id_, msg.id_,' ⌯︙ تم تعطيل الحظر') 
return false
end
function start_function(extra, result, success)
if result.id_ then
if Can_or_NotCan(result.id_, msg.chat_id_) == true then
send(msg.chat_id_, msg.id_, '\n ⌯︙ عذرا لا تستطيع حظر ( '..Rutba(result.id_,msg.chat_id_)..' )')
else
tdcli_function ({ ID = "ChangeChatMemberStatus", chat_id_ = msg.chat_id_, user_id_ = result.id_, status_ = { ID = "ChatMemberStatusKicked" },},function(arg,data) 
if (result and result.type_ and result.type_.ID == "ChannelChatInfo") then
send(msg.chat_id_,msg.id_," ⌯︙ عذرا عزيزي المستخدم هاذا معرف قناة يرجى استخدام الامر بصوره صحيحه !")   
return false 
end      
if (data and data.code_ and data.code_ == 400 and data.message_ == "CHAT_ADMIN_REQUIRED") then 
send(msg.chat_id_, msg.id_,' ⌯︙  ليس لدي صلاحية حظر المستخدمين يرجى تفعيلها !') 
return false  
end
if msg.can_be_deleted_ == false then 
send(msg.chat_id_, msg.id_,' ⌯︙ البوت ليس ادمن يرجى ترقيتي !') 
return false  
end
bot_data:sadd(ban_id..'DRG:User'..msg.chat_id_, result.id_)
usertext = '\n ⌯︙  المستخدم  ⋖ ['..result.title_..'](t.me/'..(username or 'g_00_l_d')..')'
status  = '\n ⌯︙ تم حظره'
texts = usertext..status
chat_kick(msg.chat_id_, result.id_)
send(msg.chat_id_, msg.id_, texts)
end,nil)   
end
else
send(msg.chat_id_, msg.id_, ' ⌯︙ لا يوجد حساب بهاذا المعرف')
end
end
tdcli_function ({ID = "SearchPublicChat",username_ = username}, start_function, nil)
return false
end

if text and text:match("^حظر (%d+)$") and Mod(msg) then
local userid = text:match("^حظر (%d+)$") 
if AddChannel(msg.sender_user_id_) == false then
local textchuser = bot_data:get(ban_id..'text:ch:user')
if textchuser then
send(msg.chat_id_, msg.id_,'['..textchuser..']')
else
send(msg.chat_id_, msg.id_,' ⌯︙ لا تستطيع استخدام البوت \n ⌯︙  يرجى الاشتراك بالقناه اولا \n ⌯︙  اشترك هنا ['..bot_data:get(ban_id..'add:ch:username')..']')
end
return false
end
if bot_data:get(ban_id..'Lock:kick'..msg.chat_id_) and not Constructor(msg) then
send(msg.chat_id_, msg.id_,' ⌯︙ تم تعطيل الحظر') 
return false
end
if tonumber(userid) == tonumber(ban_id) then  
send(msg.chat_id_, msg.id_, " ⌯︙ لا تسطيع حظر البوت")
return false 
end
if Can_or_NotCan(userid, msg.chat_id_) == true then
send(msg.chat_id_, msg.id_, '\n ⌯︙ عذرا لا تستطيع حظر ( '..Rutba(userid,msg.chat_id_)..' )')
else
tdcli_function ({ ID = "ChangeChatMemberStatus", chat_id_ = msg.chat_id_, user_id_ = userid, status_ = { ID = "ChatMemberStatusKicked" },},function(arg,data) 
if (data and data.code_ and data.code_ == 400 and data.message_ == "CHAT_ADMIN_REQUIRED") then 
send(msg.chat_id_, msg.id_,' ⌯︙ ليس لدي صلاحية حظر المستخدمين يرجى تفعيلها !') 
return false  
end
if msg.can_be_deleted_ == false then 
send(msg.chat_id_, msg.id_,' ⌯︙ البوت ليس ادمن يرجى ترقيتي !') 
return false  
end
bot_data:sadd(ban_id..'DRG:User'..msg.chat_id_, userid)
chat_kick(msg.chat_id_, userid)  
tdcli_function ({ID = "GetUser",user_id_ = userid},function(arg,data) 
if data.first_name_ then
usertext = '\n ⌯︙ الـعـضو   ⋖ ['..data.first_name_..'](t.me/'..(data.username_ or 'g_00_l_d')..')'
status  = '\n ⌯︙ تم حظره'
send(msg.chat_id_, msg.id_, usertext..status)
else
usertext = '\n ⌯︙ الـعـضو   ⋖ '..userid..''
status  = '\n?? تم حظره'
send(msg.chat_id_, msg.id_, usertext..status)
end;end,nil)
end,nil)   
end
return false
end
if text == ("الغاء حظر") and msg.reply_to_message_id_ and Mod(msg) then
if AddChannel(msg.sender_user_id_) == false then
local textchuser = bot_data:get(ban_id..'text:ch:user')
if textchuser then
send(msg.chat_id_, msg.id_,'['..textchuser..']')
else
send(msg.chat_id_, msg.id_,' ⌯︙ لا تستطيع استخدام البوت \n ⌯︙  يرجى الاشتراك بالقناه اولا \n ⌯︙  اشترك هنا ['..bot_data:get(ban_id..'add:ch:username')..']')
end
return false
end
function start_function(extra, result, success)
if tonumber(result.sender_user_id_) == tonumber(ban_id) then
send(msg.chat_id_, msg.id_, ' ⌯︙ انا لست محظورآ \n') 
return false 
end
bot_data:srem(ban_id..'DRG:User'..msg.chat_id_, result.sender_user_id_)
tdcli_function ({ID = "GetUser",user_id_ = result.sender_user_id_},function(arg,data) 
usertext = '\n ⌯︙ الـعـضو   ⋖ ['..data.first_name_..'](t.me/'..(data.username_ or 'g_00_l_d')..')'
status  = '\n ⌯︙ تم الغاء حظره'
send(msg.chat_id_, msg.id_, usertext..status)
end,nil)
tdcli_function ({ ID = "ChangeChatMemberStatus", chat_id_ = msg.chat_id_, user_id_ = result.sender_user_id_, status_ = { ID = "ChatMemberStatusLeft" },},function(arg,DRG) end,nil)   
end
tdcli_function ({ID = "GetMessage",chat_id_ = msg.chat_id_,message_id_ = tonumber(msg.reply_to_message_id_)}, start_function, nil)
return false
end
 
if text and text:match("^الغاء حظر @(.*)$") and Mod(msg) then
local username = text:match("^الغاء حظر @(.*)$") 
if AddChannel(msg.sender_user_id_) == false then
local textchuser = bot_data:get(ban_id..'text:ch:user')
if textchuser then
send(msg.chat_id_, msg.id_,'['..textchuser..']')
else
send(msg.chat_id_, msg.id_,' ⌯︙ لا تستطيع استخدام البوت \n ⌯︙  يرجى الاشتراك بالقناه اولا \n ⌯︙  اشترك هنا ['..bot_data:get(ban_id..'add:ch:username')..']')
end
return false
end
function start_function(extra, result, success)
if result.id_ then
if tonumber(result.id_) == tonumber(ban_id) then
send(msg.chat_id_, msg.id_, ' ⌯︙ انا لست محظورآ \n') 
return false 
end
bot_data:srem(ban_id..'DRG:User'..msg.chat_id_, result.id_)
tdcli_function ({ ID = "ChangeChatMemberStatus", chat_id_ = msg.chat_id_, user_id_ = result.id_, status_ = { ID = "ChatMemberStatusLeft" },},function(arg,DRG) end,nil)   
usertext = '\n ⌯︙ الـعـضو   ⋖ ['..result.title_..'](t.me/'..(username or 'g_00_l_d')..')'
status  = '\n ⌯︙ تم الغاء حظره'
texts = usertext..status
else
texts = ' ⌯︙ لا يوجد حساب بهاذا المعرف'
end
send(msg.chat_id_, msg.id_, texts)
end
tdcli_function ({ID = "SearchPublicChat",username_ = username}, start_function, nil)
return false
end

if text and text:match("^الغاء حظر (%d+)$") and Mod(msg) then
local userid = text:match("^الغاء حظر (%d+)$") 
if AddChannel(msg.sender_user_id_) == false then
local textchuser = bot_data:get(ban_id..'text:ch:user')
if textchuser then
send(msg.chat_id_, msg.id_,'['..textchuser..']')
else
send(msg.chat_id_, msg.id_,' ⌯︙ لا تستطيع استخدام البوت \n ⌯︙  يرجى الاشتراك بالقناه اولا \n ⌯︙  اشترك هنا ['..bot_data:get(ban_id..'add:ch:username')..']')
end
return false
end
if tonumber(userid) == tonumber(ban_id) then
send(msg.chat_id_, msg.id_, ' ⌯︙ انا لست محظورآ \n') 
return false 
end
bot_data:srem(ban_id..'DRG:User'..msg.chat_id_, userid)
tdcli_function ({ ID = "ChangeChatMemberStatus", chat_id_ = msg.chat_id_, user_id_ = userid, status_ = { ID = "ChatMemberStatusLeft" },},function(arg,DRG) end,nil)   
tdcli_function ({ID = "GetUser",user_id_ = userid},function(arg,data) 
if data.first_name_ then
usertext = '\n ⌯︙ الـعـضو   ⋖ ['..data.first_name_..'](t.me/'..(data.username_ or 'g_00_l_d')..')'
status  = '\n ⌯︙ تم الغاء حظره'
send(msg.chat_id_, msg.id_, usertext..status)
else
usertext = '\n ⌯︙ الـعـضو   ⋖ '..userid..''
status  = '\n ⌯︙ تم الغاء حظره'
send(msg.chat_id_, msg.id_, usertext..status)
end;end,nil)
return false
end
------------------------------------------------------------------------
if text == 'مسح المكتومين' and Mod(msg) then
bot_data:del(ban_id..'Muted:User'..msg.chat_id_)
send(msg.chat_id_, msg.id_, ' ⌯︙ تم مسح المكتومين')
end
if text == ("المكتومين") and Mod(msg) then
local list = bot_data:smembers(ban_id..'Muted:User'..msg.chat_id_)
t = "\n ⌯︙ قائمة المكتومين \n•━═━═━═「ɢᴏʟᴅ」═━═━═━•\n"
for k,v in pairs(list) do
local username = bot_data:get(ban_id.."user:Name" .. v)
if username then
t = t..""..k.."- ([@"..username.."])\n"
else
t = t..""..k.."- (`"..v.."`)\n"
end
end
if #list == 0 then
t = " ⌯︙ لا يوجد مكتومين"
end
send(msg.chat_id_, msg.id_, t)
end

if text == ("كتم") and msg.reply_to_message_id_ ~= 0 and Mod(msg) then
if AddChannel(msg.sender_user_id_) == false then
local textchuser = bot_data:get(ban_id..'text:ch:user')
if textchuser then
send(msg.chat_id_, msg.id_,'['..textchuser..']')
else
send(msg.chat_id_, msg.id_,' ⌯︙ لا تستطيع استخدام البوت \n ⌯︙  يرجى الاشتراك بالقناه اولا \n ⌯︙  اشترك هنا ['..bot_data:get(ban_id..'add:ch:username')..']')
end
return false
end
function start_function(extra, result, success)
if tonumber(result.sender_user_id_) == tonumber(ban_id) then  
send(msg.chat_id_, msg.id_, " ⌯︙ لا تسطيع كتم البوت ")
return false 
end
if Can_or_NotCan(result.sender_user_id_, msg.chat_id_) == true then
send(msg.chat_id_, msg.id_, '\n ⌯︙ عذرا لا تستطيع كتم ( '..Rutba(result.sender_user_id_,msg.chat_id_)..' )')
else
if msg.can_be_deleted_ == false then 
send(msg.chat_id_, msg.id_,' ⌯︙ البوت ليس ادمن يرجى ترقيتي !') 
return false  
end
bot_data:sadd(ban_id..'Muted:User'..msg.chat_id_, result.sender_user_id_)
tdcli_function ({ID = "GetUser",user_id_ = result.sender_user_id_},function(arg,data) 
usertext = '\n ⌯︙ الـعـضو   ⋖ ['..data.first_name_..'](t.me/'..(data.username_ or 'g_00_l_d')..')'
status  = '\n ⌯︙ تم كتمه'
send(msg.chat_id_, msg.id_, usertext..status)
end,nil)
end
end
tdcli_function ({ID = "GetMessage",chat_id_ = msg.chat_id_,message_id_ = tonumber(msg.reply_to_message_id_)}, start_function, nil)
return false
end
if text and text:match("^كتم @(.*)$") and Mod(msg) then
local username = text:match("^كتم @(.*)$")
if AddChannel(msg.sender_user_id_) == false then
local textchuser = bot_data:get(ban_id..'text:ch:user')
if textchuser then
send(msg.chat_id_, msg.id_,'['..textchuser..']')
else
send(msg.chat_id_, msg.id_,' ⌯︙ لا تستطيع استخدام البوت \n ⌯︙  يرجى الاشتراك بالقناه اولا \n ⌯︙  اشترك هنا ['..bot_data:get(ban_id..'add:ch:username')..']')
end
return false
end
if msg.can_be_deleted_ == false then 
send(msg.chat_id_, msg.id_,' ⌯︙ البوت ليس ادمن يرجى ترقيتي !') 
return false  
end
function start_function(extra, result, success)
if result.id_ then
if tonumber(result.id_) == tonumber(ban_id) then  
send(msg.chat_id_, msg.id_, " ⌯︙ لا تسطيع كتم البوت ")
return false 
end
if Can_or_NotCan(result.id_, msg.chat_id_) == true then
send(msg.chat_id_, msg.id_, '\n ⌯︙ عذرا لا تستطيع كتم ( '..Rutba(result.id_,msg.chat_id_)..' )')
else
if (result and result.type_ and result.type_.ID == "ChannelChatInfo") then
send(msg.chat_id_,msg.id_," ⌯︙ عذرا عزيزي المستخدم هاذا معرف قناة يرجى استخدام الامر بصوره صحيحه !")   
return false 
end      
bot_data:sadd(ban_id..'Muted:User'..msg.chat_id_, result.id_)
usertext = '\n ⌯︙ الـعـضو   ⋖ ['..result.title_..'](t.me/'..(username or 'g_00_l_d')..')'
status  = '\n ⌯︙ تم كتمه'
texts = usertext..status
send(msg.chat_id_, msg.id_, texts)
end
else
send(msg.chat_id_, msg.id_, ' ⌯︙ لا يوجد حساب بهاذا المعرف')
end
end
tdcli_function ({ID = "SearchPublicChat",username_ = username}, start_function, nil)
return false
end
if text and text:match('^كتم (%d+) (.*)$') and tonumber(msg.reply_to_message_id_) ~= 0 and Mod(msg) then
local TextEnd = {string.match(text, "^(كتم) (%d+) (.*)$")}
function start_function(extra, result, success)
if TextEnd[3] == 'يوم' then
Time_Restrict = TextEnd[2]:match('(%d+)')
Time = Time_Restrict * 86400
end
if TextEnd[3] == 'ساعه' then
Time_Restrict = TextEnd[2]:match('(%d+)')
Time = Time_Restrict * 3600
end
if TextEnd[3] == 'دقيقه' then
Time_Restrict = TextEnd[2]:match('(%d+)')
Time = Time_Restrict * 60
end
TextEnd[3] = TextEnd[3]:gsub('دقيقه',"دقايق") 
TextEnd[3] = TextEnd[3]:gsub('ساعه',"ساعات") 
TextEnd[3] = TextEnd[3]:gsub("يوم","ايام") 
if Can_or_NotCan(result.sender_user_id_, msg.chat_id_) then
send(msg.chat_id_, msg.id_, "\n ⌯︙ عذرا لا تستطيع كتم ( "..Rutba(result.sender_user_id_,msg.chat_id_).." )")
else
tdcli_function ({ID = "GetUser",user_id_ = result.sender_user_id_},function(arg,data) 
usertext = '\n ⌯︙ الـعـضو   ⋖ ['..data.first_name_..'](t.me/'..(data.username_ or 'g_00_l_d')..')'
status  = '\n ⌯︙ تم كتم لمدة ~ { '..TextEnd[2]..' '..TextEnd[3]..'}'
send(msg.chat_id_, msg.id_, usertext..status)
end,nil)
https.request("https://api.telegram.org/bot"..token.."/restrictChatMember?chat_id="..msg.chat_id_.."&user_id="..result.sender_user_id_..'&until_date='..tonumber(msg.date_+Time))
end
end
tdcli_function ({ID = "GetMessage",chat_id_ = msg.chat_id_,message_id_ = tonumber(msg.reply_to_message_id_)}, start_function, nil)
return false
end

if text and text:match("^(وضع وقت التنظيف) (%d+)$") and BasicConstructor(msg) then
local GetDo = tonumber(text:match("(%d+)"))
bot_data:set(ban_id..':TiMsg:'..msg.chat_id_,GetDo) 
return send(msg.chat_id_, msg.id_,"⌯︙ تم وضع وقت التنظيف:( `"..GetDo.." `) ساعه")
end

if text and text:match('^كتم (%d+) (.*) @(.*)$') and Mod(msg) then
local TextEnd = {string.match(text, "^(كتم) (%d+) (.*) @(.*)$")}
function start_function(extra, result, success)
if result.id_ then
if (result and result.type_ and result.type_.ID == "ChannelChatInfo") then
send(msg.chat_id_,msg.id_," ⌯︙ عذرا عزيزي المستخدم هاذا معرف قناة يرجى استخدام الامر بصوره صحيحه !")   
return false 
end      
if TextEnd[3] == 'يوم' then
Time_Restrict = TextEnd[2]:match('(%d+)')
Time = Time_Restrict * 86400
end
if TextEnd[3] == 'ساعه' then
Time_Restrict = TextEnd[2]:match('(%d+)')
Time = Time_Restrict * 3600
end
if TextEnd[3] == 'دقيقه' then
Time_Restrict = TextEnd[2]:match('(%d+)')
Time = Time_Restrict * 60
end
TextEnd[3] = TextEnd[3]:gsub('دقيقه',"دقايق") 
TextEnd[3] = TextEnd[3]:gsub('ساعه',"ساعات") 
TextEnd[3] = TextEnd[3]:gsub("يوم","ايام") 
if Can_or_NotCan(result.id_, msg.chat_id_) then
send(msg.chat_id_, msg.id_, "\n ⌯︙ عذرا لا تستطيع كتم ( "..Rutba(result.id_,msg.chat_id_).." )")
else
usertext = '\n ⌯︙ الـعـضو   ⋖ ['..result.title_..'](t.me/'..(username or 'g_00_l_d')..')'
status  = '\n ⌯︙ تم كتم لمدة ~ { '..TextEnd[2]..' '..TextEnd[3]..'}'
texts = usertext..status
send(msg.chat_id_, msg.id_,texts)
https.request("https://api.telegram.org/bot"..token.."/restrictChatMember?chat_id="..msg.chat_id_.."&user_id="..result.id_..'&until_date='..tonumber(msg.date_+Time))
end
end
end
tdcli_function ({ID = "SearchPublicChat",username_ = TextEnd[4]}, start_function, nil)
return false
end
if text and text:match("^كتم (%d+)$") and Mod(msg) then
local userid = text:match("^كتم (%d+)$")
if AddChannel(msg.sender_user_id_) == false then
local textchuser = bot_data:get(ban_id..'text:ch:user')
if textchuser then
send(msg.chat_id_, msg.id_,'['..textchuser..']')
else
send(msg.chat_id_, msg.id_,' ⌯︙ لا تستطيع استخدام البوت \n ⌯︙  يرجى الاشتراك بالقناه اولا \n ⌯︙  اشترك هنا ['..bot_data:get(ban_id..'add:ch:username')..']')
end
return false
end
if tonumber(userid) == tonumber(ban_id) then  
send(msg.chat_id_, msg.id_, " ⌯︙ لا تسطيع كتم البوت ")
return false 
end
if Can_or_NotCan(userid, msg.chat_id_) == true then
send(msg.chat_id_, msg.id_, '\n ⌯︙ عذرا لا تستطيع كتم ( '..Rutba(userid,msg.chat_id_)..' )')
else
if msg.can_be_deleted_ == false then 
send(msg.chat_id_, msg.id_,' ⌯︙ البوت ليس ادمن يرجى ترقيتي !') 
return false  
end
bot_data:sadd(ban_id..'Muted:User'..msg.chat_id_, userid)
tdcli_function ({ID = "GetUser",user_id_ = userid},function(arg,data) 
if data.first_name_ then
usertext = '\n ⌯︙ الـعـضو   ⋖ ['..data.first_name_..'](t.me/'..(data.username_ or 'g_00_l_d')..')'
status  = '\n ⌯︙ تم كتمه'
send(msg.chat_id_, msg.id_, usertext..status)
else
usertext = '\n ⌯︙ الـعـضو   ⋖ '..userid..''
status  = '\n ⌯︙ تم كتمه'
send(msg.chat_id_, msg.id_, usertext..status)
end;end,nil)
end
return false
end
if text == ("الغاء كتم") and msg.reply_to_message_id_ and Mod(msg) then
if AddChannel(msg.sender_user_id_) == false then
local textchuser = bot_data:get(ban_id..'text:ch:user')
if textchuser then
send(msg.chat_id_, msg.id_,'['..textchuser..']')
else
send(msg.chat_id_, msg.id_,' ⌯︙ لا تستطيع استخدام البوت \n ⌯︙  يرجى الاشتراك بالقناه اولا \n ⌯︙  اشترك هنا ['..bot_data:get(ban_id..'add:ch:username')..']')
end
return false
end
function start_function(extra, result, success)
bot_data:srem(ban_id..'Muted:User'..msg.chat_id_, result.sender_user_id_)
tdcli_function ({ID = "GetUser",user_id_ = result.sender_user_id_},function(arg,data) 
usertext = '\n ⌯︙ الـعـضو   ⋖ ['..data.first_name_..'](t.me/'..(data.username_ or 'g_00_l_d')..')'
status  = '\n ⌯︙ تم الغاء كتمه'
send(msg.chat_id_, msg.id_, usertext..status)
end,nil)
end
tdcli_function ({ID = "GetMessage",chat_id_ = msg.chat_id_,message_id_ = tonumber(msg.reply_to_message_id_)}, start_function, nil)
return false
end
if text and text:match("^الغاء كتم @(.*)$") and Mod(msg) then
local username = text:match("^الغاء كتم @(.*)$")
if AddChannel(msg.sender_user_id_) == false then
local textchuser = bot_data:get(ban_id..'text:ch:user')
if textchuser then
send(msg.chat_id_, msg.id_,'['..textchuser..']')
else
send(msg.chat_id_, msg.id_,' ⌯︙ لا تستطيع استخدام البوت \n ⌯︙  يرجى الاشتراك بالقناه اولا \n ⌯︙  اشترك هنا ['..bot_data:get(ban_id..'add:ch:username')..']')
end
return false
end
function start_function(extra, result, success)
if result.id_ then
bot_data:srem(ban_id..'Muted:User'..msg.chat_id_, result.id_)
usertext = '\n ⌯︙ الـعـضو   ⋖ ['..result.title_..'](t.me/'..(username or 'g_00_l_d')..')'
status  = '\n ⌯︙ تم الغاء كتمه'
texts = usertext..status
else
texts = ' ⌯︙ لا يوجد حساب بهاذا المعرف'
end
send(msg.chat_id_, msg.id_, texts)
end
tdcli_function ({ID = "SearchPublicChat",username_ = username}, start_function, nil)
return false
end

if text and text:match("^الغاء كتم (%d+)$") and Mod(msg) then
local userid = text:match("^الغاء كتم (%d+)$") 
if AddChannel(msg.sender_user_id_) == false then
local textchuser = bot_data:get(ban_id..'text:ch:user')
if textchuser then
send(msg.chat_id_, msg.id_,'['..textchuser..']')
else
send(msg.chat_id_, msg.id_,' ⌯︙ لا تستطيع استخدام البوت \n ⌯︙  يرجى الاشتراك بالقناه اولا \n ⌯︙  اشترك هنا ['..bot_data:get(ban_id..'add:ch:username')..']')
end
return false
end
bot_data:srem(ban_id..'Muted:User'..msg.chat_id_, userid)
tdcli_function ({ID = "GetUser",user_id_ = userid},function(arg,data) 
if data.first_name_ then
usertext = '\n ⌯︙ الـعـضو   ⋖ ['..data.first_name_..'](t.me/'..(data.username_ or 'g_00_l_d')..')'
status  = '\n ⌯︙ تم الغاء كتمه'
send(msg.chat_id_, msg.id_, usertext..status)
else
usertext = '\n ⌯︙ الـعـضو   ⋖ '..userid..''
status  = '\n ⌯︙ تم الغاء كتمه'
send(msg.chat_id_, msg.id_, usertext..status)
end;end,nil)
return false
end

if text == ("تقيد") and msg.reply_to_message_id_ and Mod(msg) then
if AddChannel(msg.sender_user_id_) == false then
local textchuser = bot_data:get(ban_id..'text:ch:user')
if textchuser then
send(msg.chat_id_, msg.id_,'['..textchuser..']')
else
send(msg.chat_id_, msg.id_,' ⌯︙ لا تستطيع استخدام البوت \n ??  يرجى الاشتراك بالقناه اولا \n ⌯︙  اشترك هنا ['..bot_data:get(ban_id..'add:ch:username')..']')
end
return false
end
function start_function(extra, result, success)
if tonumber(result.sender_user_id_) == tonumber(ban_id) then  
send(msg.chat_id_, msg.id_, " ⌯︙ لا تسطيع تقيد البوت ")
return false 
end
if Can_or_NotCan(result.sender_user_id_, msg.chat_id_) then
send(msg.chat_id_, msg.id_, '\n ⌯︙ عذرا لا تستطيع تقيد ( '..Rutba(result.sender_user_id_,msg.chat_id_)..' )')
else
https.request("https://api.telegram.org/bot"..token.."/restrictChatMember?chat_id="..msg.chat_id_.."&user_id="..result.sender_user_id_)
tdcli_function ({ID = "GetUser",user_id_ = result.sender_user_id_},function(arg,data) 
usertext = '\n ⌯︙ الـعـضو   ⋖ ['..data.first_name_..'](t.me/'..(data.username_ or 'g_00_l_d')..')'
status  = '\n ⌯︙ تم تقيده'
send(msg.chat_id_, msg.id_, usertext..status)
end,nil)
end
end
tdcli_function ({ID = "GetMessage",chat_id_ = msg.chat_id_,message_id_ = tonumber(msg.reply_to_message_id_)}, start_function, nil)
return false
end
------------------------------------------------------------------------
if text and text:match("^تقيد @(.*)$") and Mod(msg) then
local username = text:match("^تقيد @(.*)$")
if AddChannel(msg.sender_user_id_) == false then
local textchuser = bot_data:get(ban_id..'text:ch:user')
if textchuser then
send(msg.chat_id_, msg.id_,'['..textchuser..']')
else
send(msg.chat_id_, msg.id_,' ⌯︙ لا تستطيع استخدام البوت \n ⌯︙  يرجى الاشتراك بالقناه اولا \n ⌯︙  اشترك هنا ['..bot_data:get(ban_id..'add:ch:username')..']')
end
return false
end
function start_function(extra, result, success)
if result.id_ then
if tonumber(result.id_) == tonumber(ban_id) then  
send(msg.chat_id_, msg.id_, " ⌯︙ لا تسطيع تقيد البوت ")
return false 
end
if (result and result.type_ and result.type_.ID == "ChannelChatInfo") then
send(msg.chat_id_,msg.id_," ⌯︙ عذرا عزيزي المستخدم هاذا معرف قناة يرجى استخدام الامر بصوره صحيحه !")   
return false 
end      
if Can_or_NotCan(result.id_, msg.chat_id_) then
send(msg.chat_id_, msg.id_, '\n ⌯︙ عذرا لا تستطيع تقيد ( '..Rutba(result.id_,msg.chat_id_)..' )')
return false 
end      
https.request("https://api.telegram.org/bot"..token.."/restrictChatMember?chat_id="..msg.chat_id_.."&user_id="..result.id_)
 
usertext = '\n ⌯︙ الـعـضو   ⋖ ['..result.title_..'](t.me/'..(username or 'g_00_l_d')..')'
status  = '\n ⌯︙ تم تقيده'
texts = usertext..status
else
texts = ' ⌯︙ لا يوجد حساب بهاذا المعرف'
end
send(msg.chat_id_, msg.id_, texts)
end
tdcli_function ({ID = "SearchPublicChat",username_ = username}, start_function, nil)
return false
end

if text and text:match('^تقيد (%d+) (.*)$') and tonumber(msg.reply_to_message_id_) ~= 0 and Mod(msg) then
local TextEnd = {string.match(text, "^(تقيد) (%d+) (.*)$")}
function start_function(extra, result, success)
if TextEnd[3] == 'يوم' then
Time_Restrict = TextEnd[2]:match('(%d+)')
Time = Time_Restrict * 86400
end
if TextEnd[3] == 'ساعه' then
Time_Restrict = TextEnd[2]:match('(%d+)')
Time = Time_Restrict * 3600
end
if TextEnd[3] == 'دقيقه' then
Time_Restrict = TextEnd[2]:match('(%d+)')
Time = Time_Restrict * 60
end
TextEnd[3] = TextEnd[3]:gsub('دقيقه',"دقايق") 
TextEnd[3] = TextEnd[3]:gsub('ساعه',"ساعات") 
TextEnd[3] = TextEnd[3]:gsub("يوم","ايام") 
if Can_or_NotCan(result.sender_user_id_, msg.chat_id_) then
send(msg.chat_id_, msg.id_, "\n ⌯︙ عذرا لا تستطيع تقيد ( "..Rutba(result.sender_user_id_,msg.chat_id_).." )")
else
tdcli_function ({ID = "GetUser",user_id_ = result.sender_user_id_},function(arg,data) 
usertext = '\n ⌯︙ الـعـضو   ⋖ ['..data.first_name_..'](t.me/'..(data.username_ or 'g_00_l_d')..')'
status  = '\n ⌯︙ تم تقيده لمدة ~ { '..TextEnd[2]..' '..TextEnd[3]..'}'
send(msg.chat_id_, msg.id_, usertext..status)
end,nil)
https.request("https://api.telegram.org/bot"..token.."/restrictChatMember?chat_id="..msg.chat_id_.."&user_id="..result.sender_user_id_..'&until_date='..tonumber(msg.date_+Time))
end
end
tdcli_function ({ID = "GetMessage",chat_id_ = msg.chat_id_,message_id_ = tonumber(msg.reply_to_message_id_)}, start_function, nil)
return false
end


if text and text:match('^تقيد (%d+) (.*) @(.*)$') and Mod(msg) then
local TextEnd = {string.match(text, "^(تقيد) (%d+) (.*) @(.*)$")}
function start_function(extra, result, success)
if result.id_ then
if (result and result.type_ and result.type_.ID == "ChannelChatInfo") then
send(msg.chat_id_,msg.id_," ⌯︙ عذرا عزيزي المستخدم هاذا معرف قناة يرجى استخدام الامر بصوره صحيحه !")   
return false 
end      
if TextEnd[3] == 'يوم' then
Time_Restrict = TextEnd[2]:match('(%d+)')
Time = Time_Restrict * 86400
end
if TextEnd[3] == 'ساعه' then
Time_Restrict = TextEnd[2]:match('(%d+)')
Time = Time_Restrict * 3600
end
if TextEnd[3] == 'دقيقه' then
Time_Restrict = TextEnd[2]:match('(%d+)')
Time = Time_Restrict * 60
end
TextEnd[3] = TextEnd[3]:gsub('دقيقه',"دقايق") 
TextEnd[3] = TextEnd[3]:gsub('ساعه',"ساعات") 
TextEnd[3] = TextEnd[3]:gsub("يوم","ايام") 
if Can_or_NotCan(result.id_, msg.chat_id_) then
send(msg.chat_id_, msg.id_, "\n ⌯︙ عذرا لا تستطيع تقيد ( "..Rutba(result.id_,msg.chat_id_).." )")
else
usertext = '\n ⌯︙ الـعـضو   ⋖ ['..result.title_..'](t.me/'..(username or 'g_00_l_d')..')'
status  = '\n ⌯︙ تم تقيده لمدة ~ { '..TextEnd[2]..' '..TextEnd[3]..'}'
texts = usertext..status
send(msg.chat_id_, msg.id_,texts)
https.request("https://api.telegram.org/bot"..token.."/restrictChatMember?chat_id="..msg.chat_id_.."&user_id="..result.id_..'&until_date='..tonumber(msg.date_+Time))
end
end
end
tdcli_function ({ID = "SearchPublicChat",username_ = TextEnd[4]}, start_function, nil)
return false
end
------------------------------------------------------------------------
if text and text:match("^تقيد (%d+)$") and Mod(msg) then
local userid = text:match("^تقيد (%d+)$")
if AddChannel(msg.sender_user_id_) == false then
local textchuser = bot_data:get(ban_id..'text:ch:user')
if textchuser then
send(msg.chat_id_, msg.id_,'['..textchuser..']')
else
send(msg.chat_id_, msg.id_,' ⌯︙ لا تستطيع استخدام البوت \n ⌯︙  يرجى الاشتراك بالقناه اولا \n ⌯︙  اشترك هنا ['..bot_data:get(ban_id..'add:ch:username')..']')
end
return false
end
if tonumber(userid) == tonumber(ban_id) then  
send(msg.chat_id_, msg.id_, " ⌯︙ لا تسطيع تقيد البوت ")
return false 
end
if Can_or_NotCan(userid, msg.chat_id_) then
send(msg.chat_id_, msg.id_, '\n ⌯︙ عذرا لا تستطيع تقيد ( '..Rutba(userid,msg.chat_id_)..' )')
else
https.request("https://api.telegram.org/bot" .. token .. "/restrictChatMember?chat_id=" .. msg.chat_id_ .. "&user_id=" ..userid)
tdcli_function ({ID = "GetUser",user_id_ = userid},function(arg,data) 
if data.first_name_ then
usertext = '\n ⌯︙ الـعـضو   ⋖ ['..data.first_name_..'](t.me/'..(data.username_ or 'g_00_l_d')..')'
status  = '\n ⌯︙ تم تقيده'
send(msg.chat_id_, msg.id_, usertext..status)
else
usertext = '\n ⌯︙ الـعـضو   ⋖ '..userid..''
status  = '\n ⌯︙ تم تقيده'
send(msg.chat_id_, msg.id_, usertext..status)
end;end,nil)
end
return false
end
------------------------------------------------------------------------
if text == ("الغاء تقيد") and msg.reply_to_message_id_ and Mod(msg) then
if AddChannel(msg.sender_user_id_) == false then
local textchuser = bot_data:get(ban_id..'text:ch:user')
if textchuser then
send(msg.chat_id_, msg.id_,'['..textchuser..']')
else
send(msg.chat_id_, msg.id_,' ⌯︙ لا تستطيع استخدام البوت \n ⌯︙  يرجى الاشتراك بالقناه اولا \n ⌯︙  اشترك هنا ['..bot_data:get(ban_id..'add:ch:username')..']')
end
return false
end
function start_function(extra, result, success)
https.request("https://api.telegram.org/bot" .. token .. "/restrictChatMember?chat_id=" .. msg.chat_id_ .. "&user_id=" .. result.sender_user_id_ .. "&can_send_messages=True&can_send_media_messages=True&can_send_other_messages=True&can_add_web_page_previews=True")
tdcli_function ({ID = "GetUser",user_id_ = result.sender_user_id_},function(arg,data) 
usertext = '\n ⌯︙ الـعـضو   ⋖ ['..data.first_name_..'](t.me/'..(data.username_ or 'g_00_l_d')..')'
status  = '\n ⌯︙ تم الغاء تقيد'
send(msg.chat_id_, msg.id_, usertext..status)
end,nil)
end
tdcli_function ({ID = "GetMessage",chat_id_ = msg.chat_id_,message_id_ = tonumber(msg.reply_to_message_id_)}, start_function, nil)
return false
end
------------------------------------------------------------------------
if text and text:match("^الغاء تقيد @(.*)$") and Mod(msg) then
local username = text:match("^الغاء تقيد @(.*)$")
if AddChannel(msg.sender_user_id_) == false then
local textchuser = bot_data:get(ban_id..'text:ch:user')
if textchuser then
send(msg.chat_id_, msg.id_,'['..textchuser..']')
else
send(msg.chat_id_, msg.id_,' ⌯︙ لا تستطيع استخدام البوت \n ⌯︙  يرجى الاشتراك بالقناه اولا \n ⌯︙  اشترك هنا ['..bot_data:get(ban_id..'add:ch:username')..']')
end
return false
end
function start_function(extra, result, success)
if result.id_ then
https.request("https://api.telegram.org/bot" .. token .. "/restrictChatMember?chat_id=" .. msg.chat_id_ .. "&user_id=" .. result.id_ .. "&can_send_messages=True&can_send_media_messages=True&can_send_other_messages=True&can_add_web_page_previews=True")
usertext = '\n ⌯︙ الـعـضو   ⋖ ['..result.title_..'](t.me/'..(username or 'g_00_l_d')..')'
status  = '\n ⌯︙ تم الغاء تقيد'
texts = usertext..status
else
texts = ' ⌯︙ لا يوجد حساب بهاذا المعرف'
end
send(msg.chat_id_, msg.id_, texts)
end
tdcli_function ({ID = "SearchPublicChat",username_ = username}, start_function, nil)
return false
end
------------------------------------------------------------------------
if text and text:match("^الغاء تقيد (%d+)$") and Mod(msg) then
local userid = text:match("^الغاء تقيد (%d+)$")
if AddChannel(msg.sender_user_id_) == false then
local textchuser = bot_data:get(ban_id..'text:ch:user')
if textchuser then
send(msg.chat_id_, msg.id_,'['..textchuser..']')
else
send(msg.chat_id_, msg.id_,' ⌯︙ لا تستطيع استخدام البوت \n ⌯︙  يرجى الاشتراك بالقناه اولا \n ⌯︙  اشترك هنا ['..bot_data:get(ban_id..'add:ch:username')..']')
end
return false
end
https.request("https://api.telegram.org/bot" .. token .. "/restrictChatMember?chat_id=" .. msg.chat_id_ .. "&user_id=" ..userid.. "&can_send_messages=True&can_send_media_messages=True&can_send_other_messages=True&can_add_web_page_previews=True")
tdcli_function ({ID = "GetUser",user_id_ = userid},function(arg,data) 
if data.first_name_ then
usertext = '\n ⌯︙ الـعـضو   ⋖ ['..data.first_name_..'](t.me/'..(data.username_ or 'g_00_l_d')..')'
status  = '\n ⌯︙ تم الغاء تقيد'
send(msg.chat_id_, msg.id_, usertext..status)
else
usertext = '\n ⌯︙ الـعـضو   ⋖ '..userid..''
status  = '\n ⌯︙ تم الغاء تقيد'
send(msg.chat_id_, msg.id_, usertext..status)
end;end,nil)
return false
end
if text and text:match('^رفع القيود @(.*)') and Manager(msg) then 
local username = text:match('^رفع القيود @(.*)') 
if AddChannel(msg.sender_user_id_) == false then
local textchuser = bot_data:get(ban_id..'text:ch:user')
if textchuser then
send(msg.chat_id_, msg.id_,'['..textchuser..']')
else
send(msg.chat_id_, msg.id_,' ⌯︙ لا تستطيع استخدام البوت \n ⌯︙  يرجى الاشتراك بالقناه اولا \n ⌯︙  اشترك هنا ['..bot_data:get(ban_id..'add:ch:username')..']')
end
return false
end
function start_function(extra, result, success)
if result.id_ then
if Devban(msg) then
bot_data:srem(ban_id..'GDRG:User',result.id_)
bot_data:srem(ban_id..'DRG:User'..msg.chat_id_,result.id_)
bot_data:srem(ban_id..'Muted:User'..msg.chat_id_,result.id_)
bot_data:srem(ban_id..'Gmute:User'..msg.chat_id_,result.id_)
usertext = '\n ⌯︙ الـعـضو   ⋖ ['..result.title_..'](t.me/'..(username or 'g_00_l_d')..')'
status  = '\n ⌯︙ تم الغاء جميع القيود'
texts = usertext..status
send(msg.chat_id_, msg.id_,texts)
else
bot_data:srem(ban_id..'DRG:User'..msg.chat_id_,result.id_)
bot_data:srem(ban_id..'Muted:User'..msg.chat_id_,result.id_)
usertext = '\n ⌯︙ الـعـضو   ⋖ ['..result.title_..'](t.me/'..(username or 'g_00_l_d')..')'
status  = '\n ⌯︙ تم الغاء جميع القيود'
texts = usertext..status
send(msg.chat_id_, msg.id_,texts)
end
else
Text = ' ⌯︙ المعرف غلط'
send(msg.chat_id_, msg.id_,Text)
end
end
tdcli_function ({ID = "SearchPublicChat",username_ = username}, start_function, nil)
end
if text == "رفع القيود" and Manager(msg) then
if AddChannel(msg.sender_user_id_) == false then
local textchuser = bot_data:get(ban_id..'text:ch:user')
if textchuser then
send(msg.chat_id_, msg.id_,'['..textchuser..']')
else
send(msg.chat_id_, msg.id_,' ⌯︙ لا تستطيع استخدام البوت \n ⌯︙  يرجى الاشتراك بالقناه اولا \n ⌯︙  اشترك هنا ['..bot_data:get(ban_id..'add:ch:username')..']')
end
return false
end
function start_function(extra, result, success)
if Devban(msg) then
bot_data:srem(ban_id..'GDRG:User',result.sender_user_id_)
bot_data:srem(ban_id..'DRG:User'..msg.chat_id_,result.sender_user_id_)
bot_data:srem(ban_id..'Muted:User'..msg.chat_id_,result.sender_user_id_)
tdcli_function ({ID = "GetUser",user_id_ = result.sender_user_id_},function(arg,data) 
usertext = '\n ⌯︙ الـعـضو   ⋖ ['..data.first_name_..'](t.me/'..(data.username_ or 'g_00_l_d')..')'
status  = '\n ⌯︙ تم الغاء جميع القيود'
send(msg.chat_id_, msg.id_, usertext..status)
end,nil)
else
bot_data:srem(ban_id..'DRG:User'..msg.chat_id_,result.sender_user_id_)
bot_data:srem(ban_id..'Muted:User'..msg.chat_id_,result.sender_user_id_)
tdcli_function ({ID = "GetUser",user_id_ = result.sender_user_id_},function(arg,data) 
usertext = '\n ⌯︙ الـعـضو   ⋖ ['..data.first_name_..'](t.me/'..(data.username_ or 'textchuser')..')'
status  = '\n ⌯︙ تم الغاء جميع القيود'
send(msg.chat_id_, msg.id_, usertext..status)
end,nil)
end
end
tdcli_function ({ID = "GetMessage",chat_id_ = msg.chat_id_,message_id_ = tonumber(msg.reply_to_message_id_)}, start_function, nil)
end
if text and text:match('^كشف القيود @(.*)') and Manager(msg) then 
local username = text:match('^كشف القيود @(.*)') 
if AddChannel(msg.sender_user_id_) == false then
local textchuser = bot_data:get(ban_id..'text:ch:user')
if textchuser then
send(msg.chat_id_, msg.id_,'['..textchuser..']')
else
send(msg.chat_id_, msg.id_,' ⌯︙ لا تستطيع استخدام البوت \n ⌯︙  يرجى الاشتراك بالقناه اولا \n ⌯︙  اشترك هنا ['..bot_data:get(ban_id..'add:ch:username')..']')
end
return false
end
function start_function(extra, result, success)
if result.id_ then
if bot_data:sismember(ban_id..'Muted:User'..msg.chat_id_,result.id_) then
Muted = 'مكتوم'
else
Muted = 'غير مكتوم'
end
if bot_data:sismember(ban_id..'DRG:User'..msg.chat_id_,result.id_) then
DRG = 'محظور'
else
DRG = 'غير محظور'
end
if bot_data:sismember(ban_id..'GDRG:User',result.id_) then
GDRG = 'محظور عام'
else
GDRG = 'غير محظور عام'
end
Textt = " ⌯︙ الحظر العام  ⋖ "..GDRG.."\n ⌯︙ الحظر  ⋖ "..DRG.."\n ⌯︙ الكتم  ⋖ "..Muted..""
send(msg.chat_id_, msg.id_,Textt)
else
Text = ' ⌯︙ المعرف غلط'
send(msg.chat_id_, msg.id_,Text)
end
end
tdcli_function ({ID = "SearchPublicChat",username_ = username}, start_function, nil)
end

if text == "كشف القيود" and Manager(msg) then 
if AddChannel(msg.sender_user_id_) == false then
local textchuser = bot_data:get(ban_id..'text:ch:user')
if textchuser then
send(msg.chat_id_, msg.id_,'['..textchuser..']')
else
send(msg.chat_id_, msg.id_,' ⌯︙ لا تستطيع استخدام البوت \n ⌯︙  يرجى الاشتراك بالقناه اولا \n ⌯︙  اشترك هنا ['..bot_data:get(ban_id..'add:ch:username')..']')
end
return false
end
function start_function(extra, result, success)
if bot_data:sismember(ban_id..'Muted:User'..msg.chat_id_,result.sender_user_id_) then
Muted = 'مكتوم'
else
Muted = 'غير مكتوم'
end
if bot_data:sismember(ban_id..'DRG:User'..msg.chat_id_,result.sender_user_id_) then
DRG = 'محظور'
else
DRG = 'غير محظور'
end
if bot_data:sismember(ban_id..'GDRG:User',result.sender_user_id_) then
GDRG = 'محظور عام'
else
GDRG = 'غير محظور عام'
end
if bot_data:sismember(ban_id..'Gmute:User',result.sender_user_id_) then
Gmute = 'محظور عام'
else
Gmute = 'غير محظور عام'
end
Textt = " ⌯︙ الحظر العام  ⋖ "..GDRG.."\n ⌯︙ الكتم العام  ⋖ "..Gmute.."\n ⌯︙ الحظر  ⋖ "..DRG.."\n ⌯︙ الكتم  ⋖ "..Muted..""
send(msg.chat_id_, msg.id_,Textt)
end
tdcli_function ({ID = "GetMessage",chat_id_ = msg.chat_id_,message_id_ = tonumber(msg.reply_to_message_id_)}, start_function, nil)
end
if text == ("رفع مشرف") and msg.reply_to_message_id_ ~= 0 and Constructor(msg) then
function start_function(extra, result, success)
https.request("https://api.telegram.org/bot" .. token .. "/promoteChatMember?chat_id=" .. msg.chat_id_ .. "&user_id=" ..result.sender_user_id_.."&can_invite_users=True")
local Text = "⌯︙ تم ترقيته مشرف"
keyboard = {} 
keyboard.inline_keyboard = {
{
{text = 'تعديل الصلاحيات', callback_data='amr@'..msg.sender_user_id_..'/user@'..result.sender_user_id_.."/setiinginfo"}
},
}
local msg_id = msg.id_/2097152/0.5
https.request("https://api.telegram.org/bot"..token..'/sendMessage?chat_id=' .. msg.chat_id_ .. '&text=' .. URL.escape(Text).."&reply_to_message_id="..msg_id.."&parse_mode=markdown&disable_web_page_preview=true&reply_markup="..JSON.encode(keyboard))
end
tdcli_function ({ID = "GetMessage",chat_id_ = msg.chat_id_,message_id_ = tonumber(msg.reply_to_message_id_)}, start_function, nil)
return false
end
if text and text:match("^رفع مشرف @(.*)$") and Constructor(msg) then
local username = text:match("^رفع مشرف @(.*)$")
function start_function(extra, result, success)
if result.id_ then
if (result and result.type_ and result.type_.ID == "ChannelChatInfo") then
send(msg.chat_id_,msg.id_,"⌯︙ عذرا عزيزي المستخدم هاذا معرف قناة يرجى استخدام الامر بصوره صحيحه !")   
return false 
end
https.request("https://api.telegram.org/bot" .. token .. "/promoteChatMember?chat_id=" .. msg.chat_id_ .. "&user_id=" ..result.id_.."&can_invite_users=True")
local Text = "⌯︙ تم ترقيته مشرف"
keyboard = {} 
keyboard.inline_keyboard = {
{
{text = 'تعديل الصلاحيات', callback_data='amr@'..msg.sender_user_id_..'/user@'..result.id_.."/setiinginfo"}
},
}
local msg_id = msg.id_/2097152/0.5
https.request("https://api.telegram.org/bot"..token..'/sendMessage?chat_id=' .. msg.chat_id_ .. '&text=' .. URL.escape(Text).."&reply_to_message_id="..msg_id.."&parse_mode=markdown&disable_web_page_preview=true&reply_markup="..JSON.encode(keyboard))
else
send(msg.chat_id_, msg.id_,"⌯︙ لا يوجد حساب بهاذا المعرف")
end
end
tdcli_function ({ID = "GetMessage",chat_id_ = msg.chat_id_,message_id_ = tonumber(msg.reply_to_message_id_)}, start_function, nil)
return false
end
if text == ("تنزيل مشرف") and msg.reply_to_message_id_ ~= 0 and Constructor(msg) then
function start_function(extra, result, success)
if msg.can_be_deleted_ == false then 
send(msg.chat_id_, msg.id_,' ⌯︙ البوت ليس ادمن يرجى ترقيتي !') 
return false  
end
tdcli_function ({ID = "GetUser",user_id_ = result.sender_user_id_},function(arg,data) 
usertext = '\n ⌯︙  الـعـضو   ⋖ ['..data.first_name_..'](t.me/'..(data.username_ or 'g_00_l_d')..')'
status  = '\n ⌯︙  الايدي  ⋖ `'..result.sender_user_id_..'`\n ⌯︙  تم تنزيله ادمن من الجروب'
send(msg.chat_id_, msg.id_, usertext..status)
https.request("https://api.telegram.org/bot"..token.."/promoteChatMember?chat_id=" .. msg.chat_id_ .. "&user_id=" ..result.sender_user_id_.."&can_change_info=false&can_delete_messages=false&can_invite_users=false&can_restrict_members=false&can_pin_messages=false&can_promote_members=false")
end,nil)
end
tdcli_function ({ID = "GetMessage",chat_id_ = msg.chat_id_,message_id_ = tonumber(msg.reply_to_message_id_)}, start_function, nil)
return false
end
if text and text:match("^تنزيل مشرف @(.*)$") and Constructor(msg) then
local username = text:match("^تنزيل مشرف @(.*)$")
if msg.can_be_deleted_ == false then 
send(msg.chat_id_, msg.id_,' ⌯︙ البوت ليس ادمن يرجى ترقيتي !') 
return false  
end
function start_function(extra, result, success)
if result.id_ then
if (result and result.type_ and result.type_.ID == "ChannelChatInfo") then
send(msg.chat_id_,msg.id_," ⌯︙  عذرا عزيزي المستخدم هاذا معرف قناة يرجى استخدام الامر بصوره صحيحه !")   
return false 
end      
usertext = '\n ⌯︙  الـعـضو   ⋖ ['..result.title_..'](t.me/'..(username or 'g_00_l_d')..')'
status  = '\n ⌯︙  تم تنزيله ادمن من الجروب'
texts = usertext..status
send(msg.chat_id_, msg.id_, texts)
https.request("https://api.telegram.org/bot"..token.."/promoteChatMember?chat_id=" .. msg.chat_id_ .. "&user_id=" ..result.id_.."&can_change_info=false&can_delete_messages=false&can_invite_users=false&can_restrict_members=false&can_pin_messages=false&can_promote_members=false")
else
send(msg.chat_id_, msg.id_, '⚠¦ لا يوجد حساب بهاذا المعرف')
end
end
tdcli_function ({ID = "SearchPublicChat",username_ = username}, start_function, nil)
return false
end



----------------------------------------- انتهاء كشف المجموعة
if text == 'الاعدادات' and Mod(msg) then    
if bot_data:get(ban_id..'lockpin'..msg.chat_id_) then    
lock_pin = '✓'
else 
lock_pin = '✘'    
end
if bot_data:get(ban_id..'lock:tagservr'..msg.chat_id_) then    
lock_tagservr = '✓'
else 
lock_tagservr = '✘'    
end
if bot_data:get(ban_id..'lock:text'..msg.chat_id_) then    
lock_text = '✓'
else 
lock_text = '✘'    
end
if bot_data:get(ban_id.."lock:AddMempar"..msg.chat_id_) == 'kick' then
lock_add = '✓'
else 
lock_add = '✘'    
end    
if bot_data:get(ban_id.."lock:Join"..msg.chat_id_) == 'kick' then
lock_join = '✓'
else 
lock_join = '✘'    
end    
if bot_data:get(ban_id..'lock:edit'..msg.chat_id_) then    
lock_edit = '✓'
else 
lock_edit = '✘'    
end
print(welcome)
if bot_data:get(ban_id..'Get:Welcome:Group'..msg.chat_id_) then
welcome = '✓'
else 
welcome = '✘'    
end
if bot_data:get(ban_id..'lock:edit'..msg.chat_id_) then    
lock_edit_med = '✓'
else 
lock_edit_med = '✘'    
end
if bot_data:hget(ban_id.."flooding:settings:"..msg.chat_id_, "flood") == "kick" then     
flood = 'بالطرد'     
elseif bot_data:hget(ban_id.."flooding:settings:"..msg.chat_id_,"flood") == "keed" then     
flood = 'بالتقيد'     
elseif bot_data:hget(ban_id.."flooding:settings:"..msg.chat_id_,"flood") == "mute" then     
flood = 'بالكتم'           
elseif bot_data:hget(ban_id.."flooding:settings:"..msg.chat_id_,"flood") == "del" then     
flood = 'بالمسح'           
else     
flood = '✘'     
end
if bot_data:get(ban_id.."lock:Photo"..msg.chat_id_) == "del" then
lock_photo = '✓' 
elseif bot_data:get(ban_id.."lock:Photo"..msg.chat_id_) == "ked" then 
lock_photo = 'بالتقيد'   
elseif bot_data:get(ban_id.."lock:Photo"..msg.chat_id_) == "ktm" then 
lock_photo = 'بالكتم'    
elseif bot_data:get(ban_id.."lock:Photo"..msg.chat_id_) == "kick" then 
lock_photo = 'بالطرد'   
else
lock_photo = '✘'   
end    
if bot_data:get(ban_id.."lock:Contact"..msg.chat_id_) == "del" then
lock_phon = '✓' 
elseif bot_data:get(ban_id.."lock:Contact"..msg.chat_id_) == "ked" then 
lock_phon = 'بالتقيد'    
elseif bot_data:get(ban_id.."lock:Contact"..msg.chat_id_) == "ktm" then 
lock_phon = 'بالكتم'    
elseif bot_data:get(ban_id.."lock:Contact"..msg.chat_id_) == "kick" then 
lock_phon = 'بالطرد'    
else
lock_phon = '✘'    
end    
if bot_data:get(ban_id.."lock:Link"..msg.chat_id_) == "del" then
lock_links = '✓'
elseif bot_data:get(ban_id.."lock:Link"..msg.chat_id_) == "ked" then
lock_links = 'بالتقيد'    
elseif bot_data:get(ban_id.."lock:Link"..msg.chat_id_) == "ktm" then
lock_links = 'بالكتم'    
elseif bot_data:get(ban_id.."lock:Link"..msg.chat_id_) == "kick" then
lock_links = 'بالطرد'    
else
lock_links = '✘'    
end
if bot_data:get(ban_id.."lock:Cmd"..msg.chat_id_) == "del" then
lock_cmds = '✓'
elseif bot_data:get(ban_id.."lock:Cmd"..msg.chat_id_) == "ked" then
lock_cmds = 'بالتقيد'    
elseif bot_data:get(ban_id.."lock:Cmd"..msg.chat_id_) == "ktm" then
lock_cmds = 'بالكتم'   
elseif bot_data:get(ban_id.."lock:Cmd"..msg.chat_id_) == "kick" then
lock_cmds = 'بالطرد'    
else
lock_cmds = '✘'    
end
if bot_data:get(ban_id.."lock:user:name"..msg.chat_id_) == "del" then
lock_user = '✓'
elseif bot_data:get(ban_id.."lock:user:name"..msg.chat_id_) == "ked" then
lock_user = 'بالتقيد'    
elseif bot_data:get(ban_id.."lock:user:name"..msg.chat_id_) == "ktm" then
lock_user = 'بالكتم'    
elseif bot_data:get(ban_id.."lock:user:name"..msg.chat_id_) == "kick" then
lock_user = 'بالطرد'    
else
lock_user = '✘'    
end
if bot_data:get(ban_id.."lock:hashtak"..msg.chat_id_) == "del" then
lock_hash = '✓'
elseif bot_data:get(ban_id.."lock:hashtak"..msg.chat_id_) == "ked" then 
lock_hash = 'بالتقيد'    
elseif bot_data:get(ban_id.."lock:hashtak"..msg.chat_id_) == "ktm" then 
lock_hash = 'بالكتم'    
elseif bot_data:get(ban_id.."lock:hashtak"..msg.chat_id_) == "kick" then 
lock_hash = 'بالطرد'    
else
lock_hash = '✘'    
end
if bot_data:get(ban_id.."lock:vico"..msg.chat_id_) == "del" then
lock_muse = '✓'
elseif bot_data:get(ban_id.."lock:vico"..msg.chat_id_) == "ked" then 
lock_muse = 'بالتقيد'    
elseif bot_data:get(ban_id.."lock:vico"..msg.chat_id_) == "ktm" then 
lock_muse = 'بالكتم'    
elseif bot_data:get(ban_id.."lock:vico"..msg.chat_id_) == "kick" then 
lock_muse = 'بالطرد'    
else
lock_muse = '✘'    
end 
if bot_data:get(ban_id.."lock:Video"..msg.chat_id_) == "del" then
lock_ved = '✓'
elseif bot_data:get(ban_id.."lock:Video"..msg.chat_id_) == "ked" then 
lock_ved = 'بالتقيد'    
elseif bot_data:get(ban_id.."lock:Video"..msg.chat_id_) == "ktm" then 
lock_ved = 'بالكتم'    
elseif bot_data:get(ban_id.."lock:Video"..msg.chat_id_) == "kick" then 
lock_ved = 'بالطرد'    
else
lock_ved = '✘'    
end
if bot_data:get(ban_id.."lock:Animation"..msg.chat_id_) == "del" then
lock_gif = '✓'
elseif bot_data:get(ban_id.."lock:Animation"..msg.chat_id_) == "ked" then 
lock_gif = 'بالتقيد'    
elseif bot_data:get(ban_id.."lock:Animation"..msg.chat_id_) == "ktm" then 
lock_gif = 'بالكتم'    
elseif bot_data:get(ban_id.."lock:Animation"..msg.chat_id_) == "kick" then 
lock_gif = 'بالطرد'    
else
lock_gif = '✘'    
end
if bot_data:get(ban_id.."lock:Sticker"..msg.chat_id_) == "del" then
lock_ste = '✓'
elseif bot_data:get(ban_id.."lock:Sticker"..msg.chat_id_) == "ked" then 
lock_ste = 'بالتقيد'    
elseif bot_data:get(ban_id.."lock:Sticker"..msg.chat_id_) == "ktm" then 
lock_ste = 'بالكتم'    
elseif bot_data:get(ban_id.."lock:Sticker"..msg.chat_id_) == "kick" then 
lock_ste = 'بالطرد'    
else
lock_ste = '✘'    
end
if bot_data:get(ban_id.."lock:geam"..msg.chat_id_) == "del" then
lock_geam = '✓'
elseif bot_data:get(ban_id.."lock:geam"..msg.chat_id_) == "ked" then 
lock_geam = 'بالتقيد'    
elseif bot_data:get(ban_id.."lock:geam"..msg.chat_id_) == "ktm" then 
lock_geam = 'بالكتم'    
elseif bot_data:get(ban_id.."lock:geam"..msg.chat_id_) == "kick" then 
lock_geam = 'بالطرد'    
else
lock_geam = '✘'    
end    
if bot_data:get(ban_id.."lock:vico"..msg.chat_id_) == "del" then
lock_vico = '✓'
elseif bot_data:get(ban_id.."lock:vico"..msg.chat_id_) == "ked" then 
lock_vico = 'بالتقيد'    
elseif bot_data:get(ban_id.."lock:vico"..msg.chat_id_) == "ktm" then 
lock_vico = 'بالكتم'    
elseif bot_data:get(ban_id.."lock:vico"..msg.chat_id_) == "kick" then 
lock_vico = 'بالطرد'    
else
lock_vico = '✘'    
end    
if bot_data:get(ban_id.."lock:Keyboard"..msg.chat_id_) == "del" then
lock_inlin = '✓'
elseif bot_data:get(ban_id.."lock:Keyboard"..msg.chat_id_) == "ked" then 
lock_inlin = 'بالتقيد'
elseif bot_data:get(ban_id.."lock:Keyboard"..msg.chat_id_) == "ktm" then 
lock_inlin = 'بالكتم'    
elseif bot_data:get(ban_id.."lock:Keyboard"..msg.chat_id_) == "kick" then 
lock_inlin = 'بالطرد'
else
lock_inlin = '✘'
end
if bot_data:get(ban_id.."lock:forward"..msg.chat_id_) == "del" then
lock_fwd = '✓'
elseif bot_data:get(ban_id.."lock:forward"..msg.chat_id_) == "ked" then 
lock_fwd = 'بالتقيد'    
elseif bot_data:get(ban_id.."lock:forward"..msg.chat_id_) == "ktm" then 
lock_fwd = 'بالكتم'    
elseif bot_data:get(ban_id.."lock:forward"..msg.chat_id_) == "kick" then 
lock_fwd = 'بالطرد'    
else
lock_fwd = '✘'    
end    
if bot_data:get(ban_id.."lock:Document"..msg.chat_id_) == "del" then
lock_file = '✓'
elseif bot_data:get(ban_id.."lock:Document"..msg.chat_id_) == "ked" then 
lock_file = 'بالتقيد'    
elseif bot_data:get(ban_id.."lock:Document"..msg.chat_id_) == "ktm" then 
lock_file = 'بالكتم'    
elseif bot_data:get(ban_id.."lock:Document"..msg.chat_id_) == "kick" then 
lock_file = 'بالطرد'    
else
lock_file = '✘'    
end    
if bot_data:get(ban_id.."lock:Unsupported"..msg.chat_id_) == "del" then
lock_self = '✓'
elseif bot_data:get(ban_id.."lock:Unsupported"..msg.chat_id_) == "ked" then 
lock_self = 'بالتقيد'    
elseif bot_data:get(ban_id.."lock:Unsupported"..msg.chat_id_) == "ktm" then 
lock_self = 'بالكتم'    
elseif bot_data:get(ban_id.."lock:Unsupported"..msg.chat_id_) == "kick" then 
lock_self = 'بالطرد'    
else
lock_self = '✘'    
end
if bot_data:get(ban_id.."lock:Bot:kick"..msg.chat_id_) == 'del' then
lock_bots = '✓'
elseif bot_data:get(ban_id.."lock:Bot:kick"..msg.chat_id_) == 'ked' then
lock_bots = 'بالتقيد'   
elseif bot_data:get(ban_id.."lock:Bot:kick"..msg.chat_id_) == 'kick' then
lock_bots = 'بالطرد'    
else
lock_bots = '✘'    
end
if bot_data:get(ban_id.."lock:Markdaun"..msg.chat_id_) == "del" then
lock_mark = '✓'
elseif bot_data:get(ban_id.."lock:Markdaun"..msg.chat_id_) == "ked" then 
lock_mark = 'بالتقيد'    
elseif bot_data:get(ban_id.."lock:Markdaun"..msg.chat_id_) == "ktm" then 
lock_mark = 'بالكتم'    
elseif bot_data:get(ban_id.."lock:Markdaun"..msg.chat_id_) == "kick" then 
lock_mark = 'بالطرد'    
else
lock_mark = '✘'    
end
if bot_data:get(ban_id.."lock:Spam"..msg.chat_id_) == "del" then    
lock_spam = '✓'
elseif bot_data:get(ban_id.."lock:Spam"..msg.chat_id_) == "ked" then 
lock_spam = 'بالتقيد'    
elseif bot_data:get(ban_id.."lock:Spam"..msg.chat_id_) == "ktm" then 
lock_spam = 'بالكتم'    
elseif bot_data:get(ban_id.."lock:Spam"..msg.chat_id_) == "kick" then 
lock_spam = 'بالطرد'    
else
lock_spam = '✘'    
end        
if not bot_data:get(ban_id..'Reply:Manager'..msg.chat_id_) then
rdmder = '✓'
else
rdmder = '✘'
end
if not bot_data:get(ban_id..'Reply:Sudo'..msg.chat_id_) then
rdsudo = '✓'
else
rdsudo = '✘'
end
if not bot_data:get(ban_id..'Bot:Id'..msg.chat_id_)  then
idgp = '✓'
else
idgp = '✘'
end
if not bot_data:get(ban_id..'Bot:Id:Photo'..msg.chat_id_) then
idph = '✓'
else
idph = '✘'
end
if not bot_data:get(ban_id..'Lock:kick'..msg.chat_id_)  then
setadd = '✓'
else
setadd = '✘'
end
if not bot_data:get(ban_id..'Lock:Add:Bot'..msg.chat_id_)  then
DRGm = '✓'
else
DRGm = '✘'
end
if not bot_data:get(ban_id..'Added:Me'..msg.chat_id_) then
addme = '✓'
else
addme = '✘'
end
if not bot_data:get(ban_id..'Seh:User'..msg.chat_id_) then
sehuser = '✓'
else
sehuser = '✘'
end
if not bot_data:get(ban_id..'Cick:Me'..msg.chat_id_) then
kickme = '✓'
else
kickme = '✘'
end
NUM_MSG_MAX = bot_data:hget(ban_id.."flooding:settings:"..msg.chat_id_,"floodmax") or 0
local text = 
'\n•━═━═━═「ɢᴏʟᴅ」═━═━═━•'..
'\n ⌯︙ اعدادات الجروب كتالي √↓'..
'\n•━═━═━═「ɢᴏʟᴅ」═━═━═━•'..
'\n ⌯︙  علامة ال {✓} تعني مفعل'..
'\n ⌯︙  علامة ال {✘} تعني معطل'..
'\n•━═━═━═「ɢᴏʟᴅ」═━═━═━•'..
'\n ⌯︙  الروابط  ⋖ { '..lock_links..
' }\n'..' ⌯︙  المعرفات  ⋖ { '..lock_user..
' }\n'..' ⌯︙  التاك  ⋖ { '..lock_hash..
' }\n'..' ⌯︙  البوتات  ⋖ { '..lock_bots..
' }\n'..' ⌯︙  التوجيه  ⋖ { '..lock_fwd..
' }\n'..' ⌯︙  التثبيت  ⋖ { '..lock_pin..
' }\n'..' ⌯︙  الاشعارات  ⋖ { '..lock_tagservr..
' }\n'..' ⌯︙  الماركدون  ⋖ { '..lock_mark..
' }\n'..' ⌯︙  التعديل  ⋖ { '..lock_edit..
' }\n'..' ⌯︙  تعديل الميديا  ⋖ { '..lock_edit_med..
' }\n•━═━═━═「ɢᴏʟᴅ」═━═━═━•'..
'\n'..' ⌯︙  الكلايش  ⋖ { '..lock_spam..
' }\n'..' ⌯︙  الكيبورد  ⋖ { '..lock_inlin..
' }\n'..' ⌯︙  الاغاني  ⋖ { '..lock_vico..
' }\n'..' ⌯︙  المتحركه  ⋖ { '..lock_gif..
' }\n'..' ⌯︙  الملفات  ⋖ { '..lock_file..
' }\n'..' ⌯︙  الدردشه  ⋖ { '..lock_text..
' }\n'..' ⌯︙   الفيديو  ⋖ { '..lock_ved..
' }\n'..' ⌯︙   الصور  ⋖ { '..lock_photo..
' }\n•━═━═━═「ɢᴏʟᴅ」═━═━═━•'..
'\n'..' ⌯︙   الصوت  ⋖ { '..lock_muse..
' }\n'..' ⌯︙  الملصقات  ⋖ { '..lock_ste..
' }\n'..' ⌯︙  الجهات  ⋖ { '..lock_phon..
' }\n'..' ⌯︙  الدخول  ⋖ { '..lock_join..
' }\n'..' ⌯︙  الاضافه  ⋖ { '..lock_add..
' }\n'..' ⌯︙  السيلفي  ⋖ { '..lock_self..
' }\n'..' ⌯︙  الالعاب  ⋖ { '..lock_geam..
' }\n'..' ⌯︙  التكرار  ⋖ { '..flood..
' }\n'..' ⌯︙  الترحيب  ⋖ { '..welcome..
' }\n'..' ⌯︙  عدد التكرار  ⋖ { '..NUM_MSG_MAX..
' }\n•━═━═━═「ɢᴏʟᴅ」═━═━═━•'..
'\n ⌯︙  علامة ال {✓} تعني مفعل'..
'\n ⌯︙  علامة ال {✘} تعني معطل'..
'\n•━═━═━═「ɢᴏʟᴅ」═━═━═━•'..
'\n'..' ⌯︙  امر صيح  ⋖ { '..kickme..
' }\n'..' ⌯︙  امر اطردني  ⋖ { '..sehuser..
' }\n'..' ⌯︙  امر مين ضافك  ⋖ { '..addme..
' }\n'..' ⌯︙  الردود  ⋖ { '..rdmder..
' }\n'..' ⌯︙  الردود العامه  ⋖ { '..rdsudo..
' }\n'..' ⌯︙  الايدي  ⋖ { '..idgp..
' }\n'..' ⌯︙  الايدي بالصوره  ⋖ { '..idph..
' }\n'..' ⌯︙  الرفع  ⋖ { '..setadd..
' }\n'..' ⌯︙  الحظر  ⋖ { '..DRGm..' }\n\n•━═━═━═「ɢᴏʟᴅ」═━═━═━•\n ⌯︙ قناة سورس جولد↓\n━━━━━━━\n'
keyboard = {} 
keyboard.inline_keyboard = {{{text = 'اخفاء الاوامر', callback_data="/hide"}},}
https.request("https://api.telegram.org/bot"..token..'/sendmessage?chat_id=' .. msg.chat_id_ .. '&text=' .. URL.escape(text).."&reply_to_message_id=markdown&reply_markup="..JSON.encode(keyboard)) 
end
if text ==('تثبيت') and msg.reply_to_message_id_ ~= 0 and Mod(msg) then  
if AddChannel(msg.sender_user_id_) == false then
local textchuser = bot_data:get(ban_id..'text:ch:user')
if textchuser then
send(msg.chat_id_, msg.id_,'['..textchuser..']')
else
send(msg.chat_id_, msg.id_,' ⌯︙ لا تستطيع استخدام البوت \n ⌯︙  يرجى الاشتراك بالقناه اولا \n ⌯︙  اشترك هنا ['..bot_data:get(ban_id..'add:ch:username')..']')
end
return false
end
if bot_data:sismember(ban_id..'lock:pin',msg.chat_id_) and not Constructor(msg) then
send(msg.chat_id_,msg.id_," ⌯︙ عذرآ تم قفل التثبيت")  
return false  
end
tdcli_function ({ID = "PinChannelMessage",channel_id_ = msg.chat_id_:gsub('-100',''),message_id_ = msg.reply_to_message_id_,disable_notification_ = 1},function(arg,data) 
if data.ID == "Ok" then
send(msg.chat_id_, msg.id_," ⌯︙ تم تثبيت الرساله")   
bot_data:set(ban_id..'Pin:Id:Msg'..msg.chat_id_,msg.reply_to_message_id_)
elseif data.code_ == 6 then
send(msg.chat_id_,msg.id_," ⌯︙ انا لست ادمن هنا يرجى ترقيتي ادمن ثم اعد المحاوله")  
elseif data.message_ == "CHAT_NOT_MODIFIED" then
send(msg.chat_id_,msg.id_," ⌯︙ لا توجد رساله مثبته")  
elseif data.message_ == "CHAT_ADMIN_REQUIRED" then
send(msg.chat_id_,msg.id_," ⌯︙ ليست لدي صلاحية التثبيت يرجى التحقق من الصلاحيات")  
end
end,nil) 
end
if text == 'الغاء التثبيت' and Mod(msg) then  
if AddChannel(msg.sender_user_id_) == false then
local textchuser = bot_data:get(ban_id..'text:ch:user')
if textchuser then
send(msg.chat_id_, msg.id_,'['..textchuser..']')
else
send(msg.chat_id_, msg.id_,' ⌯︙ لا تستطيع استخدام البوت \n ⌯︙  يرجى الاشتراك بالقناه اولا \n ⌯︙  اشترك هنا ['..bot_data:get(ban_id..'add:ch:username')..']')
end
return false
end
if bot_data:sismember(ban_id..'lock:pin',msg.chat_id_) and not Constructor(msg) then
send(msg.chat_id_,msg.id_," ⌯︙ عذرآ تم قفل الثبيت")  
return false  
end
tdcli_function({ID="UnpinChannelMessage",channel_id_ = msg.chat_id_:gsub('-100','')},function(arg,data) 
if data.ID == "Ok" then
send(msg.chat_id_, msg.id_," ⌯︙ تم الغاء تثبيت الرساله")   
bot_data:del(ban_id..'Pin:Id:Msg'..msg.chat_id_)
elseif data.code_ == 6 then
send(msg.chat_id_,msg.id_," ⌯︙ انا لست ادمن هنا يرجى ترقيتي ادمن ثم اعد المحاوله")  
elseif data.message_ == "CHAT_NOT_MODIFIED" then
send(msg.chat_id_,msg.id_," ⌯︙ لا توجد رساله مثبته")  
elseif data.message_ == "CHAT_ADMIN_REQUIRED" then
send(msg.chat_id_,msg.id_," ⌯︙ ليست لدي صلاحية التثبيت يرجى التحقق من الصلاحيات")  
end
end,nil)
end
if text == 'الغاء تثبيت الكل' and Mod(msg) then  
if AddChannel(msg.sender_user_id_) == false then
local textchuser = bot_data:get(ban_id..'text:ch:user')
if textchuser then
send(msg.chat_id_, msg.id_,'['..textchuser..']')
else
send(msg.chat_id_, msg.id_,' ⌯︙ لا تستطيع استخدام البوت \n ⌯︙  يرجى الاشتراك بالقناه اولا \n ⌯︙  اشترك هنا ['..bot_data:get(ban_id..'add:ch:username')..']')
end
return false
end
if bot_data:sismember(ban_id..'lock:pin',msg.chat_id_) and not Constructor(msg) then
send(msg.chat_id_,msg.id_," ⌯︙ عذرآ تم قفل الثبيت")  
return false  
end
tdcli_function({ID="UnpinChannelMessage",channel_id_ = msg.chat_id_:gsub('-100','')},function(arg,data) 
if data.ID == "Ok" then
send(msg.chat_id_, msg.id_," ⌯︙ تم الغاء تثبيت الكل")   
https.request('https://api.telegram.org/bot'..token..'/unpinAllChatMessages?chat_id='..msg.chat_id_)
bot_data:del(ban_id..'Pin:Id:Msg'..msg.chat_id_)
elseif data.code_ == 6 then
send(msg.chat_id_,msg.id_," ⌯︙ انا لست ادمن هنا يرجى ترقيتي ادمن ثم اعد المحاوله")  
elseif data.message_ == "CHAT_NOT_MODIFIED" then
send(msg.chat_id_,msg.id_," ⌯︙ لا توجد رساله مثبته")  
elseif data.message_ == "CHAT_ADMIN_REQUIRED" then
send(msg.chat_id_,msg.id_," ⌯︙ ليست لدي صلاحية التثبيت يرجى التحقق من الصلاحيات")  
end
end,nil)
end
if text and text:match('^ضع تكرار (%d+)$') and Mod(msg) then   
local Num = text:match('ضع تكرار (.*)')
bot_data:hset(ban_id.."flooding:settings:"..msg.chat_id_ ,"floodmax" ,Num) 
send(msg.chat_id_, msg.id_,' ⌯︙ تم وضع عدد التكرار ('..Num..')')  
end 
if text and text:match('^ضع زمن التكرار (%d+)$') and Mod(msg) then   
local Num = text:match('^ضع زمن التكرار (%d+)$')
bot_data:hset(ban_id.."flooding:settings:"..msg.chat_id_ ,"floodtime" ,Num) 
send(msg.chat_id_, msg.id_,' ⌯︙ تم وضع زمن التكرار ('..Num..')') 
end
if text == 'تفعيل اليوتيوب' and Mod(msg) and GetChannelMember(msg) then  
bot_data:del(ban_id..'searchinbot'..msg.chat_id_) 
send(msg.chat_id_, msg.id_,' *⌯︙تم تفعيل اليوتيوب*') 
return false  
end
if text == 'تعطيل اليوتيوب' and Mod(msg) and GetChannelMember(msg) then  
bot_data:set(ban_id..'searchinbot'..msg.chat_id_,true) 
send(msg.chat_id_, msg.id_,' *⌯︙تم تعطيل اليوتيوب*') 
return false  
end

if text == "تعطيل الزخرفه" and Manager(msg) then
send(msg.chat_id_, msg.id_, ' ⌯︙ تم تعطيل الزخرفه')
database:set(bot_id.." sofi:zhrf_Bots"..msg.chat_id_,"close")
end
if text == "تفعيل الزخرفه" and Manager(msg) then
send(msg.chat_id_, msg.id_,' ⌯︙ تم تفعيل الزخرفه')
database:set(bot_id.." sofi:zhrf_Bots"..msg.chat_id_,"open")
end
if text and text:match("^زخرفه (.*)$") and database:get(bot_id.." sofi:zhrf_Bots"..msg.chat_id_) == "open" then
local TextZhrfa = text:match("^زخرفه (.*)$")
zh = https.request('https://apiabs.ml/zrf.php?abs='..URL.escape(TextZhrfa)..'')
zx = JSON.decode(zh)
t = "\n ⌯︙قائمه الزخرفه \n••━═━═━═「ɢᴏʟᴅ」═━═━═━••\n"
i = 0
for k,v in pairs(zx.ok) do
i = i + 1
t = t..i.."-  `"..v.."` \n"
end
send(msg.chat_id_, msg.id_, t..'••━═━═━═「ɢᴏʟᴅ」═━═━═━••\nاضغط علي الاسم ليتم نسخه\n••━═━═━═「ɢᴏʟᴅ」═━═━═━••ٴ\n ⌯︙ [sᴏᴜʀᴄᴇ ɢᴏʟᴅ ](t.me/g_00_l_d)⌯︙ ')
end
if text == "ضع رابط" or text == 'وضع رابط' then
if msg.reply_to_message_id_ == 0  and Mod(msg) then  
if AddChannel(msg.sender_user_id_) == false then
local textchuser = bot_data:get(ban_id..'text:ch:user')
if textchuser then
send(msg.chat_id_, msg.id_,'['..textchuser..']')
else
send(msg.chat_id_, msg.id_,' ⌯︙ لا تستطيع استخدام البوت \n ⌯︙  يرجى الاشتراك بالقناه اولا \n ⌯︙  اشترك هنا ['..bot_data:get(ban_id..'add:ch:username')..']')
end
return false
end
send(msg.chat_id_,msg.id_," ⌯︙ حسنآ ارسل اليه الرابط الان")
bot_data:setex(ban_id.."Set:Priovate:Group:Link"..msg.chat_id_..""..msg.sender_user_id_,120,true) 
return false
end
end
if text == "تفعيل رابط" or text == 'تفعيل الرابط' then
if Mod(msg) then  
bot_data:set(ban_id.."Link_Group:status"..msg.chat_id_,true) 
send(msg.chat_id_, msg.id_," ✔️ تم تفعيل الرابط") 
return false  
end
end
if text == "تعطيل رابط" or text == 'تعطيل الرابط' then
if Mod(msg) then  
bot_data:del(ban_id.."Link_Group:status"..msg.chat_id_) 
send(msg.chat_id_, msg.id_," ✘ تم تعطيل الرابط") 
return false end
end


---------------------
if text == "تفعيل صورتي" or text == 'تفعيل الصوره' then
if Constructor(msg) then  
bot_data:set(ban_id.."my_photo:status"..msg.chat_id_,true) 
send(msg.chat_id_, msg.id_," ⌯︙ تم تفعيل الصوره") 
return false  
end
end
if text == "تعطيل الصوره" or text == 'تعطيل صورتي' then
if Constructor(msg) then  
bot_data:del(ban_id.."my_photo:status"..msg.chat_id_) 
send(msg.chat_id_, msg.id_," ⌯︙ تم تعطيل الصوره") 
return false end
end
if text == "تفعيل نسبه جمالي" or text == 'تفعيل جمالي' then
if Constructor(msg) then  
bot_data:set(ban_id.."pp_photo:status"..msg.chat_id_,true) 
send(msg.chat_id_, msg.id_," ⌯︙ تم تفعيل نسبه جمالك") 
return false  
end
end
if text == "تعطيل جمالي" or text == 'تعطيل نسبه جمالي' then
if Constructor(msg) then  
bot_data:del(ban_id.."pp_photo:status"..msg.chat_id_) 
send(msg.chat_id_, msg.id_," ⌯︙ تم تعطيل نسبه جمالك") 
return false end
end

if text == "حفل" or text == "نيكو" or text == "نيك كسمو" or text == "حفل عليه" then
tdcli_function({ID="GetUser",user_id_=msg.sender_user_id_},function(extra,result,success)
local t7fel = {
'ههههههههههههههههههههههههههههههههههههههههه',
'يشرموط',
'يخول',
'يبن الاحبه',
'يخول يشرموط',
'يبن المتناكه يبطيق',
'يكسمك يبن الاحبه',
'يديني كسم آلضحك',
'يكسمك',
'هكر انا',
'سد يكسمك',
'يبن الخول',
'يمتناك يعرص',
'يكس متناك',
'كسختك جبت منو دم',
'كسمك جبت منو دم',
'كس ابوك جبت منو دم',
'كسم امك الاحبه',
'كسم الي ناكك',
'كسم طيزك زبي م نافع يخرج',
'كسمينك',
'زبي م نافع يخرج من كسمك',
'زبي',
'كسمك',
'كسختك',
'يخول',
'يعرص',
'يمتهان',
}
send(msg.chat_id_,'['..t7fel[math.random(#t7fel)]..']')
send(msg.chat_id_,'['..t7fel[math.random(#t7fel)]..']')
send(msg.chat_id_,'['..t7fel[math.random(#t7fel)]..']')
send(msg.chat_id_,'['..t7fel[math.random(#t7fel)]..']')
send(msg.chat_id_,'['..t7fel[math.random(#t7fel)]..']')
send(msg.chat_id_,'['..t7fel[math.random(#t7fel)]..']')
send(msg.chat_id_,'['..t7fel[math.random(#t7fel)]..']')
send(msg.chat_id_,'['..t7fel[math.random(#t7fel)]..']')
send(msg.chat_id_,'['..t7fel[math.random(#t7fel)]..']')
send(msg.chat_id_,'['..t7fel[math.random(#t7fel)]..']')
send(msg.chat_id_,'['..t7fel[math.random(#t7fel)]..']')
send(msg.chat_id_,'['..t7fel[math.random(#t7fel)]..']')
send(msg.chat_id_,'['..t7fel[math.random(#t7fel)]..']')
send(msg.chat_id_,'['..t7fel[math.random(#t7fel)]..']')
send(msg.chat_id_,'['..t7fel[math.random(#t7fel)]..']')
send(msg.chat_id_,'['..t7fel[math.random(#t7fel)]..']')
send(msg.chat_id_,'['..t7fel[math.random(#t7fel)]..']')
send(msg.chat_id_,'['..t7fel[math.random(#t7fel)]..']')
send(msg.chat_id_,'['..t7fel[math.random(#t7fel)]..']')
send(msg.chat_id_,'['..t7fel[math.random(#t7fel)]..']')
send(msg.chat_id_,'['..t7fel[math.random(#t7fel)]..']')
send(msg.chat_id_,'['..t7fel[math.random(#t7fel)]..']')
send(msg.chat_id_, msg.reply_to_message_id_, 'البـدايـه ❤')
send(msg.chat_id_, msg.reply_to_message_id_, 'كـسـمـك لاجـل المبرمج احمد المصري ❤') 
send(msg.chat_id_, msg.reply_to_message_id_, 'كـسـمـك لاجـل تايجر التيلي ❤') 
send(msg.chat_id_, msg.reply_to_message_id_, 'كـسـمـك لاجـل بنات احمد المصري ❤') 
send(msg.chat_id_, msg.reply_to_message_id_, 'كـسـمـك لاجـل اخوات احمد آلمصري ❤') 
send(msg.chat_id_, msg.reply_to_message_id_, 'كـسـمـك لاجـل بنات تايجر ❤') 
send(msg.chat_id_, msg.reply_to_message_id_, 'كـسـمـك لاجـل مرات تايجر ❤') 
send(msg.chat_id_, msg.reply_to_message_id_, 'كـسـمـك لاجـل بنات تايجر ❤') 
send(msg.chat_id_, msg.reply_to_message_id_, 'كـسـمـك لاجـل عبدو ❤') 
send(msg.chat_id_, msg.reply_to_message_id_, 'كـسـمـك لاجـل مرات عبدو ❤') 
send(msg.chat_id_, msg.reply_to_message_id_, 'كـسـمـك لاجـل انك اتهنت ❤') 
send(msg.chat_id_, msg.reply_to_message_id_, 'كـسـمـك لاجـل زبي ❤') 
send(msg.chat_id_, msg.reply_to_message_id_, 'كـسـمـك لاجـل اني هنيكك ❤') 
send(msg.chat_id_, msg.reply_to_message_id_, 'كـسـمـك لاجـل التيلي ❤') 
send(msg.chat_id_, msg.reply_to_message_id_, 'كـسـمـك لاجـل اني مش هحالك  ❤') 
send(msg.chat_id_, msg.reply_to_message_id_, 'كـسـمـك لاجـل اني هتسالي عليك انهارده ❤') 
send(msg.chat_id_, msg.reply_to_message_id_, 'كـسـمـك لاجـل كسمك لاجل زبي ❤') 
send(msg.chat_id_, msg.reply_to_message_id_, 'كـسـمـك لاجـل بوتات التلي ❤') 
send(msg.chat_id_, msg.reply_to_message_id_, 'كـسـمـك لاجـل اسلام دهب ❤') 
send(msg.chat_id_, msg.reply_to_message_id_, 'كـسـمـك لاجـل وعد مرات المصري ❤') 
send(msg.chat_id_, msg.reply_to_message_id_, 'كـسـمـك لاجـل اني مش شايفك ❤') 
send(msg.chat_id_, msg.reply_to_message_id_, 'كـسـمـك لاجـل '..result.first_name_..' ❤') 
send(msg.chat_id_, msg.reply_to_message_id_, 'الـنـهـايـه ❤')
send(msg.chat_id_, msg.id_, 'نكت دينمو 😂😂')
send(msg.chat_id_, msg.id_, 'عد هعمل كام ريب 😂')
send(msg.chat_id_, msg.reply_to_message_id_, 'ريب 1')
send(msg.chat_id_, msg.reply_to_message_id_, 'ريب 2')
send(msg.chat_id_, msg.reply_to_message_id_, 'ريب 3')
send(msg.chat_id_, msg.reply_to_message_id_, 'ريب 4')
send(msg.chat_id_, msg.reply_to_message_id_, 'ريب 5')
send(msg.chat_id_, msg.reply_to_message_id_, 'مات 😂')
send(msg.chat_id_, msg.reply_to_message_id_, 'كسم آلضحك 😂')
send(msg.chat_id_, msg.id_, 'امسح بقي عشان ميحصلش حاجه للروم من الشتايم 😚')
return false 
end,nil)
end

if text == 'مسح الرابط' or text == 'مسح الرابط' then
if Mod(msg) then     
if AddChannel(msg.sender_user_id_) == false then
local textchuser = bot_data:get(ban_id..'text:ch:user')
if textchuser then
send(msg.chat_id_, msg.id_,'['..textchuser..']')
else
send(msg.chat_id_, msg.id_,' ⌯︙ لا تستطيع استخدام البوت \n ⌯︙  يرجى الاشتراك بالقناه اولا \n ⌯︙  اشترك هنا ['..bot_data:get(ban_id..'add:ch:username')..']')
end
return false
end
send(msg.chat_id_,msg.id_," ⌯︙ تم مسح الرابط")           
bot_data:del(ban_id.."Private:Group:Link"..msg.chat_id_) 
return false      
end
end
if text and text:match("^ضع صوره") and Mod(msg) and msg.reply_to_message_id_ == 0 then  
bot_data:set(ban_id..'Change:Chat:Photo'..msg.chat_id_..':'..msg.sender_user_id_,true) 
send(msg.chat_id_, msg.id_,' ⌯︙ ارسل لي الصوره') 
return false
end
if text == "مسح الصوره" or text == "مسح الصوره" then 
if Mod(msg) then
if AddChannel(msg.sender_user_id_) == false then
local textchuser = bot_data:get(ban_id..'text:ch:user')
if textchuser then
send(msg.chat_id_, msg.id_,'['..textchuser..']')
else
send(msg.chat_id_, msg.id_,' ⌯︙ لا تستطيع استخدام البوت \n ⌯︙  يرجى الاشتراك بالقناه اولا \n ⌯︙  اشترك هنا ['..bot_data:get(ban_id..'add:ch:username')..']')
end
return false
end
https.request('https://api.telegram.org/bot'..token..'/deleteChatPhoto?chat_id='..msg.chat_id_) 
send(msg.chat_id_, msg.id_,' ⌯︙ تم ازالة صورة الجروب') 
end
return false  
end
if text == 'ضع وصف' or text == 'وضع وصف' then  
if Mod(msg) then
bot_data:setex(ban_id.."Set:Description" .. msg.chat_id_ .. "" .. msg.sender_user_id_, 120, true)  
send(msg.chat_id_, msg.id_,' ⌯︙ ارسل الان الوصف')
end
return false  
end
if text == 'ضع ترحيب' or text == 'وضع ترحيب' then  
if Mod(msg) then
bot_data:setex(ban_id.."Welcome:Group" .. msg.chat_id_ .. "" .. msg.sender_user_id_, 120, true)  
t  = ' ⌯︙ ارسل لي الترحيب الان'
tt = '\n ⌯︙ تستطيع اضافة مايلي !\n ⌯︙ دالة عرض الاسم  ⋖{`name`}\n ⌯︙ دالة عرض المعرف  ⋖{`user`}'
send(msg.chat_id_, msg.id_,t..tt) 
end
return false  
end
if text == 'الترحيب' and Mod(msg) then 
local GetWelcomeGroup = bot_data:get(ban_id..'Get:Welcome:Group'..msg.chat_id_)  
if GetWelcomeGroup then 
GetWelcome = GetWelcomeGroup
else 
GetWelcome = ' ⌯︙ لم يتم تعيين ترحيب للجروب'
end 
send(msg.chat_id_, msg.id_,'['..GetWelcome..']') 
return false  
end
if text == 'تفعيل الترحيب' and Mod(msg) then  
if AddChannel(msg.sender_user_id_) == false then
local textchuser = bot_data:get(ban_id..'text:ch:user')
if textchuser then
send(msg.chat_id_, msg.id_,'['..textchuser..']')
else
send(msg.chat_id_, msg.id_,' ⌯︙ لا تستطيع استخدام البوت \n ⌯︙  يرجى الاشتراك بالقناه اولا \n ⌯︙  اشترك هنا ['..bot_data:get(ban_id..'add:ch:username')..']')
end
return false
end
bot_data:set(ban_id..'Chek:Welcome'..msg.chat_id_,true) 
send(msg.chat_id_, msg.id_,' ⌯︙ تم تفعيل ترحيب الجروب') 
return false  
end
if text == 'تعطيل الترحيب' and Mod(msg) then  
if AddChannel(msg.sender_user_id_) == false then
local textchuser = bot_data:get(ban_id..'text:ch:user')
if textchuser then
send(msg.chat_id_, msg.id_,'['..textchuser..']')
else
send(msg.chat_id_, msg.id_,' ⌯︙ لا تستطيع استخدام البوت \n ⌯︙  يرجى الاشتراك بالقناه اولا \n ⌯︙  اشترك هنا ['..bot_data:get(ban_id..'add:ch:username')..']')
end
return false
end
bot_data:del(ban_id..'Chek:Welcome'..msg.chat_id_) 
send(msg.chat_id_, msg.id_,' ⌯︙ تم تعطيل ترحيب الجروب') 
return false  
end
if text == 'مسح الترحيب' or text == 'مسح الترحيب' then 
if Mod(msg) then
bot_data:del(ban_id..'Get:Welcome:Group'..msg.chat_id_) 
send(msg.chat_id_, msg.id_,' ⌯︙ تم ازالة ترحيب الجروب') 
end
end
if text and text == "منع" and msg.reply_to_message_id_ == 0 and Manager(msg)  then       
send(msg.chat_id_, msg.id_," ⌯︙ ارسل الكلمه لمنعها")  
bot_data:set(ban_id.."KLAER1:Add:Filter:Rp1"..msg.sender_user_id_..msg.chat_id_,"rep")  
return false  
end    
if text then   
local tsssst = bot_data:get(ban_id.."KLAER1:Add:Filter:Rp1"..msg.sender_user_id_..msg.chat_id_)  
if tsssst == "rep" then   
send(msg.chat_id_, msg.id_," ⌯︙ ارسل التحذير عند ارسال الكلمه")  
bot_data:set(ban_id.."KLAER1:Add:Filter:Rp1"..msg.sender_user_id_..msg.chat_id_,"repp")  
bot_data:set(ban_id.."KLAER1:filtr1:add:reply2"..msg.sender_user_id_..msg.chat_id_, text)  
bot_data:sadd(ban_id.."KLAER1:List:Filter"..msg.chat_id_,text)  
return false  end  
end
if text then  
local test = bot_data:get(ban_id.."KLAER1:Add:Filter:Rp1"..msg.sender_user_id_..msg.chat_id_)  
if test == "repp" then  
send(msg.chat_id_, msg.id_," ⌯︙ تم منع الكلمه مع التحذير")  
bot_data:del(ban_id.."KLAER1:Add:Filter:Rp1"..msg.sender_user_id_..msg.chat_id_)  
local test = bot_data:get(ban_id.."KLAER1:filtr1:add:reply2"..msg.sender_user_id_..msg.chat_id_)  
if text then   
bot_data:set(ban_id.."KLAER1:Add:Filter:Rp2"..test..msg.chat_id_, text)  
end  
bot_data:del(ban_id.."KLAER1:filtr1:add:reply2"..msg.sender_user_id_..msg.chat_id_)  
return false  end  
end

if text == "الغاء منع" and msg.reply_to_message_id_ == 0 and Manager(msg) then    
send(msg.chat_id_, msg.id_," ⌯︙ ارسل الكلمه الان")  
bot_data:set(ban_id.."KLAER1:Add:Filter:Rp1"..msg.sender_user_id_..msg.chat_id_,"reppp")  
return false  end
if text then 
local test = bot_data:get(ban_id.."KLAER1:Add:Filter:Rp1"..msg.sender_user_id_..msg.chat_id_)  
if test and test == "reppp" then   
send(msg.chat_id_, msg.id_," ⌯︙ تم الغاء منعها")  
bot_data:del(ban_id.."KLAER1:Add:Filter:Rp1"..msg.sender_user_id_..msg.chat_id_)  
bot_data:del(ban_id.."KLAER1:Add:Filter:Rp2"..text..msg.chat_id_)  
bot_data:srem(ban_id.."KLAER1:List:Filter"..msg.chat_id_,text)  
return false  end  
end


if text == 'منع' and tonumber(msg.reply_to_message_id_) > 0 and Manager(msg) then     
function cb(a,b,c) 
textt = ' ⌯︙ تم منع '
if b.content_.sticker_ then
local idsticker = b.content_.sticker_.set_id_
bot_data:sadd(ban_id.."filtersteckr"..msg.chat_id_,idsticker)
text = 'الملصق'
send(msg.chat_id_, msg.id_,textt..'( '..text..' ) بنجاح لن يتم ارسالها مجددا')  
return false
end
if b.content_.ID == "MessagePhoto" then
local photo = b.content_.photo_.id_
bot_data:sadd(ban_id.."filterphoto"..msg.chat_id_,photo)
text = 'الصوره'
send(msg.chat_id_, msg.id_,textt..'( '..text..' ) بنجاح لن يتم ارسالها مجددا')  
return false
end
if b.content_.animation_.animation_ then
local idanimation = b.content_.animation_.animation_.persistent_id_
bot_data:sadd(ban_id.."filteranimation"..msg.chat_id_,idanimation)
text = 'المتحركه'
send(msg.chat_id_, msg.id_,textt..'( '..text..' ) بنجاح لن يتم ارسالها مجددا')  
return false
end
end
tdcli_function ({ ID = "GetMessage", chat_id_ = msg.chat_id_, message_id_ = tonumber(msg.reply_to_message_id_) }, cb, nil)
end
if text == 'الغاء منع' and tonumber(msg.reply_to_message_id_) > 0 and Manager(msg) then     
function cb(a,b,c) 
textt = ' ⌯︙ تم الغاء منع '
if b.content_.sticker_ then
local idsticker = b.content_.sticker_.set_id_
bot_data:srem(ban_id.."filtersteckr"..msg.chat_id_,idsticker)
text = 'الملصق'
send(msg.chat_id_, msg.id_,textt..'( '..text..' ) بنجاح يمكنهم الارسال الان')  
return false
end
if b.content_.ID == "MessagePhoto" then
local photo = b.content_.photo_.id_
bot_data:srem(ban_id.."filterphoto"..msg.chat_id_,photo)
text = 'الصوره'
send(msg.chat_id_, msg.id_,textt..'( '..text..' ) بنجاح يمكنهم الارسال الان')  
return false
end
if b.content_.animation_.animation_ then
local idanimation = b.content_.animation_.animation_.persistent_id_
bot_data:srem(ban_id.."filteranimation"..msg.chat_id_,idanimation)
text = 'المتحركه'
send(msg.chat_id_, msg.id_,textt..'( '..text..' ) بنجاح يمكنهم الارسال الان')  
return false
end
end
tdcli_function ({ ID = "GetMessage", chat_id_ = msg.chat_id_, message_id_ = tonumber(msg.reply_to_message_id_) }, cb, nil)
end

if text == "مسح قائمه المنع"and Manager(msg) then   
local list = bot_data:smembers(ban_id.."KLAER1:List:Filter"..msg.chat_id_)  
for k,v in pairs(list) do  
bot_data:del(ban_id.."KLAER1:Add:Filter:Rp1"..msg.sender_user_id_..msg.chat_id_)  
bot_data:del(ban_id.."KLAER1:Add:Filter:Rp2"..v..msg.chat_id_)  
bot_data:srem(ban_id.."KLAER1:List:Filter"..msg.chat_id_,v)  
end  
send(msg.chat_id_, msg.id_," ⌯︙ تم مسح قائمه المنع")  
end

if text == "قائمه المنع" and Manager(msg) then   
local list = bot_data:smembers(ban_id.."KLAER1:List:Filter"..msg.chat_id_)  
t = "\n ⌯︙ قائمة المنع \n•━═━═━═「ɢᴏʟᴅ」═━═━═━•\n"
for k,v in pairs(list) do  
local KLAER_Msg = bot_data:get(ban_id.."KLAER1:Add:Filter:Rp2"..v..msg.chat_id_)   
t = t..""..k.."- "..v.." ↭ {"..KLAER_Msg.."}\n"    
end  
if #list == 0 then  
t = " ⌯︙ لا يوجد كلمات ممنوعه"  
end  
send(msg.chat_id_, msg.id_,t)  
end  
if text == 'مسح قائمه منع المتحركات' and Manager(msg) then     
bot_data:del(ban_id.."filteranimation"..msg.chat_id_)
send(msg.chat_id_, msg.id_,' ?? تم مسح قائمه منع المتحركات')  
end
if text == 'مسح قائمه منع الصور' and Manager(msg) then     
bot_data:del(ban_id.."filterphoto"..msg.chat_id_)
send(msg.chat_id_, msg.id_,' ⌯︙ تم مسح قائمه منع الصور')  
end
if text == 'مسح قائمه منع الملصقات' and Manager(msg) then     
bot_data:del(ban_id.."filtersteckr"..msg.chat_id_)
send(msg.chat_id_, msg.id_,' ⌯︙ تم مسح قائمه منع الملصقات')  
end
------------------

if text == 'مسح كليشه المطور' and Devban(msg) then
bot_data:del(ban_id..'TEXT_SUDO')
send(msg.chat_id_, msg.id_,' ⌯︙ تم مسح كليشه المطور')
end
if text == 'ضع كليشه المطور' and Devban(msg) then
bot_data:set(ban_id..'Set:TEXT_SUDO'..msg.chat_id_..':'..msg.sender_user_id_,true)
send(msg.chat_id_,msg.id_,' ⌯︙ ارسل الكليشه الان')
return false
end
if text and bot_data:get(ban_id..'Set:TEXT_SUDO'..msg.chat_id_..':'..msg.sender_user_id_) then
if text == 'الغاء' then 
bot_data:del(ban_id..'Set:TEXT_SUDO'..msg.chat_id_..':'..msg.sender_user_id_)
send(msg.chat_id_,msg.id_,' ⌯︙ تم الغاء حفظ كليشة المطور')
return false
end
bot_data:set(ban_id..'TEXT_SUDO',text)
bot_data:del(ban_id..'Set:TEXT_SUDO'..msg.chat_id_..':'..msg.sender_user_id_)
send(msg.chat_id_,msg.id_,' ⌯︙ تم حفظ كليشة المطور')
return false
end
-----------------
if text == 'تعين الايدي' and Manager(msg) then
if AddChannel(msg.sender_user_id_) == false then
local textchuser = bot_data:get(ban_id..'text:ch:user')
if textchuser then
send(msg.chat_id_, msg.id_,'['..textchuser..']')
else
send(msg.chat_id_, msg.id_,' ⌯︙ لا تستطيع استخدام البوت \n ⌯︙  يرجى الاشتراك بالقناه اولا \n ⌯︙  اشترك هنا ['..bot_data:get(ban_id..'add:ch:username')..']')
end
return false
end
bot_data:setex(ban_id.."CHENG:ID"..msg.chat_id_..""..msg.sender_user_id_,240,true)  
local Text= [[
 ⌯︙ ارسل الان النص
 ⌯︙ يمكنك اضافه :
 ⌯︙ `#rdphoto` ⋖ تعليق الصوره
 ⌯︙ `#username` ⋖ اسم 
 ⌯︙ `#msgs` ⋖ عدد رسائل 
 ⌯︙ `#photos` ⋖ عدد صور 
 ⌯︙ `#id` ⋖ ايدي 
 ⌯︙ `#auto` ⋖ تفاعل 
 ⌯︙ `#stast` ⋖ موقع  
 ⌯︙ `#edit` ⋖ السحكات
 ⌯︙ `#game` ⋖ النقاط
]]
send(msg.chat_id_, msg.id_,Text)
return false  
end 
if text == 'مسح الايدي' or text == 'مسح الايدي' then
if Manager(msg) then
if AddChannel(msg.sender_user_id_) == false then
local textchuser = bot_data:get(ban_id..'text:ch:user')
if textchuser then
send(msg.chat_id_, msg.id_,'['..textchuser..']')
else
send(msg.chat_id_, msg.id_,' ⌯︙ لا تستطيع استخدام البوت \n ⌯︙  يرجى الاشتراك بالقناه اولا \n ⌯︙  اشترك هنا ['..bot_data:get(ban_id..'add:ch:username')..']')
end
return false
end
bot_data:del(ban_id.."KLISH:ID"..msg.chat_id_)
send(msg.chat_id_, msg.id_, ' ⌯︙ تم ازالة كليشة الايدي')
end
return false  
end 

if bot_data:get(ban_id.."CHENG:ID"..msg.chat_id_..""..msg.sender_user_id_) then 
if text == 'الغاء' then 
send(msg.chat_id_, msg.id_," ⌯︙ تم الغاء تعين الايدي") 
bot_data:del(ban_id.."CHENG:ID"..msg.chat_id_..""..msg.sender_user_id_) 
return false  
end 
bot_data:del(ban_id.."CHENG:ID"..msg.chat_id_..""..msg.sender_user_id_) 
local CHENGER_ID = text:match("(.*)")  
bot_data:set(ban_id.."KLISH:ID"..msg.chat_id_,CHENGER_ID)
send(msg.chat_id_, msg.id_,' ⌯︙ تم تعين الايدي')    
end

if text == 'طرد البوتات' and Mod(msg) then 
if AddChannel(msg.sender_user_id_) == false then
local textchuser = bot_data:get(ban_id..'text:ch:user')
if textchuser then
send(msg.chat_id_, msg.id_,'['..textchuser..']')
else
send(msg.chat_id_, msg.id_,' ⌯︙ لا تستطيع استخدام البوت \n ⌯︙  يرجى الاشتراك بالقناه اولا \n ⌯︙  اشترك هنا ['..bot_data:get(ban_id..'add:ch:username')..']')
end
return false
end
tdcli_function ({ ID = "GetChannelMembers",channel_id_ = getChatId(msg.chat_id_).ID,filter_ = {ID = "ChannelMembersBots"},offset_ = 0,limit_ = 100 },function(arg,tah)  
local admins = tah.members_  
local x = 0
local c = 0
for i=0 , #admins do 
if tah.members_[i].status_.ID == "ChatMemberStatusEditor" then  
x = x + 1 
end
if tonumber(admins[i].user_id_) ~= tonumber(ban_id) then
chat_kick(msg.chat_id_,admins[i].user_id_)
end
c = c + 1
end     
if (c - x) == 0 then
send(msg.chat_id_, msg.id_, " ⌯︙ لا توجد بوتات في الجروب")
else
local t = ' ⌯︙ عدد البوتات هنا >> {'..c..'}\n ⌯︙ عدد البوتات التي هي ادمن >> {'..x..'}\n ⌯︙ تم طرد >> {'..(c - x)..'} من البوتات'
send(msg.chat_id_, msg.id_,t) 
end 
end,nil)  
end   
end
if text == ("كشف البوتات") and Mod(msg) then  
if AddChannel(msg.sender_user_id_) == false then
local textchuser = bot_data:get(ban_id..'text:ch:user')
if textchuser then
send(msg.chat_id_, msg.id_,'['..textchuser..']')
else
send(msg.chat_id_, msg.id_,' ⌯︙ لا تستطيع استخدام البوت \n ⌯︙  يرجى الاشتراك بالقناه اولا \n ⌯︙  اشترك هنا ['..bot_data:get(ban_id..'add:ch:username')..']')
end
return false
end
tdcli_function ({ID = "GetChannelMembers",channel_id_ = getChatId(msg.chat_id_).ID,filter_ = {ID = "ChannelMembersBots"},offset_ = 0,limit_ = 100 },function(extra,result,success)
local admins = result.members_  
text = "\n ⌯︙ قائمة البوتات الموجوده \n•━═━═━═「ɢᴏʟᴅ」═━═━═━•\n"
local n = 0
local t = 0
for i=0 , #admins do 
n = (n + 1)
tdcli_function ({ID = "GetUser",user_id_ = admins[i].user_id_
},function(arg,ta) 
if result.members_[i].status_.ID == "ChatMemberStatusMember" then  
tr = ''
elseif result.members_[i].status_.ID == "ChatMemberStatusEditor" then  
t = t + 1
tr = ' {★}'
end
text = text..">> [@"..ta.username_..']'..tr.."\n"
if #admins == 0 then
send(msg.chat_id_, msg.id_, " ⌯︙ لا توجد بوتات في الجروب")
return false 
end
if #admins == i then 
local a = '\n•━═━═━═「ɢᴏʟᴅ」═━═━═━•\n ⌯︙ عدد البوتات التي هنا >> {'..n..'} بوت\n'
local f = ' ⌯︙ عدد البوتات التي هي ادمن >> {'..t..'}\n ⌯︙ ملاحضه علامة ال ( ⌯︙) تعني ان البوت ادمن \n'
send(msg.chat_id_, msg.id_, text..a..f)
end
end,nil)
end
end,nil)
end

if bot_data:get(ban_id.."Set:Rules:" .. msg.chat_id_ .. ":" .. msg.sender_user_id_) then 
if text == 'الغاء' then 
send(msg.chat_id_, msg.id_, " ⌯︙ تم الغاء حفظ القوانين") 
bot_data:del(ban_id.."Set:Rules:" .. msg.chat_id_ .. ":" .. msg.sender_user_id_)
return false  
end 
bot_data:set(ban_id.."Set:Rules:Group" .. msg.chat_id_,text) 
send(msg.chat_id_, msg.id_," ⌯︙ تم حفظ قوانين الجروب") 
bot_data:del(ban_id.."Set:Rules:" .. msg.chat_id_ .. ":" .. msg.sender_user_id_)
end  

if text == 'ضع قوانين' or text == 'وضع قوانين' then 
if Mod(msg) then
if AddChannel(msg.sender_user_id_) == false then
local textchuser = bot_data:get(ban_id..'text:ch:user')
if textchuser then
send(msg.chat_id_, msg.id_,'['..textchuser..']')
else
send(msg.chat_id_, msg.id_,' ⌯︙ لا تستطيع استخدام البوت \n ⌯︙  يرجى الاشتراك بالقناه اولا \n ⌯︙  اشترك هنا ['..bot_data:get(ban_id..'add:ch:username')..']')
end
return false
end
bot_data:setex(ban_id.."Set:Rules:" .. msg.chat_id_ .. ":" .. msg.sender_user_id_, 600, true) 
send(msg.chat_id_,msg.id_," ⌯︙ ارسل لي القوانين الان")  
end
end
if text == 'مسح القوانين' or text == 'مسح القوانين' then  
if Mod(msg) then
send(msg.chat_id_, msg.id_," ⌯︙ تم ازالة قوانين الجروب")  
bot_data:del(ban_id.."Set:Rules:Group"..msg.chat_id_) 
end
end
if text == 'القوانين' then 
local Set_Rules = bot_data:get(ban_id.."Set:Rules:Group" .. msg.chat_id_)   
if Set_Rules then     
send(msg.chat_id_,msg.id_, Set_Rules)   
else      
send(msg.chat_id_, msg.id_," ⌯︙ لا توجد قوانين")   
end    
end
if text == 'قفل التفليش' and msg.reply_to_message_id_ == 0 and Mod(msg) then 
bot_data:set(ban_id..'lock:tagrvrbot'..msg.chat_id_,true)   
list ={"lock:Bot:kick","lock:user:name","lock:Link","lock:forward","lock:Sticker","lock:Animation","lock:Video","lock:Fshar","lock:Fars","Bot:Id:Photo","lock:Audio","lock:vico","lock:Document","lock:Unsupported","lock:Markdaun","lock:Contact","lock:Spam"}
for i,lock in pairs(list) do 
bot_data:set(ban_id..lock..msg.chat_id_,'del')    
end
tdcli_function ({ID = "GetUser",user_id_ = msg.sender_user_id_},function(arg,data) 
send(msg.chat_id_, msg.id_,' ⌯︙  مـن قبـل  ⋖ [「'..Rutba(msg.sender_user_id_,msg.chat_id_)..'」](T.ME/'..(data.username_ or 'textchuser')..') \n ⌯︙ تـم قفـل التفليش ')  
end,nil)   
end
if text == 'فتح التفليش' and msg.reply_to_message_id_ == 0 and Mod(msg) then 
bot_data:del(ban_id..'lock:tagrvrbot'..msg.chat_id_)   
list ={"lock:Bot:kick","lock:user:name","lock:Link","lock:forward","lock:Sticker","lock:Animation","lock:Video","lock:Fshar","lock:Fars","Bot:Id:Photo","lock:Audio","lock:vico","lock:Document","lock:Unsupported","lock:Markdaun","lock:Contact","lock:Spam"}
for i,lock in pairs(list) do 
bot_data:del(ban_id..lock..msg.chat_id_)    
end
tdcli_function ({ID = "GetUser",user_id_ = msg.sender_user_id_},function(arg,data) 
send(msg.chat_id_, msg.id_,' ⌯︙  مـن قبـل  ⋖ [「'..Rutba(msg.sender_user_id_,msg.chat_id_)..'」](T.ME/'..(data.username_ or 'textchuser')..') \n ⌯︙ مع فـتح التفليش ')  
end,nil)   
end
if text == 'طرد المحذوفين' or text == 'مسح المحذوفين' then  
if Mod(msg) then    
tdcli_function({ID = "GetChannelMembers",channel_id_ = msg.chat_id_:gsub("-100",""),offset_ = 0,limit_ = 1000}, function(arg,del)
for k, v in pairs(del.members_) do
tdcli_function({ID = "GetUser",user_id_ = v.user_id_},function(b,data) 
if data.first_name_ == false then
Group_Kick(msg.chat_id_, data.id_)
end
end,nil)
end
send(msg.chat_id_, msg.id_,' ⌯︙ تم طرد المحذوفين')
end,nil)
end
end
if text == 'الصلاحيات' and Mod(msg) then 
local list = bot_data:smembers(ban_id..'Coomds'..msg.chat_id_)
if #list == 0 then
send(msg.chat_id_, msg.id_,' ⌯︙ لا توجد صلاحيات مضافه')
return false
end
t = "\n ⌯︙ قائمة الصلاحيات المضافه \n•━═━═━═「ɢᴏʟᴅ」═━═━═━•\n"
for k,v in pairs(list) do
var = bot_data:get(ban_id.."Comd:New:rt:bot:"..v..msg.chat_id_)
if var then
t = t..''..k..'- '..v..'  ⋖ ('..var..')\n'
else
t = t..''..k..'- '..v..'\n'
end
end
send(msg.chat_id_, msg.id_,t)
end
if text and text:match("^اضف صلاحيه (.*)$") and Mod(msg) then 
ComdNew = text:match("^اضف صلاحيه (.*)$")
if AddChannel(msg.sender_user_id_) == false then
local textchuser = bot_data:get(ban_id..'text:ch:user')
if textchuser then
send(msg.chat_id_, msg.id_,'['..textchuser..']')
else
send(msg.chat_id_, msg.id_,' ⌯︙ لا تستطيع استخدام البوت \n ⌯︙  يرجى الاشتراك بالقناه اولا \n ⌯︙  اشترك هنا ['..bot_data:get(ban_id..'add:ch:username')..']')
end
return false
end
bot_data:set(ban_id.."Comd:New:rt"..msg.chat_id_..msg.sender_user_id_,ComdNew)  
bot_data:sadd(ban_id.."Coomds"..msg.chat_id_,ComdNew)  
bot_data:setex(ban_id.."Comd:New"..msg.chat_id_..""..msg.sender_user_id_,200,true)  
send(msg.chat_id_, msg.id_, " ⌯︙ ارسل نوع الرتبه \n ⌯︙ {عـضـو -- ممـيـز -- ادمـن -- مـديـر}") 
end
if text and text:match("^مسح صلاحيه (.*)$") and Mod(msg) then 
ComdNew = text:match("^مسح صلاحيه (.*)$")
if AddChannel(msg.sender_user_id_) == false then
local textchuser = bot_data:get(ban_id..'text:ch:user')
if textchuser then
send(msg.chat_id_, msg.id_,'['..textchuser..']')
else
send(msg.chat_id_, msg.id_,' ⌯︙ لا تستطيع استخدام البوت \n ⌯︙  يرجى الاشتراك بالقناه اولا \n ⌯︙  اشترك هنا ['..bot_data:get(ban_id..'add:ch:username')..']')
end
return false
end
bot_data:del(ban_id.."Comd:New:rt:bot:"..ComdNew..msg.chat_id_)
send(msg.chat_id_, msg.id_, "* ⌯︙ تم مسح الصلاحيه *\n") 
end
if bot_data:get(ban_id.."Comd:New"..msg.chat_id_..""..msg.sender_user_id_) then 
if text and text:match("^الغاء$") then 
send(msg.chat_id_, msg.id_,"* ⌯︙ تم الغاء الامر *\n") 
bot_data:del(ban_id.."Comd:New"..msg.chat_id_..""..msg.sender_user_id_) 
return false  
end 
if text == 'مدير' then
if not Constructor(msg) then
send(msg.chat_id_, msg.id_"* ⌯︙ تستطيع اضافه صلاحيات {ادمن - مميز - عضو} \n ⌯︙ ارسل الصلاحيه مجددا*\n") 
return false
end
end
if text == 'ادمن' then
if not Manager(msg) then 
send(msg.chat_id_, msg.id_,"* ⌯︙ تستطيع اضافه صلاحيات {مميز - عضو} \n ⌯︙ ارسل الصلاحيه مجددا*\n") 
return false
end
end
if text == 'مميز' then
if not Mod(msg) then
send(msg.chat_id_, msg.id_,"* ⌯︙  تستطيع اضافه صلاحيات {عضو} \n ⌯︙ ارسل الصلاحيه مجددا*\n") 
return false
end
end
if text == 'مدير' or text == 'ادمن' or text == 'مميز' or text == 'عضو' then
local textn = bot_data:get(ban_id.."Comd:New:rt"..msg.chat_id_..msg.sender_user_id_)  
bot_data:set(ban_id.."Comd:New:rt:bot:"..textn..msg.chat_id_,text)
send(msg.chat_id_, msg.id_, " ⌯︙ تـم اضـافـه الامـر") 
bot_data:del(ban_id.."Comd:New"..msg.chat_id_..""..msg.sender_user_id_) 
return false  
end 
end
if text and text:match('رفع (.*)') and tonumber(msg.reply_to_message_id_) > 0 and Mod(msg) then 
local RTPA = text:match('رفع (.*)')
if AddChannel(msg.sender_user_id_) == false then
local textchuser = bot_data:get(ban_id..'text:ch:user')
if textchuser then
send(msg.chat_id_, msg.id_,'['..textchuser..']')
else
send(msg.chat_id_, msg.id_,' ⌯︙ لا تستطيع استخدام البوت \n ⌯︙  يرجى الاشتراك بالقناه اولا \n ⌯︙  اشترك هنا ['..bot_data:get(ban_id..'add:ch:username')..']')
end
return false
end
if bot_data:sismember(ban_id..'Coomds'..msg.chat_id_,RTPA) then
function by_reply(extra, result, success)   
tdcli_function ({ID = "GetUser",user_id_ = result.sender_user_id_},function(arg,data) 
local blakrt = bot_data:get(ban_id.."Comd:New:rt:bot:"..RTPA..msg.chat_id_)
if blakrt == 'مميز' and Mod(msg) then
send(msg.chat_id_, msg.id_,'\n ⌯︙ الـعـضو   ⋖ ['..data.first_name_..'](t.me/'..(data.username_ or 'g_00_l_d')..')'..'\n ⌯︙ تم رفعه '..RTPA..'\n')   
bot_data:set(ban_id.."Comd:New:rt:user:"..msg.chat_id_..result.sender_user_id_,RTPA) 
bot_data:sadd(ban_id..'Special:User'..msg.chat_id_,result.sender_user_id_)  
elseif blakrt == 'ادمن' and Manager(msg) then 
send(msg.chat_id_, msg.id_,'\n ⌯︙ الـعـضو   ⋖ ['..data.first_name_..'](t.me/'..(data.username_ or 'g_00_l_d')..')'..'\n ⌯︙ تم رفعه '..RTPA..'\n')   
bot_data:set(ban_id.."Comd:New:rt:user:"..msg.chat_id_..result.sender_user_id_,RTPA)
bot_data:sadd(ban_id..'Mod:User'..msg.chat_id_,result.sender_user_id_)  
elseif blakrt == 'مدير' and Constructor(msg) then
send(msg.chat_id_, msg.id_,'\n ⌯︙ الـعـضو   ⋖ ['..data.first_name_..'](t.me/'..(data.username_ or 'g_00_l_d')..')'..'\n ⌯︙ تم رفعه '..RTPA..'\n')   
bot_data:set(ban_id.."Comd:New:rt:user:"..msg.chat_id_..result.sender_user_id_,RTPA)  
bot_data:sadd(ban_id..'Manager'..msg.chat_id_,result.sender_user_id_)  
elseif blakrt == 'عضو' and Mod(msg) then
send(msg.chat_id_, msg.id_,'\n ⌯︙ الـعـضو   ⋖ ['..data.first_name_..'](t.me/'..(data.username_ or 'g_00_l_d')..')'..'\n ⌯︙ تم رفعه '..RTPA..'\n')   
end
end,nil)   
end   
tdcli_function ({ ID = "GetMessage", chat_id_ = msg.chat_id_, message_id_ = tonumber(msg.reply_to_message_id_) }, by_reply, nil)
end
end
if text and text:match('تنزيل (.*)') and tonumber(msg.reply_to_message_id_) > 0 and Mod(msg) then 
local RTPA = text:match('تنزيل (.*)')
if AddChannel(msg.sender_user_id_) == false then
local textchuser = bot_data:get(ban_id..'text:ch:user')
if textchuser then
send(msg.chat_id_, msg.id_,'['..textchuser..']')
else
send(msg.chat_id_, msg.id_,' ⌯︙ لا تستطيع استخدام البوت \n ⌯︙  يرجى الاشتراك بالقناه اولا \n ⌯︙  اشترك هنا ['..bot_data:get(ban_id..'add:ch:username')..']')
end
return false
end
if bot_data:sismember(ban_id..'Coomds'..msg.chat_id_,RTPA) then
function by_reply(extra, result, success)   
tdcli_function ({ID = "GetUser",user_id_ = result.sender_user_id_},function(arg,data) 
local blakrt = bot_data:get(ban_id.."Comd:New:rt:bot:"..RTPA..msg.chat_id_)
if blakrt == 'مميز' and Mod(msg) then
send(msg.chat_id_, msg.id_,'\n ⌯︙ الـعـضو   ⋖ ['..data.first_name_..'](t.me/'..(data.username_ or 'g_00_l_d')..')'..'\n ⌯︙ م تنزيله من '..RTPA..'\n')   
bot_data:srem(ban_id..'Special:User'..msg.chat_id_,result.sender_user_id_)  
bot_data:del(ban_id.."Comd:New:rt:user:"..msg.chat_id_..result.sender_user_id_)
elseif blakrt == 'ادمن' and Manager(msg) then 
send(msg.chat_id_, msg.id_,'\n ⌯︙ الـعـضو   ⋖ ['..data.first_name_..'](t.me/'..(data.username_ or 'g_00_l_d')..')'..'\n ⌯︙ تم تنزيله من '..RTPA..'\n')   
bot_data:srem(ban_id..'Mod:User'..msg.chat_id_,result.sender_user_id_) 
bot_data:del(ban_id.."Comd:New:rt:user:"..msg.chat_id_..result.sender_user_id_)
elseif blakrt == 'مدير' and Constructor(msg) then
send(msg.chat_id_, msg.id_,'\n ⌯︙ الـعـضو   ⋖ ['..data.first_name_..'](t.me/'..(data.username_ or 'g_00_l_d')..')'..'\n ⌯︙  تم تنزيله من '..RTPA..'\n')   
bot_data:srem(ban_id..'Manager'..msg.chat_id_,result.sender_user_id_)  
bot_data:del(ban_id.."Comd:New:rt:user:"..msg.chat_id_..result.sender_user_id_)
elseif blakrt == 'عضو' and Mod(msg) then
send(msg.chat_id_, msg.id_,'\n ⌯︙ الـعـضو   ⋖ ['..data.first_name_..'](t.me/'..(data.username_ or 'g_00_l_d')..')'..'\n ⌯︙ تم تنزيله من '..RTPA..'\n')   
end
end,nil)   
end   
tdcli_function ({ ID = "GetMessage", chat_id_ = msg.chat_id_, message_id_ = tonumber(msg.reply_to_message_id_) }, by_reply, nil)
end
end
if text and text:match('^رفع (.*) @(.*)') and Mod(msg) then 
local text1 = {string.match(text, "^(رفع) (.*) @(.*)$")}
if AddChannel(msg.sender_user_id_) == false then
local textchuser = bot_data:get(ban_id..'text:ch:user')
if textchuser then
send(msg.chat_id_, msg.id_,'['..textchuser..']')
else
send(msg.chat_id_, msg.id_,' ⌯︙ لا تستطيع استخدام البوت \n ⌯︙  يرجى الاشتراك بالقناه اولا \n ⌯︙  اشترك هنا ['..bot_data:get(ban_id..'add:ch:username')..']')
end
return false
end
if bot_data:sismember(ban_id..'Coomds'..msg.chat_id_,text1[2]) then
function py_username(extra, result, success)   
if result.id_ then
local blakrt = bot_data:get(ban_id.."Comd:New:rt:bot:"..text1[2]..msg.chat_id_)
if blakrt == 'مميز' and Mod(msg) then
send(msg.chat_id_, msg.id_,'\n ⌯︙ الـعـضو   ⋖ ['..result.title_..'](t.me/'..(text1[3] or 'g_00_l_d')..')'..'\n ⌯︙ تم رفعه '..text1[2]..'')   
bot_data:sadd(ban_id..'Special:User'..msg.chat_id_,result.id_)  
bot_data:set(ban_id.."Comd:New:rt:user:"..msg.chat_id_..result.id_,text1[2])
elseif blakrt == 'ادمن' and Manager(msg) then 
send(msg.chat_id_, msg.id_,'\n ⌯︙ الـعـضو   ⋖ ['..result.title_..'](t.me/'..(text1[3] or 'g_00_l_d')..')'..'\n ⌯︙ تم رفعه '..text1[2]..'')   
bot_data:sadd(ban_id..'Mod:User'..msg.chat_id_,result.id_)  
bot_data:set(ban_id.."Comd:New:rt:user:"..msg.chat_id_..result.id_,text1[2])
elseif blakrt == 'مدير' and Constructor(msg) then
send(msg.chat_id_, msg.id_,'\n ⌯︙ الـعـضو   ⋖ ['..result.title_..'](t.me/'..(text1[3] or 'g_00_l_d')..')'..'\n ⌯︙ تم رفعه '..text1[2]..'')   
bot_data:sadd(ban_id..'Manager'..msg.chat_id_,result.id_)  
bot_data:set(ban_id.."Comd:New:rt:user:"..msg.chat_id_..result.id_,text1[2])
elseif blakrt == 'عضو' and Mod(msg) then
send(msg.chat_id_, msg.id_,'\n ⌯︙ الـعـضو   ⋖ ['..result.title_..'](t.me/'..(text1[3] or 'g_00_l_d')..')'..'\n ⌯︙ تم رفعه '..text1[2]..'')   
end
else
info = ' ⌯︙ المعرف غلط'
send(msg.chat_id_, msg.id_,info)
end
end
tdcli_function ({ID = "SearchPublicChat",username_ = text1[3]},py_username,nil) 
end 
end
if text and text:match('^تنزيل (.*) @(.*)') and Mod(msg) then 
local text1 = {string.match(text, "^(تنزيل) (.*) @(.*)$")}
if AddChannel(msg.sender_user_id_) == false then
local textchuser = bot_data:get(ban_id..'text:ch:user')
if textchuser then
send(msg.chat_id_, msg.id_,'['..textchuser..']')
else
send(msg.chat_id_, msg.id_,' ⌯︙ لا تستطيع استخدام البوت \n ⌯︙  يرجى الاشتراك بالقناه اولا \n ⌯︙  اشترك هنا ['..bot_data:get(ban_id..'add:ch:username')..']')
end
return false
end
if bot_data:sismember(ban_id..'Coomds'..msg.chat_id_,text1[2]) then
function py_username(extra, result, success)   
if result.id_ then
local blakrt = bot_data:get(ban_id.."Comd:New:rt:bot:"..text1[2]..msg.chat_id_)
if blakrt == 'مميز' and Mod(msg) then
send(msg.chat_id_, msg.id_,'\n ⌯︙ الـعـضو   ⋖ ['..result.title_..'](t.me/'..(text1[3] or 'g_00_l_d')..')'..'\n ⌯︙ تم تنريله من '..text1[2]..'')   
bot_data:srem(ban_id..'Special:User'..msg.chat_id_,result.id_)  
bot_data:del(ban_id.."Comd:New:rt:user:"..msg.chat_id_..result.id_)
elseif blakrt == 'ادمن' and Manager(msg) then 
send(msg.chat_id_, msg.id_,'\n ⌯︙ الـعـضو   ⋖ ['..result.title_..'](t.me/'..(text1[3] or 'g_00_l_d')..')'..'\n ⌯︙ تم تنريله من '..text1[2]..'')   
bot_data:srem(ban_id..'Mod:User'..msg.chat_id_,result.id_)  
bot_data:del(ban_id.."Comd:New:rt:user:"..msg.chat_id_..result.id_)
elseif blakrt == 'مدير' and Constructor(msg) then
send(msg.chat_id_, msg.id_,'\n ⌯︙ الـعـضو   ⋖ ['..result.title_..'](t.me/'..(text1[3] or 'g_00_l_d')..')'..'\n ⌯︙ تم تنريله من '..text1[2]..'')   
bot_data:srem(ban_id..'Manager'..msg.chat_id_,result.id_)  
bot_data:del(ban_id.."Comd:New:rt:user:"..msg.chat_id_..result.id_)
elseif blakrt == 'عضو' and Mod(msg) then
send(msg.chat_id_, msg.id_,'\n ⌯︙ الـعـضو   ⋖ ['..result.title_..'](t.me/'..(text1[3] or 'g_00_l_d')..')'..'\n ⌯︙ تم تنريله من '..text1[2]..'')   
end
else
info = ' ⌯︙ المعرف غلط'
send(msg.chat_id_, msg.id_,info)
end
end
tdcli_function ({ID = "SearchPublicChat",username_ = text1[3]},py_username,nil) 
end  
end
if text == "مسح رسايلي" or text == "مسح رسائلي" or text == "مسح رسايلي" or text == "مسح رسائلي" then  
send(msg.chat_id_, msg.id_,' ⌯︙ تم مسح رسائلك'  )  
bot_data:del(ban_id..'Msg_User'..msg.chat_id_..':'..msg.sender_user_id_) 
end
if text == "رسايلي" or text == "رسائلي" or text == "msg" then 
if AddChannel(msg.sender_user_id_) == false then
local textchuser = bot_data:get(ban_id..'text:ch:user')
if textchuser then
send(msg.chat_id_, msg.id_,'['..textchuser..']')
else
send(msg.chat_id_, msg.id_,' ⌯︙ لا تستطيع استخدام البوت \n ⌯︙  يرجى الاشتراك بالقناه اولا \n ⌯︙  اشترك هنا ['..bot_data:get(ban_id..'add:ch:username')..']')
end
return false
end
send(msg.chat_id_, msg.id_,' ⌯︙ عدد رسائلك  ⋖ { '..bot_data:get(ban_id..'Msg_User'..msg.chat_id_..':'..msg.sender_user_id_)..'}' ) 
end 
if text == 'تفعيل الاذاعه' and SudoBot(msg) then  
if bot_data:get(ban_id..'Bc:Bots') then
bot_data:del(ban_id..'Bc:Bots') 
Text = '\n ⌯︙ تم تفعيل الاذاعه' 
else
Text = '\n ⌯︙ بالتاكيد تم تفعيل الاذاعه'
end
send(msg.chat_id_, msg.id_,Text) 
end
if text == 'تعطيل الاذاعه' and SudoBot(msg) then  
if not bot_data:get(ban_id..'Bc:Bots') then
bot_data:set(ban_id..'Bc:Bots',true) 
Text = '\n ⌯︙ تم تعطيل الاذاعه' 
else
Text = '\n ⌯︙  بالتاكيد تم تعطيل الاذاعه'
end
send(msg.chat_id_, msg.id_,Text) 
end
if text == 'تفعيل التواصل' and SudoBot(msg) then  
if bot_data:get(ban_id..'Tuasl:Bots') then
bot_data:del(ban_id..'Tuasl:Bots') 
Text = '\n ⌯︙ تم تفعيل التواصل' 
else
Text = '\n ⌯︙ بالتاكيد تم تفعيل التواصل'
end
send(msg.chat_id_, msg.id_,Text) 
end
if text == 'تعطيل التواصل' and SudoBot(msg) then  
if not bot_data:get(ban_id..'Tuasl:Bots') then
bot_data:set(ban_id..'Tuasl:Bots',true) 
Text = '\n ⌯︙ تم تعطيل التواصل' 
else
Text = '\n ⌯︙ بالتاكيد تم تعطيل التواصل'
end
send(msg.chat_id_, msg.id_,Text) 
end
if text == 'تفعيل البوت الخدمي' and SudoBot(msg) then  
if AddChannel(msg.sender_user_id_) == false then
local textchuser = bot_data:get(ban_id..'text:ch:user')
if textchuser then
send(msg.chat_id_, msg.id_,'['..textchuser..']')
else
send(msg.chat_id_, msg.id_,' ⌯︙ لا تستطيع استخدام البوت \n ⌯︙  يرجى الاشتراك بالقناه اولا \n ⌯︙  اشترك هنا ['..bot_data:get(ban_id..'add:ch:username')..']')
end
return false
end
if bot_data:get(ban_id..'Free:Bots') then
bot_data:del(ban_id..'Free:Bots') 
Text = '\n ⌯︙ تم تفعيل البوت الخدمي' 
else
Text = '\n ⌯︙ بالتاكيد تم تفعيل البوت الخدمي'
end
send(msg.chat_id_, msg.id_,Text) 
end
if text == 'تعطيل البوت الخدمي' and SudoBot(msg) then  
if AddChannel(msg.sender_user_id_) == false then
local textchuser = bot_data:get(ban_id..'text:ch:user')
if textchuser then
send(msg.chat_id_, msg.id_,'['..textchuser..']')
else
send(msg.chat_id_, msg.id_,' ⌯︙ لا تستطيع استخدام البوت \n ⌯︙  يرجى الاشتراك بالقناه اولا \n ⌯︙  اشترك هنا ['..bot_data:get(ban_id..'add:ch:username')..']')
end
return false
end
if not bot_data:get(ban_id..'Free:Bots') then
bot_data:set(ban_id..'Free:Bots',true) 
Text = '\n ⌯︙ تم تعطيل البوت الخدمي' 
else
Text = '\n ⌯︙ بالتاكيد تم تعطيل البوت الخدمي'
end
send(msg.chat_id_, msg.id_,Text) 
end
if text and text:match('^مسح (%d+)$') and Manager(msg) then
if not bot_data:get(ban_id..'Boody:Delete:Time'..msg.chat_id_..':'..msg.sender_user_id_) then           
local num = tonumber(text:match('^مسح (%d+)$')) 
if AddChannel(msg.sender_user_id_) == false then
local textchuser = bot_data:get(ban_id..'text:ch:user')
if textchuser then
send(msg.chat_id_, msg.id_,'['..textchuser..']')
else
send(msg.chat_id_, msg.id_,' ⌯︙ لا تستطيع استخدام البوت \n ⌯︙  يرجى الاشتراك بالقناه اولا \n ⌯︙  اشترك هنا ['..bot_data:get(ban_id..'add:ch:username')..']')
end
return false
end
if num > 1000 then 
send(msg.chat_id_, msg.id_,' ⌯︙تستطيع التنظيف 1000 رساله كحد اقصى') 
return false  
end  
local msgm = msg.id_
for i=1,tonumber(num) do
DeleteMessage(msg.chat_id_, {[0] = msgm})
msgm = msgm - 1048576
end
send(msg.chat_id_,msg.id_,' ⌯︙ تم مسح {'..num..'}')  
bot_data:setex(ban_id..'Boody:Delete:Time'..msg.chat_id_..':'..msg.sender_user_id_,300,true)
end
end
if text == "تنظيف الميديا" and Manager(msg) then
msgm = {[0]=msg.id_}
local Message = msg.id_
for i=1,100 do
Message = Message - 1048576
msgm[i] = Message
end
tdcli_function({ID = "GetMessages",chat_id_ = msg.chat_id_,message_ids_ = msgm},function(arg,data)
new = 0
msgm2 = {}
for i=0 ,data.total_count_ do
if data.messages_[i] and data.messages_[i].content_ and data.messages_[i].content_.ID ~= "MessageText" then
msgm2[new] = data.messages_[i].id_
new = new + 1
end
end
DeleteMessage(msg.chat_id_,msgm2)
end,nil)  
send(msg.chat_id_, msg.id_," ⌯︙ تم تنظيف جميع الميديا")
end
if (msg.content_.animation_) or (msg.content_.photo_) or (msg.content_.video_) or (msg.content_.document) or (msg.content_.sticker_) and msg.reply_to_message_id_ == 0 then
bot_data:sadd(ban_id.."Boody:allM"..msg.chat_id_, msg.id_)
end
if text == ("امسح") and cleaner(msg) then  
local list = bot_data:smembers(ban_id.."Boody:allM"..msg.chat_id_)
for k,v in pairs(list) do
local Message = v
if Message then
t = " ⌯︙ تم مسح "..k.." من الوسائط الموجوده"
DeleteMessage(msg.chat_id_,{[0]=Message})
bot_data:del(ban_id.."Boody:allM"..msg.chat_id_)
end
end
if #list == 0 then
t = " ⌯︙ لا يوجد ميديا في المجموعه"
end
send(msg.chat_id_, msg.id_, t)
end
if text == ("عدد الميديا") and cleaner(msg) then  
local num = bot_data:smembers(ban_id.."Boody:allM"..msg.chat_id_)
for k,v in pairs(num) do
local numl = v
if numl then
l = " ⌯︙ عدد الميديا الموجود هو "..k
end
end
if #num == 0 then
l = " ⌯︙ لا يوجد ميديا في المجموعه"
end
send(msg.chat_id_, msg.id_, l)
end
if text == "تنظيف التعديل" and Manager(msg) then
Msgs = {[0]=msg.id_}
local Message = msg.id_
for i=1,100 do
Message = Message - 1048576
Msgs[i] = Message
end
tdcli_function({ID = "GetMessages",chat_id_ = msg.chat_id_,message_ids_ = Msgs},function(arg,data)
new = 0
Msgs2 = {}
for i=0 ,data.total_count_ do
if data.messages_[i] and (not data.messages_[i].edit_date_ or data.messages_[i].edit_date_ ~= 0) then
Msgs2[new] = data.messages_[i].id_
new = new + 1
end
end
DeleteMessage(msg.chat_id_,Msgs2)
end,nil)  
send(msg.chat_id_, msg.id_,' ⌯︙ تم تنظيف جميع الرسائل المعدله')
end
if text == "تغير اسم البوت" or text == "تغيير اسم البوت" then 
if Devban(msg) then
if AddChannel(msg.sender_user_id_) == false then
local textchuser = bot_data:get(ban_id..'text:ch:user')
if textchuser then
send(msg.chat_id_, msg.id_,'['..textchuser..']')
else
send(msg.chat_id_, msg.id_,' ⌯︙ لا تستطيع استخدام البوت \n ⌯︙  يرجى الاشتراك بالقناه اولا \n ⌯︙  اشترك هنا ['..bot_data:get(ban_id..'add:ch:username')..']')
end
return false
end
bot_data:setex(ban_id..'Set:Name:Bot'..msg.sender_user_id_,300,true) 
send(msg.chat_id_, msg.id_," ⌯︙ ارسل لي الاسم الان ")  
end
return false
end
if msg.content_.ID == "MessageChatJoinByLink" then
print("This is [ Msg Join By link ]")
if bot_data:get(ban_id.."UnKedDeleteMessage"..msg.chat_id_) == "open" then
local Text = 'اهلاً بك في المجموعة\n للتأكد بأنك لست { ربوت }\n تم تقييدك اضغط الزر بالاسفل\n للتأكد انك { عضو حقيقي }\n'
keyboard = {}
keyboard.inline_keyboard = {{{text = '- اضغط هنا لفك تقييدك •', callback_data="/UnKed"},},}
local msg_id = msg.id_/2097152/0.5
https.request("https://api.telegram.org/bot"..tokenbot.."/restrictChatMember?chat_id="..msg.chat_id_.."&user_id="..msg.sender_user_id_)
bot_data:sadd(ban_id.."bot_data:Un:Ked"..msg.chat_id_,msg.sender_user_id_)
https.request("https://api.telegram.org/bot"..tokenbot..'/sendMessage?chat_id=' .. msg.chat_id_ .. '&text=' .. URL.escape(Text).."&reply_to_message_id="..Msg_id.."&parse_mode=markdown&disable_web_page_preview=true&reply_markup="..JSON.encode(keyboard))
return false
end
msg_type = 'MSG:NewUser'
end


if text == ""..(bot_data:get(ban_id..'Name:Bot') or 'جولد').."" then  
Namebot = (bot_data:get(ban_id..'Name:Bot') or 'جولد')
local KLAER_Msg = {
'ننعم يروحي 😻??',
'نعم يا قلب  '..Namebot..'',
'عاوز اي من '..Namebot..'',
'دوختو  '..Namebot..'',
'بتشقط وجي ويت 🤪',
'ايوا جاي 🙈',
'يعم هتسحر واجي 😾',
'طب متصلي على النبي كدا 🙂💜',
'تع اشرب شاي 🥺💙',
'دوس على الخوخه 🍑',
'متيجي 😉',
'ياض خش نام 😂',
'انا '..Namebot..' احسن البوتات 🤩♥️',
'نعم'
} 
Namebot = KLAER_Msg[math.random(#KLAER_Msg)] 
local msg_id = msg.id_/2097152/0.5 
local texxtt = ''..Namebot..''
keyboard = {} 
keyboard.inline_keyboard = {
{
{text = texxtt, url="http://t.me/"..username},
},
{
{text = 'اضف البوت في مجموعتك ✅' ,url="t.me/"..dofile("./Info.lua").botUserName.."?startgroup=start"},
},
}
local function getpro(extra, result, success) 
if result.photos_[0] then 
https.request("https://api.telegram.org/bot"..token..'/sendPhoto?chat_id=' .. msg.chat_id_ .. '&photo='..result.photos_[0].sizes_[1].photo_.persistent_id_..'&caption=' .. URL.escape(Namebot).."&reply_to_message_id="..msg_id.."&parse_mode=markdown&disable_web_page_preview=true&reply_markup="..JSON.encode(keyboard)) 
else 
send(msg.chat_id_, msg.id_,Namebot, 1, 'md') 
end 
end 
tdcli_function ({ ID = "GetUserProfilePhotos", user_id_ = ban_id, offset_ = 0, limit_ = 1 }, getpro, nil) 
end
if text == "بوت" then
local Namebot = (bot_data:get(ban_id..'Name:Bot') or 'جولد') 
local KLAER_Msg = { 
'اسمي  '..Namebot..' . ',
} 
Namebot = KLAER_Msg[math.random(#KLAER_Msg)] 
local msg_id = msg.id_/2097152/0.5  
local texxtt =   ''..Namebot..''
keyboard = {} 
keyboard.inline_keyboard = {
{
{text = texxtt, url="http://t.me/"..username},
},
{
{text = 'اضف البوت في مجموعتك ✅' ,url="t.me/"..dofile("./Info.lua").botUserName.."?startgroup=start"},
},
}
local function getpro(extra, result, success) 
if result.photos_[0] then 
https.request("https://api.telegram.org/bot"..token..'/sendPhoto?chat_id=' .. msg.chat_id_ .. '&photo='..result.photos_[0].sizes_[1].photo_.persistent_id_..'&photo=' .. URL.escape(Namebot).."&photo="..msg_id.."&parse_mode=markdown&disable_web_page_preview=true&reply_markup="..JSON.encode(keyboard)) 
else 
send(msg.chat_id_, msg.id_,Namebot, 1, 'md') 
end 
end 
tdcli_function ({ ID = "GetUserProfilePhotos", user_id_ = ban_id, offset_ = 0, limit_ = 1 }, getpro, nil) 
end
if text == "تعطيل الاذاعه" and SudoBot(msg) then 
bot_data:set(ban_id.."Status:Ss",true) 
send(msg.chat_id_, msg.id_,"\n٭ تم تعطيل الاذاعه") 
return false
end 

if text=="اذاعه عام" and msg.reply_to_message_id_ == 0 and SudoBot(msg) then 
if bot_data:get(ban_id.."Status:Ss") and not SudoBot(msg) then 
send(msg.chat_id_, msg.id_,"٭ الاذاعه معطله من قبل المطور الاساسي")
return false
end
bot_data:setex(ban_id.."Ss:Cs" .. msg.chat_id_ .. ":" .. msg.sender_user_id_, 600, true) 
send(msg.chat_id_, msg.id_,"٭ ارسل لي سواء ~ { ملصق, متحركه, صوره, رساله }\n٭ للخروج ارسل الغاء ") 
return false
end 

if bot_data:get(ban_id.."Ss:Cs" .. msg.chat_id_ .. ":" .. msg.sender_user_id_) then 
if text == "الغاء" or text == "الغاء" then 
send(msg.chat_id_, msg.id_,"٭ تم الغاء الاذاعه") 
bot_data:del(ban_id.."Ss:Cs" .. msg.chat_id_ .. ":" .. msg.sender_user_id_) 
return false
end 
local list = bot_data:smembers(ban_id..'UsersBot') 
if msg.content_.text_ then
for k,v in pairs(list) do 
send(v, 0,"["..msg.content_.text_.."]") 
end
elseif msg.content_.photo_ then
if msg.content_.photo_.sizes_[0] then
photo = msg.content_.photo_.sizes_[0].photo_.persistent_id_
elseif msg.content_.photo_.sizes_[1] then
photo = msg.content_.photo_.sizes_[1].photo_.persistent_id_
end
for k,v in pairs(list) do 
sendPhoto(v, 0, photo,(msg.content_.caption_ or ""))
end 
elseif msg.content_.animation_ then
for k,v in pairs(list) do 
sendDocument(v, 0, msg.content_.animation_.animation_.persistent_id_,(msg.content_.caption_ or "")) 
end 
elseif msg.content_.sticker_ then
for k,v in pairs(list) do 
sendSticker(v, 0, msg.content_.sticker_.sticker_.persistent_id_) 
end 
end
send(msg.chat_id_, msg.id_,"٭ تمت الاذاعه الى المشتركين والمجموعات ") 
bot_data:del(ban_id.."Ss:Cs" .. msg.chat_id_ .. ":" .. msg.sender_user_id_) 
return false
end
if text=="اذاعه بالتوجيه" and msg.reply_to_message_id_ == 0  and msa3d(msg) then 
if bot_data:get(ban_id..'Bc:Bots') and not Devban(msg) then 
send(msg.chat_id_, msg.id_,' ⌯︙ الاذاعه معطله من قبل المطور الاساسي')
return false
end
if AddChannel(msg.sender_user_id_) == false then
local textchuser = bot_data:get(ban_id..'text:ch:user')
if textchuser then
send(msg.chat_id_, msg.id_,'['..textchuser..']')
else
send(msg.chat_id_, msg.id_,' ⌯︙ لا تستطيع استخدام البوت \n ⌯︙  يرجى الاشتراك بالقناه اولا \n ??  اشترك هنا ['..bot_data:get(ban_id..'add:ch:username')..']')
end
return false
end
bot_data:setex(ban_id.."Send:Fwd:Grops" .. msg.chat_id_ .. ":" .. msg.sender_user_id_, 600, true) 
send(msg.chat_id_, msg.id_," ⌯︙ ارسل لي التوجيه الان") 
return false
end 
if text=="اذاعه بالتوجيه خاص" and msg.reply_to_message_id_ == 0  and msa3d(msg) then 
if bot_data:get(ban_id..'Bc:Bots') and not Devban(msg) then 
send(msg.chat_id_, msg.id_,' ⌯︙  الاذاعه معطله من قبل المطور الاساسي')
return false
end
if AddChannel(msg.sender_user_id_) == false then
local textchuser = bot_data:get(ban_id..'text:ch:user')
if textchuser then
send(msg.chat_id_, msg.id_,'['..textchuser..']')
else
send(msg.chat_id_, msg.id_,' ⌯︙ لا تستطيع استخدام البوت \n ⌯︙  يرجى الاشتراك بالقناه اولا \n ⌯︙  اشترك هنا ['..bot_data:get(ban_id..'add:ch:username')..']')
end
return false
end
bot_data:setex(ban_id.."Send:Fwd:Pv" .. msg.chat_id_ .. ":" .. msg.sender_user_id_, 600, true) 
send(msg.chat_id_, msg.id_," ⌯︙ ارسل لي التوجيه الان") 
return false
end 
if text and text:match('^ضع اسم (.*)') and Manager(msg) or text and text:match('^وضع اسم (.*)') and Manager(msg) then 
local Name = text:match('^ضع اسم (.*)') or text and text:match('^وضع اسم (.*)') 
if AddChannel(msg.sender_user_id_) == false then
local textchuser = bot_data:get(ban_id..'text:ch:user')
if textchuser then
send(msg.chat_id_, msg.id_,'['..textchuser..']')
else
send(msg.chat_id_, msg.id_,' ⌯︙ لا تستطيع استخدام البوت \n ⌯︙  يرجى الاشتراك بالقناه اولا \n ⌯︙  اشترك هنا ['..bot_data:get(ban_id..'add:ch:username')..']')
end
return false
end
tdcli_function ({ ID = "ChangeChatTitle",chat_id_ = msg.chat_id_,title_ = Name },function(arg,data) 
if data.message_ == "Channel chat title can be changed by administrators only" then
send(msg.chat_id_,msg.id_," ⌯︙ البوت ليس ادمن يرجى ترقيتي !")  
return false  
end 
if data.message_ == "CHAT_ADMIN_REQUIRED" then
send(msg.chat_id_,msg.id_," ⌯︙ ليست لدي صلاحية تغير اسم الجروب")  
else
sebd(msg.chat_id_,msg.id_,' ⌯︙ تم تغيير اسم الجروب الى {[「'..Name..'」]}')  
end
end,nil) 
end

if text and text:match("^تنزيل الكل @(.*)$") and Manager(msg) then
if AddChannel(msg.sender_user_id_) == false then
local textchuser = bot_data:get(ban_id..'text:ch:user')
if textchuser then
send(msg.chat_id_, msg.id_,'['..textchuser..']')
else
send(msg.chat_id_, msg.id_,' ⦁ لا تستطيع استخدام البوت \n ⦁  يرجى الاشتراك بالقناه اولا \n ⦁  اشترك هنا ['..bot_data:get(ban_id..'add:ch:username')..']')
end
return false
end
function start_function(extra, result, success)
if (result.id_) then
if tonumber(result.id_) == true then
send(msg.chat_id_, msg.id_," ⦁ لا تستطيع تنزيل المطور الاساسي")
return false 
end
if bot_data:sismember(ban_id.."Sudo:User",result.id_) then
dev = "المطور ،" else dev = "" end
if bot_data:sismember(ban_id.."CoSu",result.id_) then
cu = "مالك ،" else cu = "" end
if bot_data:sismember(ban_id.."Basic:Constructor"..msg.chat_id_, result.id_) then
crr = "منشئ اساسي ،" else crr = "" end
if bot_data:sismember(ban_id..'Constructor'..msg.chat_id_, result.id_) then
cr = "منشئ ،" else cr = "" end
if bot_data:sismember(ban_id..'Manager'..msg.chat_id_, result.id_) then
own = "مدير ،" else own = "" end
if bot_data:sismember(ban_id..'S00F4:MN:TF'..msg.chat_id_, result.id_) then
mn = 'منظف ،' else mn = '' end
if bot_data:sismember(ban_id..'Mod:User'..msg.chat_id_, result.id_) then
mod = "ادمن ،" else mod = "" end
if bot_data:sismember(ban_id..'Special:User'..msg.chat_id_, result.id_) then
vip = "مميز ،" else vip = ""
end
if Can_or_NotCan(result.id_,msg.chat_id_) ~= false then
send(msg.chat_id_, msg.id_,"\n ⦁ تم تنزيل الشخص من الرتب التاليه \n ⦁  { "..dev..""..crr..""..cr..""..own..""..mod..""..mn..""..vip.." } \n")
else
send(msg.chat_id_, msg.id_,"\n ⦁  عذرا الـعـضو  لايملك رتبه \n")
end
if tonumber(msg.sender_user_id_) == true then
bot_data:srem(ban_id.."Sudo:User", result.id_)
bot_data:srem(ban_id.."CoSu", result.id_)
bot_data:srem(ban_id.."Basic:Constructor"..msg.chat_id_,result.id_)
bot_data:srem(ban_id..'Constructor'..msg.chat_id_, result.id_)
bot_data:srem(ban_id..'Manager'..msg.chat_id_, result.id_)
bot_data:srem(ban_id..'Mod:User'..msg.chat_id_, result.id_)
bot_data:srem(ban_id..'S00F4:MN:TF'..msg.chat_id_, result.id_)
bot_data:srem(ban_id..'Special:User'..msg.chat_id_, result.id_)
elseif bot_data:sismember(ban_id.."Sudo:User",msg.sender_user_id_) then
bot_data:srem(ban_id..'S00F4:MN:TF'..msg.chat_id_, result.id_)
bot_data:srem(ban_id..'Mod:User'..msg.chat_id_, result.id_)
bot_data:srem(ban_id..'Special:User'..msg.chat_id_, result.id_)
bot_data:srem(ban_id..'Manager'..msg.chat_id_, result.id_)
bot_data:srem(ban_id..'Constructor'..msg.chat_id_, result.id_)
bot_data:srem(ban_id.."Basic:Constructor"..msg.chat_id_,result.id_)
elseif bot_data:sismember(ban_id.."CoSu",msg.sender_user_id_) then
bot_data:srem(ban_id..'S00F4:MN:TF'..msg.chat_id_, result.id_)
bot_data:srem(ban_id..'Mod:User'..msg.chat_id_, result.id_)
bot_data:srem(ban_id..'Special:User'..msg.chat_id_, result.id_)
bot_data:srem(ban_id..'Manager'..msg.chat_id_, result.id_)
bot_data:srem(ban_id..'Constructor'..msg.chat_id_, result.id_)
bot_data:srem(ban_id.."Basic:Constructor"..msg.chat_id_,result.id_)
elseif bot_data:sismember(ban_id.."Basic:Constructor"..msg.chat_id_, msg.sender_user_id_) then
bot_data:srem(ban_id..'S00F4:MN:TF'..msg.chat_id_, result.id_)
bot_data:srem(ban_id..'Mod:User'..msg.chat_id_, result.id_)
bot_data:srem(ban_id..'Special:User'..msg.chat_id_, result.id_)
bot_data:srem(ban_id..'Manager'..msg.chat_id_, result.id_)
bot_data:srem(ban_id..'Constructor'..msg.chat_id_, result.id_)
elseif bot_data:sismember(ban_id..'Constructor'..msg.chat_id_, msg.sender_user_id_) then
bot_data:srem(ban_id..'S00F4:MN:TF'..msg.chat_id_, result.id_)
bot_data:srem(ban_id..'Mod:User'..msg.chat_id_, result.id_)
bot_data:srem(ban_id..'Special:User'..msg.chat_id_, result.id_)
bot_data:srem(ban_id..'Manager'..msg.chat_id_, result.id_)
elseif bot_data:sismember(ban_id..'Manager'..msg.chat_id_, msg.sender_user_id_) then
bot_data:srem(ban_id..'S00F4:MN:TF'..msg.chat_id_, result.id_)
bot_data:srem(ban_id..'Mod:User'..msg.chat_id_, result.id_)
bot_data:srem(ban_id..'Special:User'..msg.chat_id_, result.id_)
end
end
end
tdcli_function ({ID = "SearchPublicChat",username_ = text:match("^تنزيل الكل @(.*)$")}, start_function, nil)
end

if text == ("تنزيل الكل") and msg.reply_to_message_id_ ~= 0 and Manager(msg) then
if AddChannel(msg.sender_user_id_) == false then
local textchuser = bot_data:get(ban_id..'text:ch:user')
if textchuser then
send(msg.chat_id_, msg.id_,'['..textchuser..']')
else
send(msg.chat_id_, msg.id_,' ⦁ لا تستطيع استخدام البوت \n ⦁  يرجى الاشتراك بالقناه اولا \n ⦁  اشترك هنا ['..bot_data:get(ban_id..'add:ch:username')..']')
end
return false
end
function start_function(extra, result, success)
if tonumber(SUDO) == tonumber(result.sender_user_id_) then
send(msg.chat_id_, msg.id_," ⦁ لا تستطيع تنزيل المطور الاساسي")
return false 
end
if bot_data:sismember(ban_id..'Sudo:User',result.sender_user_id_) then
dev = 'المطور ،' else dev = '' end
if bot_data:sismember(ban_id..'CoSu'..msg.chat_id_, result.sender_user_id_) then
cu = 'مالك ،' else cu = '' end
if bot_data:sismember(ban_id..'Basic:Constructor'..msg.chat_id_, result.sender_user_id_) then
crr = 'منشئ اساسي ،' else crr = '' end
if bot_data:sismember(ban_id..'Constructor'..msg.chat_id_, result.sender_user_id_) then
cr = 'منشئ ،' else cr = '' end
if bot_data:sismember(ban_id..'Manager'..msg.chat_id_, result.sender_user_id_) then
own = 'مدير ،' else own = '' end
if bot_data:sismember(ban_id..'onall'..msg.chat_id_, result.sender_user_id_) then
onall = 'مدير عام ،' else  onall = '' end
if bot_data:sismember(ban_id..'Mod:User'..msg.chat_id_, result.sender_user_id_) then
mod = 'ادمن عام ،' else mod = '' end
if bot_data:sismember(ban_id..'S00F4:MN:TF'..msg.chat_id_, result.sender_user_id_) then
mn = 'منظف ،' else mn = '' end
if bot_data:sismember(ban_id..'Mod:User'..msg.chat_id_, result.sender_user_id_) then
mod = 'ادمن ،' else mod = '' end
if bot_data:sismember(ban_id..'Special:User'..msg.chat_id_, result.sender_user_id_) then
vip = 'مميز ،' else vip = ''
end
if Can_or_NotCan(result.sender_user_id_,msg.chat_id_) ~= false then
send(msg.chat_id_, msg.id_,"\n ⦁ تم تنزيل الشخص من الرتب التاليه \n ⦁ { "..dev..''..crr..''..cr..''..own..''..mod..''..mn..''..vip.." } \n")
else
send(msg.chat_id_, msg.id_,"\n ⦁  عذرا الـعـضو  لايملك رتبه \n")
end
if tonumber(SUDO) == tonumber(msg.sender_user_id_) then
bot_data:srem(ban_id..'Sudo:User', result.sender_user_id_)
bot_data:srem(ban_id..'CoSu'..msg.chat_id_, result.sender_user_id_)
bot_data:srem(ban_id..'Basic:Constructor'..msg.chat_id_,result.sender_user_id_)
bot_data:srem(ban_id..'Constructor'..msg.chat_id_, result.sender_user_id_)
bot_data:srem(ban_id..'Manager'..msg.chat_id_, result.sender_user_id_)
bot_data:srem(ban_id..'Mod:User'..msg.chat_id_, result.sender_user_id_)
bot_data:srem(ban_id..'S00F4:MN:TF'..msg.chat_id_, result.sender_user_id_)
bot_data:srem(ban_id..'Special:User'..msg.chat_id_, result.sender_user_id_)
elseif bot_data:sismember(ban_id..'Dev:SoFi:2',msg.sender_user_id_) then
bot_data:srem(ban_id..'S00F4:MN:TF'..msg.chat_id_, result.sender_user_id_)
bot_data:srem(ban_id..'Mod:User'..msg.chat_id_, result.sender_user_id_)
bot_data:srem(ban_id..'Special:User'..msg.chat_id_, result.sender_user_id_)
bot_data:srem(ban_id..'Manager'..msg.chat_id_, result.sender_user_id_)
bot_data:srem(ban_id..'Constructor'..msg.chat_id_, result.sender_user_id_)
bot_data:srem(ban_id..'Basic:Constructor'..msg.chat_id_,result.sender_user_id_)
bot_data:srem(ban_id..'CoSu'..msg.chat_id_, result.sender_user_id_)
elseif bot_data:sismember(ban_id..'Sudo:User',msg.sender_user_id_) then
bot_data:srem(ban_id..'S00F4:MN:TF'..msg.chat_id_, result.sender_user_id_)
bot_data:srem(ban_id..'Mod:User'..msg.chat_id_, result.sender_user_id_)
bot_data:srem(ban_id..'Special:User'..msg.chat_id_, result.sender_user_id_)
bot_data:srem(ban_id..'Manager'..msg.chat_id_, result.sender_user_id_)
bot_data:srem(ban_id..'Constructor'..msg.chat_id_, result.sender_user_id_)
bot_data:srem(ban_id..'Basic:Constructor'..msg.chat_id_,result.sender_user_id_)
bot_data:srem(ban_id..'CoSu'..msg.chat_id_, result.sender_user_id_)
elseif bot_data:sismember(ban_id..'CoSu'..msg.chat_id_, msg.sender_user_id_) then
bot_data:srem(ban_id..'S00F4:MN:TF'..msg.chat_id_, result.sender_user_id_)
bot_data:srem(ban_id..'Mod:User'..msg.chat_id_, result.sender_user_id_)
bot_data:srem(ban_id..'Special:User'..msg.chat_id_, result.sender_user_id_)
bot_data:srem(ban_id..'Manager'..msg.chat_id_, result.sender_user_id_)
bot_data:srem(ban_id..'Constructor'..msg.chat_id_, result.sender_user_id_)
bot_data:srem(ban_id..'Basic:Constructor'..msg.chat_id_,result.sender_user_id_)
elseif bot_data:sismember(ban_id..'Basic:Constructor'..msg.chat_id_, msg.sender_user_id_) then
bot_data:srem(ban_id..'S00F4:MN:TF'..msg.chat_id_, result.sender_user_id_)
bot_data:srem(ban_id..'Mod:User'..msg.chat_id_, result.sender_user_id_)
bot_data:srem(ban_id..'Special:User'..msg.chat_id_, result.sender_user_id_)
bot_data:srem(ban_id..'Manager'..msg.chat_id_, result.sender_user_id_)
bot_data:srem(ban_id..'Constructor'..msg.chat_id_, result.sender_user_id_)
elseif bot_data:sismember(ban_id..'Constructor'..msg.chat_id_, msg.sender_user_id_) then
bot_data:srem(ban_id..'S00F4:MN:TF'..msg.chat_id_, result.sender_user_id_)
bot_data:srem(ban_id..'Mod:User'..msg.chat_id_, result.sender_user_id_)
bot_data:srem(ban_id..'Special:User'..msg.chat_id_, result.sender_user_id_)
bot_data:srem(ban_id..'Manager'..msg.chat_id_, result.sender_user_id_)
elseif bot_data:sismember(ban_id..'Manager'..msg.chat_id_, msg.sender_user_id_) then
bot_data:srem(ban_id..'S00F4:MN:TF'..msg.chat_id_, result.sender_user_id_)
bot_data:srem(ban_id..'Mod:User'..msg.chat_id_, result.sender_user_id_)
bot_data:srem(ban_id..'Special:User'..msg.chat_id_, result.sender_user_id_)
end
end
tdcli_function ({ID = "GetMessage",chat_id_ = msg.chat_id_,message_id_ = tonumber(msg.reply_to_message_id_)}, start_function, nil)
end


------------------------------------------------------------------------
if text and text:match("^قول (.*)$") then
local Textxt = text:match("^قول (.*)$")
send(msg.chat_id_, msg.id_, '['..Textxt..']')
end

if text and text:match("^انطق (.*)$") then   
local textntk = text:match("^انطق (.*)$")   
UrlAntk = https.request('https://apiabs.ml/Antk.php?abs='..URL.escape(textntk)..'')   
Antk = JSON.decode(UrlAntk)   
if UrlAntk.ok ~= false then   
download_to_file("https://translate"..Antk.result.google..Antk.result.code.."UTF-8"..Antk.result.utf..Antk.result.translate.."&tl=ar-IN",Antk.result.translate..'.mp3')    
local curlm = 'curl "'..'https://api.telegram.org/bot'..token..'/sendDocument'..'" -F "chat_id='.. msg.chat_id_ ..'" -F "document=@'..''..textntk..'.mp3'..'"' io.popen(curlm) 
end   
end

if text == "كلمني" then
rpl = {"ها هلاو","انطق","كول"};
sender = rpl[math.random(#rpl)]
local msg_id = msg.id_/2097152/0.5
https.request("https://api.telegram.org/bot"..token..'/sendmessage?chat_id=' .. msg.sender_user_id_ .. '&text=' .. URL.escape(sender))
end
if text == 'حصل' then
local Text = [[
]]
keyboard = {} 
keyboard.inline_keyboard = {
{{text = '𝐓𝐞𝐚𝐦 𝐆𝐨𝐥𝐝', url="t.me/g_00_l_d"}},
}
local msg_id = msg.id_/2097152/0.5
https.request("https://api.telegram.org/bot"..token..'/sendvideo?chat_id=' .. msg.chat_id_ .. '&video=https://t.me/comxnxp/18&caption=' .. URL.escape(Text).."&reply_to_message_id="..msg_id.."&parse_mode=markdown&disable_web_page_preview=true&reply_markup="..JSON.encode(keyboard)) 
end
if text == 'كسمهم' then
local Text = [[
]]
keyboard = {} 
keyboard.inline_keyboard = {
{{text = '𝐓𝐞𝐚𝐦 𝐆𝐨𝐥𝐝', url="t.me/g_00_l_d"}},
}
local msg_id = msg.id_/2097152/0.5
https.request("https://api.telegram.org/bot"..token..'/sendvideo?chat_id=' .. msg.chat_id_ .. '&video=https://t.me/comxnxp/19&caption=' .. URL.escape(Text).."&reply_to_message_id="..msg_id.."&parse_mode=markdown&disable_web_page_preview=true&reply_markup="..JSON.encode(keyboard)) 
end
if text == 'انا جيت' then
local Text = [[
]]
keyboard = {} 
keyboard.inline_keyboard = {
{{text = '𝐓𝐞𝐚𝐦 𝐆𝐨𝐥𝐝', url="t.me/g_00_l_d"}},
}
local msg_id = msg.id_/2097152/0.5
https.request("https://api.telegram.org/bot"..token..'/sendsticker?chat_id=' .. msg.chat_id_ .. '&sticker=https://t.me/comxnxp/20&caption=' .. URL.escape(Text).."&reply_to_message_id="..msg_id.."&parse_mode=markdown&disable_web_page_preview=true&reply_markup="..JSON.encode(keyboard)) 
end

if text == 'طرطر' then
local Text = [[
]]
keyboard = {} 
keyboard.inline_keyboard = {
{{text = '𝐓𝐞𝐚𝐦 𝐆𝐨𝐥𝐝', url="t.me/g_00_l_d"}},
}
local msg_id = msg.id_/2097152/0.5
https.request("https://api.telegram.org/bot"..token..'/sendvideo?chat_id=' .. msg.chat_id_ .. '&video=https://t.me/comxnxp/21&caption=' .. URL.escape(Text).."&reply_to_message_id="..msg_id.."&parse_mode=markdown&disable_web_page_preview=true&reply_markup="..JSON.encode(keyboard)) 
end


if text == 'عركني' then
local Text = [[
]]
keyboard = {} 
keyboard.inline_keyboard = {
{{text = '𝐓𝐞𝐚𝐦 𝐆𝐨𝐥𝐝', url="t.me/g_00_l_d"}},
}
local msg_id = msg.id_/2097152/0.5
https.request("https://api.telegram.org/bot"..token..'/sendsticker?chat_id=' .. msg.chat_id_ .. '&sticker=https://t.me/D_V1_D/94&caption=' .. URL.escape(Text).."&reply_to_message_id="..msg_id.."&parse_mode=markdown&disable_web_page_preview=true&reply_markup="..JSON.encode(keyboard)) 
end

if text == 'لائيم' then
local Text = [[
]]
keyboard = {} 
keyboard.inline_keyboard = {
{{text = '𝐓𝐞𝐚𝐦 𝐆𝐨𝐥𝐝', url="t.me/g_00_l_d"}},
}
local msg_id = msg.id_/2097152/0.5
https.request("https://api.telegram.org/bot"..token..'/sendsticker?chat_id=' .. msg.chat_id_ .. '&sticker=https://t.me/D_V1_D/93&caption=' .. URL.escape(Text).."&reply_to_message_id="..msg_id.."&parse_mode=markdown&disable_web_page_preview=true&reply_markup="..JSON.encode(keyboard)) 
end

if text == 'موت' then
local Text = [[
]]
keyboard = {} 
keyboard.inline_keyboard = {
{{text = '𝐓𝐞𝐚𝐦 𝐆𝐨𝐥𝐝', url="t.me/g_00_l_d"}},
}
local msg_id = msg.id_/2097152/0.5
https.request("https://api.telegram.org/bot"..token..'/sendsticker?chat_id=' .. msg.chat_id_ .. '&sticker=https://t.me/D_V1_D/95&caption=' .. URL.escape(Text).."&reply_to_message_id="..msg_id.."&parse_mode=markdown&disable_web_page_preview=true&reply_markup="..JSON.encode(keyboard)) 
end

if text == 'بخ' then
local Text = [[
يوه خدتني اجدع
]]
keyboard = {} 
keyboard.inline_keyboard = {
{{text = '𝐓𝐞𝐚𝐦 𝐆𝐨𝐥𝐝', url="t.me/g_00_l_d"}},
}
local msg_id = msg.id_/2097152/0.5
https.request("https://api.telegram.org/bot"..token..'/sendanimation?chat_id=' .. msg.chat_id_ .. '&animation=https://t.me/aslak8/64&caption=' .. URL.escape(Text).."&reply_to_message_id="..msg_id.."&parse_mode=markdown&disable_web_page_preview=true&reply_markup="..JSON.encode(keyboard))
end
if text == 'حظر' then
local Text = [[
برا يا كلاب
]]
keyboard = {} 
keyboard.inline_keyboard = {
{{text = '𝐓𝐞𝐚𝐦 𝐆𝐨𝐥𝐝', url="t.me/g_00_l_d"}},
}
local msg_id = msg.id_/2097152/0.5
https.request("https://api.telegram.org/bot"..token..'/sendanimation?chat_id=' .. msg.chat_id_ .. '&animation=https://t.me/aslak8/63&caption=' .. URL.escape(Text).."&reply_to_message_id="..msg_id.."&parse_mode=markdown&disable_web_page_preview=true&reply_markup="..JSON.encode(keyboard))
end
if text == 'كتم' then
local Text = [[
خليك سكات شويه
]]
keyboard = {} 
keyboard.inline_keyboard = {
{{text = '𝐓𝐞𝐚𝐦 𝐆𝐨𝐥𝐝', url="t.me/g_00_l_d"}},
}
local msg_id = msg.id_/2097152/0.5
https.request("https://api.telegram.org/bot"..token..'/sendanimation?chat_id=' .. msg.chat_id_ .. '&animation=https://t.me/D_V1_D/96&caption=' .. URL.escape(Text).."&reply_to_message_id="..msg_id.."&parse_mode=markdown&disable_web_page_preview=true&reply_markup="..JSON.encode(keyboard))
end
if text and text:match("^وضع لقب (.*)$") and msg.reply_to_message_id_ ~= 0 and Constructor(msg) then
local timsh = text:match("^وضع لقب (.*)$")
function start_function(extra, result, success)
local chek = https.request('https://api.telegram.org/bot'..token..'/getChatMember?chat_id='..msg.chat_id_..'&user_id='..ban_id)
local getInfo = JSON.decode(chek)
if getInfo.result.can_promote_members == false then
send(msg.chat_id_, msg.id_,' ⌯︙لا يمكنني تعديل  او وضع لقب ليس لدي صلاحيه\n ⌯︙قم بترقيتي جميع الصلاحيات او صلاحية اضافه مشرف ') 
return false  
end
tdcli_function ({ID = "GetUser",user_id_ = result.sender_user_id_},function(arg,data) 
usertext = '\n ⌯︙ الـعـضو   ⋖ ['..data.first_name_..'](t.me/'..(data.username_ or 'g_00_l_d')..') '
status  = '\n ⌯︙ الايدي  ⋖ '..result.sender_user_id_..'\n ⌯︙تم ضافه {'..timsh..'} كلقب له'
send(msg.chat_id_, msg.id_, usertext..status)
https.request("https://api.telegram.org/bot"..token.."/promoteChatMember?chat_id=" .. msg.chat_id_ .. "&user_id=" ..result.sender_user_id_.."&can_change_info=false&can_delete_messages=false&can_invite_users=True&can_restrict_members=false&can_pin_messages=True&can_promote_members=false")
https.request("https://api.telegram.org/bot"..token.."/setChatAdministratorCustomTitle?chat_id=" .. msg.chat_id_ .. "&user_id=" ..result.sender_user_id_.."&custom_title="..timsh)
end,nil)
end
tdcli_function ({ID = "GetMessage",chat_id_ = msg.chat_id_,message_id_ = tonumber(msg.reply_to_message_id_)}, start_function, nil)
return false
end

if text == ("مسح لقب") and msg.reply_to_message_id_ ~= 0 and Constructor(msg) then
function start_function(extra, result, success)
if msg.can_be_deleted_ == false then 
send(msg.chat_id_, msg.id_,' ⌯︙ البوت ليس مشرف يرجى ترقيتي !') 
return false  
end
tdcli_function ({ID = "GetUser",user_id_ = result.sender_user_id_},function(arg,data) 
usertext = '\n ⌯︙  الـعـضو   ⋖ ['..data.first_name_..'](t.me/'..(data.username_ or 'g_00_l_d')..')'
status  = '\n ⌯︙  الايدي  ⋖ `'..result.sender_user_id_..'`\n ⌯︙  تم مسح لقبه من الجروب'
send(msg.chat_id_, msg.id_, usertext..status)
https.request("https://api.telegram.org/bot"..token.."/promoteChatMember?chat_id=" .. msg.chat_id_ .. "&user_id=" ..result.sender_user_id_.."&can_change_info=false&can_delete_messages=false&can_invite_users=false&can_restrict_members=false&can_pin_messages=false&can_promote_members=false")
end,nil)
end
tdcli_function ({ID = "GetMessage",chat_id_ = msg.chat_id_,message_id_ = tonumber(msg.reply_to_message_id_)}, start_function, nil)
return false
end
if text and text:match("^مسح لقب @(.*)$") and Constructor(msg) then
local username = text:match("^مسح لقب @(.*)$")
if msg.can_be_deleted_ == false then 
send(msg.chat_id_, msg.id_,' ⌯︙ البوت ليس مشرف يرجى ترقيتي !') 
return false  
end
function start_function(extra, result, success)
if result.id_ then
if (result and result.type_ and result.type_.ID == "ChannelChatInfo") then
send(msg.chat_id_,msg.id_," ⌯︙  عذرا عزيزي المستخدم هاذا معرف قناة يرجى استخدام الامر بصوره صحيحه !")   
return false 
end      
usertext = '\n ⌯︙  الـعـضو   ⋖ ['..result.title_..'](t.me/'..(username or 'g_00_l_d')..')'
status  = '\n ⌯︙  تم مسح لقبه من الجروب'
texts = usertext..status
send(msg.chat_id_, msg.id_, texts)
https.request("https://api.telegram.org/bot"..token.."/promoteChatMember?chat_id=" .. msg.chat_id_ .. "&user_id=" ..result.id_.."&can_change_info=false&can_delete_messages=false&can_invite_users=false&can_restrict_members=false&can_pin_messages=false&can_promote_members=false")
else
send(msg.chat_id_, msg.id_, '⚠¦ لا يوجد حساب بهاذا المعرف')
end
end
tdcli_function ({ID = "SearchPublicChat",username_ = username}, start_function, nil)
return false
end

if text == 'لقبي' and tonumber(msg.reply_to_message_id_) == 0 then
Ge = https.request("https://api.telegram.org/bot"..token.."/getChatMember?chat_id=" .. msg.chat_id_ .. "&user_id=" ..msg.sender_user_id_)
GeId = JSON.decode(Ge)
if not GeId.result.custom_title then
send(msg.chat_id_, msg.id_,' ⌯︙وينك وين القب ') 
else
send(msg.chat_id_, msg.id_,' ⌯︙لقبك هو : '..GeId.result.custom_title) 
end
end
if text == "فحص البوت" and Manager(msg) then
local chek = https.request('https://api.telegram.org/bot'..token..'/getChatMember?chat_id='..msg.chat_id_..'&user_id='..ban_id)
local getInfo = JSON.decode(chek)
if getInfo.ok == true then
if getInfo.result.can_change_info == true then
INf = '❴ ✔️ ❵' 
else 
INf = '❴ ✖ ❵' 
end
if getInfo.result.can_delete_messages == true then
DEL = '❴ ✔️ ❵' 
else 
DEL = '❴ ✖ ❵' 
end
if getInfo.result.can_invite_users == true then
INv = '❴ ✔️ ❵' 
else
INv = '❴ ✖ ❵' 
end
if getInfo.result.can_pin_messages == true then
Pin = '❴ ✔️ ❵' 
else
Pin = '❴ ✖ ❵' 
end
if getInfo.result.can_restrict_members == true then
REs = '❴ ✔️ ❵' 
else 
REs = '❴ ✖ ❵' 
end
if getInfo.result.can_promote_members == true then
PRo = '❴ ✔️ ❵'
else
PRo = '❴ ✖ ❵'
end 
send(msg.chat_id_, msg.id_,'\n ⌯︙صلاحيات البوت هي\n•━═━═━═「ɢᴏʟᴅ」═━═━═━•\n ⌯︙  علامة ال {✔️} تعني مفعل\n ⌯︙  علامة ال {✖} تعني غير مفعل\n•━═━═━═「ɢᴏʟᴅ」═━═━═━•\n ⌯︙تغير معلومات المجموعة ↞ '..INf..'\n ⌯︙مسح الرسائل ↞ '..DEL..'\n ⌯︙حظر المستخدمين ↞ '..REs..'\n ⌯︙دعوة المستخدمين ↞ '..INv..'\n ⌯︙ثتبيت الرسالة ↞ '..Pin..'\n ⌯︙اضافة مشرفين ↞ '..PRo)   
end
end
if text == "تعطيل الانستا" and Manager(msg) then
send(msg.chat_id_, msg.id_, '⌯ تم تعطيل الانستا')
bot_data:set(ban_id.."textchuser:insta_bot"..msg.chat_id_,"close")
end
if text == "تفعيل الانستا" and Manager(msg) then
send(msg.chat_id_, msg.id_,'⌯ تم تفعيل الانستا')
bot_data:set(ban_id.."textchuser:insta_bot"..msg.chat_id_,"open")
end
if text and text:match("^معلومات (.*)$") and bot_data:get(ban_id.."textchuser:insta_bot"..msg.chat_id_) == "open" then
local Textni = text:match("^معلومات (.*)$")
data,res = https.request('https://forhassan.ml/Black/insta.php?username='..URL.escape(Textni)..'')
if res == 200 then
muaed = json:decode(data)
if muaed.Info == true then
local filee = download_to_file(muaed.ph,msg.sender_user_id_..'.jpg')
sendPhoto(msg.chat_id_, msg.id_,'./「'..msg.sender_user_id_..'」.jpg',muaed.info)     
os.execute('rm -rf ./「'..msg.sender_user_id_..'」.jpg') 
end
end
end
if text and text == "تفعيل تاك المشرفين" and Manager(msg) then 
bot_data:set(ban_id.."textchuser:Tag:Admins:"..msg.chat_id_,true)
send(msg.chat_id_, msg.id_," ⌯︙تم تفعيل تاك المشرفين")
end
if text and text == "تعطيل تاك المشرفين" and Manager(msg) then 
bot_data:del(ban_id.."textchuser:Tag:Admins:"..msg.chat_id_)
send(msg.chat_id_, msg.id_, " ⌯︙تم تعطيل تاك المشرفين")
end

if text == 'صيح المشرفين' or text == "تاك للمشرفين" or text == "وين المشرفين" or text == "المشرفين" then
if bot_data:get(ban_id.."textchuser:Tag:Admins:"..msg.chat_id_) then 
tdcli_function ({ID = "GetChannelMembers",channel_id_ = msg.chat_id_:gsub("-100",""),filter_ = {ID = "ChannelMembersAdministrators"},offset_ = 0,limit_ = 100},function(arg,data)
tdcli_function ({ID = "GetUser",user_id_ = msg.sender_user_id_},function(arg,b)  
if b.username_ then 
User_id = "@"..b.username_
else
User_id = msg.sender_user_id_
end 
local t = "\n ⌯︙المستخدم ~ ["..User_id .."] يصيح المشرفين \n•━═━═━═「ɢᴏʟᴅ」═━═━═━•\n"
k = 0
for i,v in pairs(data.members_) do
if ban_id ~= v.user_id_ then 
k = k + 1
local username = bot_data:get(ban_id.."user:Name"..v.user_id_)
if bot_data:get(ban_id..'user:Name'..v.user_id_) then
t = t..""..k.." → {[@"..bot_data:get(ban_id..'user:Name'..v.user_id_).."]}\n"
else
t = t..""..k.." → {`"..v.user_id_.."`}\n"
end
end
end
send(msg.chat_id_, msg.id_,t)
end,nil)
end,nil)
end
end
if text == 'مشرفين' or text == "تاك للمشرفين" or text == "الادمنه" or text == "المشرفين" then
tdcli_function ({ID = "GetChannelMembers",channel_id_ = msg.chat_id_:gsub("-100",""),filter_ = {ID = "ChannelMembersAdministrators"},offset_ = 0,limit_ = 100},function(arg,data)
tdcli_function ({ID = "GetUser",user_id_ = msg.sender_user_id_},function(arg,b)  
if b.username_ then 
User_id = "@"..b.username_
else
User_id = msg.sender_user_id_
end 
local t = "\n ⌯︙المستخدم ~ ["..User_id .."] يصيح المشرفين \n•━═━═━═「ɢᴏʟᴅ」═━═━═━•\n"
k = 0
for i,v in pairs(data.members_) do
if ban_id ~= v.user_id_ then 
k = k + 1
local username = bot_data:get(ban_id.."user:Name"..v.user_id_)
if bot_data:get(ban_id..'user:Name'..v.user_id_) then
t = t..""..k.." → {[@"..bot_data:get(ban_id..'user:Name'..v.user_id_).."]}\n"
else
t = t..""..k.." → {`"..v.user_id_.."`}\n"
end
end
end
send(msg.chat_id_, msg.id_,t)
end,nil)
end,nil)
end

if text == "الساعه" then
local ramsesj20 = "\n الساعه الان : "..os.date("%I:%M%p")
send(msg.chat_id_, msg.id_,ramsesj20)
end

if text == "التاريخ" then
local ramsesj20 =  "\n التاريخ : "..os.date("%Y/%m/%d")
send(msg.chat_id_, msg.id_,ramsesj20)
end
--------------
if text == ""..(bot_data:get(ban_id..'Name:Bot') or 'جولد').." غادر" or text == 'غادر' and Sudo(msg) then     
if Sudo(msg) and not bot_data:get(ban_id..'Left:Bot'..msg.chat_id_)  then 
if not Bot(msg) then 
tdcli_function ({ID = "ChangeChatMemberStatus",chat_id_=msg.chat_id_,user_id_=ban_id,status_={ID = "ChatMemberStatusLeft"},},function(e,g) end, nil) 
send(msg.chat_id_, msg.id_,'⌯︙ تم مغادرة المجموعه') 
bot_data:srem(ban_id..'Chek:Groups',msg.chat_id_)  
end
return false  
end
end

if text == 'الاحصائيات' and msa3d(msg) then 
local Namebot = (bot_data:get(ban_id..'Name:Bot') or 'جولد') 
local Groups = bot_data:scard(ban_id..'Chek:Groups')  
local Users = bot_data:scard(ban_id..'User_Bot')  
local getbioY = getbio(msg.sender_user_id_)
tessttm = "NAME BOT ⇐"..Namebot..'\n groubs ⇐ {'..Groups..'}\nSubscribers ⇐ {'..Users..'}\nBIO ⇐ {'..getbioY..'}'
local msg_id = msg.id_/2097152/0.5  
local tessttmos = 'اسم بوت ⇐ '..Namebot..''
local tessttmo = 'الجروبات ⇐ '..Groups..''
local tessttm = 'المشتركين ⇐ '..Users..''
keyboard = {} 
keyboard.inline_keyboard = {
{
{text = tessttmos, url = "https://t.me/g_00_l_d"},
},
{
{text = tessttmo, url = "https://t.me/g_00_l_d"},
},
{
{text = tessttm, url = "https://t.me/g_00_l_d"},
},
{
{text = 'اضغط لاضافه البوت لمجموعتك ' ,url="t.me/"..dofile("./Info.lua").botUserName.."?startgroup=start"},
},
}
local function getpro(extra, result, success) 
if result.photos_[0] then 
https.request("https://api.telegram.org/bot"..token..'/sendPhoto?chat_id=' .. msg.chat_id_ .. '&photo='..result.photos_[0].sizes_[1].photo_.persistent_id_..'&photo=' .. URL.escape(Namebot).."&photo="..msg_id.."&parse_mode=markdown&disable_web_page_preview=true&reply_markup="..JSON.encode(keyboard)) 
end 
end 
tdcli_function ({ ID = "GetUserProfilePhotos", user_id_ = ban_id, offset_ = 0, limit_ = 1 }, getpro, nil) 
end
if text == 'الجروبات' and msa3d(msg) then 
local Namebot = (bot_data:get(ban_id..'Name:Bot') or 'جولد') 
local Groups = bot_data:scard(ban_id..'Chek:Groups')  
Text = ' ⌯︙ عدد الجروبات  ⋖ {`'..Groups..'`}'
local msg_id = msg.id_/2097152/0.5  
local teessttmos = 'اسم بوت ⋖ '..Namebot..''
local teessttmo = 'الجروبات ⋖ '..Groups..''
keyboard = {} 
keyboard.inline_keyboard = {
{{text = teessttmos, url = "https://t.me/g_00_l_d"}},
{{text = teessttmo, url = "https://t.me/g_00_l_d"}},
{{text = 'اضغط لاضافه البوت لمجموعتك ' ,url="t.me/"..dofile("./Info.lua").botUserName.."?startgroup=start"}},
}
local function getpro(extra, result, success) 
if result.photos_[0] then 
https.request("https://api.telegram.org/bot"..token..'/sendPhoto?chat_id=' .. msg.chat_id_ .. '&photo='..result.photos_[0].sizes_[1].photo_.persistent_id_..'&photo=' .. URL.escape(Namebot).."&photo="..msg_id.."&parse_mode=markdown&disable_web_page_preview=true&reply_markup="..JSON.encode(keyboard)) 
end 
end 
tdcli_function ({ ID = "GetUserProfilePhotos", user_id_ = ban_id, offset_ = 0, limit_ = 1 }, getpro, nil) 
end
if text == 'المشتركين' then
if Sudo(msg) then 
local Groups = bot_data:scard(ban_id..'Chek:Groups')  
local Users = bot_data:scard(ban_id..'User_Bot')  
Text = ' ⌯︙ عدد المشتركين  ⋖ {`'..Users..'|}'
send(msg.chat_id_, msg.id_,Text) 
end
return false
end
if text == 'تفعيل المغادره' and Devban(msg) then   
if bot_data:get(ban_id..'Left:Bot'..msg.chat_id_) then
Text = ' ⌯︙ تم تفعيل مغادرة البوت'
bot_data:del(ban_id..'Left:Bot'..msg.chat_id_)  
else
Text = ' ⌯︙ بالتاكيد تم تفعيل مغادرة البوت'
end
send(msg.chat_id_, msg.id_,Text) 
end
if text == 'تعطيل المغادره' and Devban(msg) then  
if not bot_data:get(ban_id..'Left:Bot'..msg.chat_id_) then
Text = ' ⌯︙ تم تعطيل مغادرة البوت'
bot_data:set(ban_id..'Left:Bot'..msg.chat_id_,true)   
else
Text = ' ⌯︙ بالتاكيد تم تعطيل مغادرة البوت'
end
send(msg.chat_id_, msg.id_, Text) 
end

if text == 'تفعيل الردود العامه' and Manager(msg) then   
if bot_data:get(ban_id..'Reply:Sudo'..msg.chat_id_) then
bot_data:del(ban_id..'Reply:Sudo'..msg.chat_id_)  
Text = '\n ⌯︙ تم تفعيل الردود العامه' 
else
Text = '\n ⌯︙ بالتاكيد تم تفعيل الردود العامه'
end
send(msg.chat_id_, msg.id_,Text) 
end
if text == 'تعطيل الردود العامه' and Manager(msg) then  
if not bot_data:get(ban_id..'Reply:Sudo'..msg.chat_id_) then
bot_data:set(ban_id..'Reply:Sudo'..msg.chat_id_,true)   
Text = '\n ⌯︙ تم تعطيل الردود العامه' 
else
Text = '\n ⌯︙ بالتاكيد تم تعطيل الردود العامه'
end
send(msg.chat_id_, msg.id_,Text) 
end
if text == 'تفعيل الايدي' and Manager(msg) then   
if bot_data:get(ban_id..'Bot:Id'..msg.chat_id_)  then
bot_data:del(ban_id..'Bot:Id'..msg.chat_id_) 
Text = '\n ⌯︙ تم تفعيل الايدي' 
else
Text = '\n ⌯︙  بالتاكيد تم تفعيل الايدي'
end
send(msg.chat_id_, msg.id_,Text) 
end
if text == 'تعطيل الايدي' and Manager(msg) then  
if not bot_data:get(ban_id..'Bot:Id'..msg.chat_id_)  then
bot_data:set(ban_id..'Bot:Id'..msg.chat_id_,true) 
Text = '\n ⌯︙ تم تعطيل الايدي' 
else
Text = '\n ⌯︙ بالتاكيد تم تعطيل الايدي'
end
send(msg.chat_id_, msg.id_,Text) 
end

if text == 'تفعيل الحظر' and Constructor(msg) then   
if bot_data:get(ban_id..'Lock:kick'..msg.chat_id_)  then
bot_data:del(ban_id..'Lock:kick'..msg.chat_id_) 
Text = '\n ⌯︙ تم تفعيل الحظر' 
else
Text = '\n ⌯︙ بالتاكيد تم تفعيل الحظر'
end
send(msg.chat_id_, msg.id_,Text) 
end
if text == 'تعطيل الحظر' and Constructor(msg) then  
if not bot_data:get(ban_id..'Lock:kick'..msg.chat_id_)  then
bot_data:set(ban_id..'Lock:kick'..msg.chat_id_,true) 
Text = '\n ⌯︙ تم تعطيل الحظر' 
else
Text = '\n ⌯︙ بالتاكيد تم تعطيل الحظر'
end
send(msg.chat_id_, msg.id_,Text) 
end
if text == 'تفعيل الرفع' and Constructor(msg) then   
if bot_data:get(ban_id..'Lock:Add:Bot'..msg.chat_id_)  then
bot_data:del(ban_id..'Lock:Add:Bot'..msg.chat_id_) 
Text = '\n ⌯︙ تم تفعيل الرفع' 
else
Text = '\n ⌯︙ بالتاكيد تم تفعيل الرفع'
end
send(msg.chat_id_, msg.id_,Text) 
end
if text == 'تعطيل الرفع' and Constructor(msg) then  
if not bot_data:get(ban_id..'Lock:Add:Bot'..msg.chat_id_)  then
bot_data:set(ban_id..'Lock:Add:Bot'..msg.chat_id_,true) 
Text = '\n ⌯︙ تم تعطيل الرفع' 
else
Text = '\n ⌯︙ بالتاكيد تم تعطيل الرفع'
end
send(msg.chat_id_, msg.id_,Text) 
end
if text == 'ايدي' and tonumber(msg.reply_to_message_id_) > 0 then
function start_function(extra, result, success)
tdcli_function ({ID = "GetUser",user_id_ = result.sender_user_id_},function(extra,data) 
local Msguser = tonumber(bot_data:get(ban_id..'Msg_User'..msg.chat_id_..':'..result.sender_user_id_) or 1) 
local Contact = tonumber(bot_data:get(ban_id..'Add:Contact'..msg.chat_id_..':'..result.sender_user_id_) or 0) 
local NUMPGAME = tonumber(bot_data:get(ban_id..'NUM:GAMES'..msg.chat_id_..result.sender_user_id_) or 0)
local edit = tonumber(bot_data:get(ban_id..'edits'..msg.chat_id_..result.sender_user_id_) or 0)
local rtp = Rutba(result.sender_user_id_,msg.chat_id_)
local username = ('[@'..data.username_..']' or 'لا يوجد')
local iduser = result.sender_user_id_
send(msg.chat_id_, msg.id_,' ⌯︙ ايديه ⋖ '..iduser..'\n ⌯︙ معرفه ⋖ 「'..username..'」\n ⌯︙ رتبته ⋖ '..rtp..'\n ⌯︙ تعديلاته ⋖ '..edit..'\n ⌯︙ نقاطه ⋖ '..NUMPGAME..'\n ⌯︙ جهاته ⋖ '..Contact..'\n ⌯︙ رسائله ⋖ 「'..Msguser..'」')
end,nil)
end
tdcli_function ({ID = "GetMessage",chat_id_ = msg.chat_id_,message_id_ = tonumber(msg.reply_to_message_id_)}, start_function, nil)
end
if text and text:match("^ايدي @(.*)$") then
local username = text:match("^ايدي @(.*)$")
if AddChannel(msg.sender_user_id_) == false then
local textchuser = bot_data:get(ban_id..'text:ch:user')
if textchuser then
send(msg.chat_id_, msg.id_,'['..textchuser..']')
else
send(msg.chat_id_, msg.id_,' ⌯︙ لا تستطيع استخدام البوت \n ⌯︙  يرجى الاشتراك بالقناه اولا \n ⌯︙  اشترك هنا ['..bot_data:get(ban_id..'add:ch:username')..']')
end
return false
end
function start_function(extra, result, success)
if result.id_ then
tdcli_function ({ID = "GetUser",user_id_ = result.id_},function(extra,data) 
local Msguser = tonumber(bot_data:get(ban_id..'Msg_User'..msg.chat_id_..':'..result.id_) or 1) 
local Contact = tonumber(bot_data:get(ban_id..'Add:Contact'..msg.chat_id_..':'..result.id_) or 0) 
local NUMPGAME = tonumber(bot_data:get(ban_id..'NUM:GAMES'..msg.chat_id_..result.id_) or 0)
local edit = tonumber(bot_data:get(ban_id..'edits'..msg.chat_id_..result.id_) or 0)
local rtp = Rutba(result.id_,msg.chat_id_)
local username = ('[@'..data.username_..']' or 'لا يوجد')
local iduser = result.id_
send(msg.chat_id_, msg.id_,' ⌯︙ ايديه ⋖「'..iduser..'」\n ⌯︙ معرفه ⋖「'..username..'」\n ⌯︙ رتبته ⋖「'..rtp..'」\n ⌯︙ تعديلاته ⋖('..edit..')\n ⌯︙ نقاطه ⋖('..NUMPGAME..')\n ⌯︙ جهاته ⋖('..Contact..')\n ⌯︙ رسائله ⋖(「'..Msguser..'」)')
end,nil)
else
send(msg.chat_id_, msg.id_,' ⌯︙ المعرف غير صحيح ')
end
end
tdcli_function ({ID = "SearchPublicChat",username_ = username}, start_function, nil)
end

if text == "رتبتي" and not bot_data:get(ban_id..'ghiktr'..msg.chat_id_) then     
tdcli_function ({ID = "GetUser",user_id_ = msg.sender_user_id_},function(extra,result,success)
if result.username_ then
username = result.username_ 
else
username = 'g_00_l_d'
end
local msg_id = msg.id_/2097152/0.5  
local textt = ' رتبتك » '..Rutba(msg.sender_user_id_,msg.chat_id_)
local Banda = 'https://t.me/xxxcccvvbbnn/903'
keyboard = {} 
keyboard.inline_keyboard = {
{
{text = textt, url="http://t.me/"..username},
},
}
local function getpro(extra, result, success) 
if result.photos_[0] then 
https.request("https://api.telegram.org/bot"..token..'/sendPhoto?chat_id=' .. msg.chat_id_ .. '&photo='..result.photos_[0].sizes_[1].photo_.persistent_id_..'&photo=' .. URL.escape(textt).."&reply_to_message_id="..msg_id.."&parse_mode=markdown&disable_web_page_preview=true&reply_markup="..JSON.encode(keyboard)) 
else 
https.request("https://api.telegram.org/bot"..token..'/sendPhoto?chat_id=' .. msg.chat_id_ .. '&photo=' .. URL.escape(Banda).."&reply_to_message_id="..msg_id.."&parse_mode=markdown&disable_web_page_preview=true&reply_markup="..JSON.encode(keyboard)) 
end end 
tdcli_function ({ ID = "GetUserProfilePhotos", user_id_ = msg.sender_user_id_, offset_ = 0, limit_ = 1 }, getpro, nil) 
end,nil)
end

if text == 'تفعيل رتبتي' and Manager(msg) then   
if bot_data:get(ban_id..'ghiktr'..msg.chat_id_)  then
bot_data:del(ban_id..'ghiktr'..msg.chat_id_) 
Text = '\n ⌯︙ تم تفعيل رتبتي' 
else
Text = '\n ⌯︙  بالتاكيد تم تفعيل رتبتي'
end
send(msg.chat_id_, msg.id_,Text) 
end
if text == 'تعطيل رتبتي' and Manager(msg) then  
if not bot_data:get(ban_id..'ghiktr'..msg.chat_id_)  then
bot_data:set(ban_id..'ghiktr'..msg.chat_id_,true) 
Text = '\n ⌯︙ تم تعطيل رتبتي' 
else
Text = '\n ⌯︙ بالتاكيد تم تعطيل رتبتي'
end
send(msg.chat_id_, msg.id_,Text) 
end

if text == "انا مين" then
local my_ph = bot_data:get(ban_id.."my_anamen:status"..msg.chat_id_)
if not my_ph then
send(msg.chat_id_, msg.id_," ⌯︙انا مين معطله") 
return false  
end
tdcli_function ({ID = "GetUser",user_id_ = msg.sender_user_id_},function(extra,result,success)
if result.username_ then
username = result.username_ 
else
username = 'g_00_l_d'
end
local msg_id = msg.id_/2097152/0.5  
local textt = ' انت: '..Rutba(msg.sender_user_id_,msg.chat_id_)
local Boody = 'https://t.me/xxxcccvvbbnn/903'
keyboard = {} 
keyboard.inline_keyboard = {
{
{text = textt, url="http://t.me/"..username},
},
{
{text = 'اضف البوت الي مجموعتك' ,url="t.me/"..dofile("./Info.lua").botUserName.."?startgroup=start"},
},
}
local function getpro(extra, result, success) 
if result.photos_[0] then 
https.request("https://api.telegram.org/bot"..token..'/sendPhoto?chat_id=' .. msg.chat_id_ .. '&photo='..result.photos_[0].sizes_[1].photo_.persistent_id_..'&photo=' .. URL.escape(textt).."&reply_to_message_id="..msg_id.."&parse_mode=markdown&disable_web_page_preview=true&reply_markup="..JSON.encode(keyboard)) 
else 
https.request("https://api.telegram.org/bot"..token..'/sendPhoto?chat_id=' .. msg.chat_id_ .. '&photo=' .. URL.escape(Boody).."&reply_to_message_id="..msg_id.."&parse_mode=markdown&disable_web_page_preview=true&reply_markup="..JSON.encode(keyboard)) 
end end 
tdcli_function ({ ID = "GetUserProfilePhotos", user_id_ = msg.sender_user_id_, offset_ = 0, limit_ = 1 }, getpro, nil) 
end,nil)
end
if text == "تعطيل انا مين"  and Manager(msg) then   
if Constructor(msg) then  
bot_data:del(ban_id.."my_anamen:status"..msg.chat_id_) 
send(msg.chat_id_, msg.id_," ⌯︙ تـم تـعـطـيل انا مين") 
return false end
end
if text == "تفعيل انا مين"  and Manager(msg) then   
if Constructor(msg) then  
bot_data:set(ban_id.."my_anamen:status"..msg.chat_id_,true) 
send(msg.chat_id_, msg.id_," ⌯︙ تـم تـفعـيل انا مين") 
return false  
end
end
if string.find(text,"ضافني") or string.find(text,"ضفني") then
if not bot_data:get(ban_id..'Added:Me'..msg.chat_id_) then
tdcli_function ({ID = "GetChatMember",chat_id_ = msg.chat_id_,user_id_ = msg.sender_user_id_},function(arg,da) 
if da and da.status_.ID == "ChatMemberStatusCreator" then
send(msg.chat_id_, msg.id_,' ⌯︙ انت منشئ الجروب') 
return false
end
local Added_Me = bot_data:get(ban_id.."Who:Added:Me"..msg.chat_id_..':'..msg.sender_user_id_)
if Added_Me then 
tdcli_function ({ID = "GetUser",user_id_ = Added_Me},function(extra,result,success)
local Name = '['..result.first_name_..'](tg://user?id='..result.id_..')'
Text = ' ⌯︙ هوا ابن القمر دا الي ضافك😹 ⋖ '..Name
sendText(msg.chat_id_,Text,msg.id_/2097152/0.5,'md')
end,nil)
else
send(msg.chat_id_, msg.id_,' ⌯︙ انت دخلت عبر الرابط يوسخ 🌝') 
end
end,nil)
else
send(msg.chat_id_, msg.id_,' ⌯︙ تم تعطيل امر  مين ضافني') 
end
end
if text == 'مين ضافني هنا' then
if not bot_data:get(ban_id..'Added:Me'..msg.chat_id_) then
tdcli_function ({ID = "GetChatMember",chat_id_ = msg.chat_id_,user_id_ = msg.sender_user_id_},function(arg,da) 
if da and da.status_.ID == "ChatMemberStatusCreator" then
send(msg.chat_id_, msg.id_,' ⌯︙ انت منشئ الجروب') 
return false
end
local Added_Me = bot_data:get(ban_id.."Who:Added:Me"..msg.chat_id_..':'..msg.sender_user_id_)
if Added_Me then 
tdcli_function ({ID = "GetUser",user_id_ = Added_Me},function(extra,result,success)
local Name = '['..result.first_name_..'](tg://user?id='..result.id_..')'
Text = ' ⌯︙ هوا ابن الكلب دا الي ضافك😹 ⋖ '..Name
sendText(msg.chat_id_,Text,msg.id_/2097152/0.5,'md')
end,nil)
else
send(msg.chat_id_, msg.id_,' ⌯︙ انت دخلت عبر الرابط يوسخ 🌝') 
end
end,nil)
else
send(msg.chat_id_, msg.id_,' ⌯︙ تم تعطيل امر  مين ضافني') 
end
end

if text == 'تفعيل ضافني' and Manager(msg) then   
if bot_data:get(ban_id..'Added:Me'..msg.chat_id_) then
Text = ' ⌯︙ تم تفعيل امر مين ضافني '
bot_data:del(ban_id..'Added:Me'..msg.chat_id_)  
else
Text = ' ⌯︙ بالتاكيد تم تفعيل امر مين ضافني '
end
send(msg.chat_id_, msg.id_,Text) 
end
if text == 'تعطيل ضافني' and Manager(msg) then  
if not bot_data:get(ban_id..'Added:Me'..msg.chat_id_) then
bot_data:set(ban_id..'Added:Me'..msg.chat_id_,true)  
Text = '\n ⌯︙ تم تعطيل امر مين ضافني '
else
Text = '\n ⌯︙ بالتاكيد تم تعطيل امر مين ضافني '
end
send(msg.chat_id_, msg.id_,Text) 
end
if text == 'تفعيل صيح' and Manager(msg) then   
if bot_data:get(ban_id..'Seh:User'..msg.chat_id_) then
Text = ' ⌯︙ تم تفعيل امر صيح'
bot_data:del(ban_id..'Seh:User'..msg.chat_id_)  
else
Text = ' ⌯︙ بالتاكيد تم تفعيل امر صيح'
end
send(msg.chat_id_, msg.id_,Text) 
end
if text == 'تنزيل الرتب' and BasicConstructor(msg) then  
bot_data:del(ban_id..'Constructor'..msg.chat_id_)
bot_data:del(ban_id..'Manager'..msg.chat_id_)
bot_data:del(ban_id..'Mod:User'..msg.chat_id_)
bot_data:del(ban_id..'Special:User'..msg.chat_id_)
send(msg.chat_id_, msg.id_, '\n ⌯︙ تم مسح تلكل ')
end
if text == 'تعطيل صيح' and Manager(msg) then  
if not bot_data:get(ban_id..'Seh:User'..msg.chat_id_) then
bot_data:set(ban_id..'Seh:User'..msg.chat_id_,true)  
Text = '\n ⌯︙ تم تعطيل امر صيح'
else
Text = '\n ⌯︙ بالتاكيد تم تعطيل امر صيح'
end
send(msg.chat_id_, msg.id_,Text) 
end
if text == 'تفعيل اطردني' and Manager(msg) then   
if bot_data:get(ban_id..'Cick:Me'..msg.chat_id_) then
Text = ' ⌯︙ تم تفعيل امر اطردني إلى عايز يخرج يتنيل 😹'
bot_data:del(ban_id..'Cick:Me'..msg.chat_id_)  
else
Text = ' ⌯︙ بالتاكيد تم تفعيل امر اطردني مخلاص كفايه تفعيل الأمر 😾'
end
send(msg.chat_id_, msg.id_,Text) 
end
if text == 'تعطيل اطردني' and Manager(msg) then  
if not bot_data:get(ban_id..'Cick:Me'..msg.chat_id_) then
bot_data:set(ban_id..'Cick:Me'..msg.chat_id_,true)  
Text = '\n ⌯︙ تم تعطيل امر اطردني اترزع هن بقى مفيش خروج 😹'
else
Text = '\n ⌯︙ بالتاكيد تم تعطيل امر اطردني مفيش خروج يولاد القمر 😹'
end
send(msg.chat_id_, msg.id_,Text) 
end
if text == "صورتي"  then
local my_ph = bot_data:get(ban_id.."my_photo:status"..msg.chat_id_)
if not my_ph then
send(msg.chat_id_, msg.id_," ⌯︙ الصوره معطله") 
return false  
end
local function getpro(extra, result, success)
if result.photos_[0] then
sendPhoto(msg.chat_id_, msg.id_, 0, 1, nil, result.photos_[0].sizes_[1].photo_.persistent_id_," ⌯︙ عدد صورك ⋖ "..result.total_count_.." صوره‌‏", msg.id_, msg.id_, "md")
else
send(msg.chat_id_, msg.id_,'لا تمتلك صوره في حسابك', 1, 'md')
  end end
tdcli_function ({ ID = "GetUserProfilePhotos", user_id_ = msg.sender_user_id_, offset_ = 0, limit_ = 1 }, getpro, nil)
end
if text == "نسبه جمالي" or text == "جمالي" then
local my_ph = bot_data:get(ban_id.."pp_photo:status"..msg.chat_id_)
if not my_ph then
send(msg.chat_id_, msg.id_," ⌯︙اكتب تفعيل نسبه جمالي") 
return false  
end
if Sudo(msg) then
local function getpro(extra, result, success)
if result.photos_[0] then
sendPhoto(msg.chat_id_, msg.id_, 0, 1, nil, result.photos_[0].sizes_[1].photo_.persistent_id_," نسبه جمالك هي 500% \nعشان مطور وكدا لازم اطبله 😹♥\n" )
else
send(msg.chat_id_, msg.id_,'لا تمتلك صوره في حسابك', 1, 'md')
  end end
tdcli_function ({ ID = "GetUserProfilePhotos", user_id_ = msg.sender_user_id_, offset_ = 0, limit_ = 1 }, getpro, nil)
else
local function getpro(extra, result, success)
local nspp = {"10","20","30","35","75","34","66","82","23","19","55","80","63","32","27","89","99","98","79","100","8","3","6","0",}
local rdbhoto = nspp[math.random(#nspp)]
if result.photos_[0] then
sendPhoto(msg.chat_id_, msg.id_, 0, 1, nil, result.photos_[0].sizes_[1].photo_.persistent_id_," نسبه جمالك هي "..rdbhoto.."🙄♥" )
else
send(msg.chat_id_, msg.id_,'لا تمتلك صوره في حسابك', 1, 'md')
  end end
tdcli_function ({ ID = "GetUserProfilePhotos", user_id_ = msg.sender_user_id_, offset_ = 0, limit_ = 1 }, getpro, nil)
end
end
if text == 'تفعيل ايدي صوره' and Manager(msg) then   
if bot_data:get(ban_id..'Bot:Id:Photo'..msg.chat_id_)  then
bot_data:del(ban_id..'Bot:Id:Photo'..msg.chat_id_) 
Text = '\n ⌯︙ تم تفعيل الايدي بالصور' 
else
Text = '\n ⌯︙ بالتاكيد تم تفعيل الايدي بالصوره'
end
send(msg.chat_id_, msg.id_,Text) 
end
if text == 'تعطيل ايدي صوره' and Manager(msg) then  
if not bot_data:get(ban_id..'Bot:Id:Photo'..msg.chat_id_)  then
bot_data:set(ban_id..'Bot:Id:Photo'..msg.chat_id_,true) 
Text = '\n ⌯︙ تم تعطيل الايدي بالصوره' 
else
Text = '\n ⌯︙ بالتاكيد تم تعطيل الايدي بالصوره'
end
send(msg.chat_id_, msg.id_,Text) 
end

if text == 'تغير الايدي' and Manager(msg) then 
local List = {
[[
- UsEr🇺🇸 ꙰ #username
- StA🇺🇸 ꙰   #msgs
- MsGs🇺🇸 ꙰ #stast
- ID🇺🇸 ꙰  #id
- 𝗶𝗗 🇺🇸 ꙰  「@g_00_l_d」 ☆
]],
[[
¦• 𝚄𝚂𝙴𝚁  ⇉⁞ #username ↝🇵🇷.
¦• 𝙼𝚂𝙶𝚂 ⇉ ⁞  #msgs  ↝ 🇵🇷.
¦• 𝚁𝙰𝙽𝙺  ⇉⁞ #stast  ↝🇵🇷.
¦• 𝙸𝙳 𝚂𝚃𝙰 ⇉ #id  ↝🇵🇷.
¦• 𝗶𝗗 - 「@g_00_l_d」 ☆
]],
[[
- 🦋 UsErNaMe . #username 𖠲
- 🦋 StAsT . #stast 𖠲
- 🦋 Id . #id 𖠲
- 🦋 GaMeS . #game 𖠲
- 🦋 MsGs . #msgs 𖠲
- 🦋 𝗖𝗛 - 「@g_00_l_d」 ☆
]]}
local Text_Rand = List[math.random(#List)]
bot_data:set(ban_id.."KLISH:ID"..msg.chat_id_,Text_Rand)
send(msg.chat_id_, msg.id_,' ⌯︙ تم تغير الايدي ارسل ايدي لرؤيته')
end

if text == 'سحكاتي' or text == 'تعديلاتي' then 
local Num = tonumber(bot_data:get(ban_id..'edits'..msg.chat_id_..msg.sender_user_id_) or 0)
if Num == 0 then 
Text = ' ⌯︙  ليس لديك سحكات'
else
Text = ' ⌯︙ عدد سحكاتك * ⋖ 「 '..Num..' 」 *'
end
send(msg.chat_id_, msg.id_,Text) 
end
if text == "مسح سحكاتي" or text == "مسح سحكاتي" then  
send(msg.chat_id_, msg.id_,' ⌯︙ تم مسح سحكاتك'  )  
bot_data:del(ban_id..'edits'..msg.chat_id_..msg.sender_user_id_)
end
if text == "مسح جهاتي" or text == "مسح جهاتي" then  
send(msg.chat_id_, msg.id_,' ⌯︙ تم مسح جهاتك'  )  
bot_data:del(ban_id..'Add:Contact'..msg.chat_id_..':'..msg.sender_user_id_)
end
if text == 'جهاتي' or text == 'شكد ضفت' then
if AddChannel(msg.sender_user_id_) == false then
local textchuser = bot_data:get(ban_id..'text:ch:user')
if textchuser then
send(msg.chat_id_, msg.id_,'['..textchuser..']')
else
send(msg.chat_id_, msg.id_,' ⌯︙ لا تستطيع استخدام البوت \n ⌯︙  يرجى الاشتراك بالقناه اولا \n ⌯︙  اشترك هنا ['..bot_data:get(ban_id..'add:ch:username')..']')
end
return false
end
local Num = tonumber(bot_data:get(ban_id..'Add:Contact'..msg.chat_id_..':'..msg.sender_user_id_) or 0) 
if Num == 0 then 
Text = ' ⌯︙ لم تقم بأضافه احد'
else
Text = ' ⌯︙ عدد جهاتك * ⋖ 「 '..Num..' 」 *'
end
send(msg.chat_id_, msg.id_,Text) 
end
if text == "تنظيف المشتركين" and Devban(msg) then 
if AddChannel(msg.sender_user_id_) == false then
local textchuser = bot_data:get(ban_id..'text:ch:user')
if textchuser then
send(msg.chat_id_, msg.id_,'['..textchuser..']')
else
send(msg.chat_id_, msg.id_,'- لا تستطيع استخدام البوت يرجى الاشتراك في القناة حتى تتمكن من استخدام الاوامر \n- اشترك هنا ['..bot_data:get(ban_id..'add:ch:username')..']')
end
return false
end
local pv = bot_data:smembers(ban_id.."User_Bot")
local sendok = 0
for i = 1, #pv do
tdcli_function({ID='GetChat',chat_id_ = pv[i]
},function(arg,dataq)
tdcli_function ({ ID = "SendChatAction",  
chat_id_ = pv[i], action_ = {  ID = "SendMessageTypingAction", progress_ = 100} 
},function(arg,data) 
if data.ID and data.ID == "Ok"  then
else
bot_data:srem(ban_id.."User_Bot",pv[i])
sendok = sendok + 1
end
if #pv == i then 
if sendok == 0 then
send(msg.chat_id_, msg.id_,' ⌯︙  لا يوجد مشتركين وهميين في البوت \n')   
else
local ok = #pv - sendok
send(msg.chat_id_, msg.id_,' ⌯︙ عدد المشتركين الان  ⋖ ( '..#pv..' )\n- تم ازالة  ⋖ ( '..sendok..' ) من المشتركين\n- الان عدد المشتركين الحقيقي  ⋖ ( '..ok..' ) مشترك \n')   
end
end
end,nil)
end,nil)
end
return false
end
if text == "تنظيف الجروبات" and Devban(msg) then 
if AddChannel(msg.sender_user_id_) == false then
local textchuser = bot_data:get(ban_id..'text:ch:user')
if textchuser then
send(msg.chat_id_, msg.id_,'['..textchuser..']')
else
send(msg.chat_id_, msg.id_,'- لا تستطيع استخدام البوت يرجى الاشتراك في القناة حتى تتمكن من استخدام الاوامر \n- اشترك هنا ['..bot_data:get(ban_id..'add:ch:username')..']')
end
return false
end
local group = bot_data:smembers(ban_id..'Chek:Groups') 
local w = 0
local q = 0
for i = 1, #group do
tdcli_function({ID='GetChat',chat_id_ = group[i]
},function(arg,data)
if data and data.type_ and data.type_.channel_ and data.type_.channel_.status_ and data.type_.channel_.status_.ID == "ChatMemberStatusMember" then
bot_data:srem(ban_id..'Chek:Groups',group[i])  
tdcli_function ({ID = "ChangeChatMemberStatus",chat_id_=group[i],user_id_=ban_id,status_={ID = "ChatMemberStatusLeft"},},function(e,g) end, nil) 
w = w + 1
end
if data and data.type_ and data.type_.channel_ and data.type_.channel_.status_ and data.type_.channel_.status_.ID == "ChatMemberStatusLeft" then
bot_data:srem(ban_id..'Chek:Groups',group[i])  
q = q + 1
end
if data and data.type_ and data.type_.channel_ and data.type_.channel_.status_ and data.type_.channel_.status_.ID == "ChatMemberStatusKicked" then
bot_data:srem(ban_id..'Chek:Groups',group[i])  
q = q + 1
end
if data and data.code_ and data.code_ == 400 then
bot_data:srem(ban_id..'Chek:Groups',group[i])  
w = w + 1
end
if #group == i then 
if (w + q) == 0 then
send(msg.chat_id_, msg.id_,' ⌯︙  لا يوجد جروبات وهميه في البوت\n')   
else
local KLAER = (w + q)
local sendok = #group - KLAER
if q == 0 then
KLAER = ''
else
KLAER = '\n- تم ازالة  ⋖ 「 '..q..' 」 جروبات من البوت'
end
if w == 0 then
KLAERk = ''
else
KLAERk = '\n- تم ازالة  ⋖ 「 '..w..' 」 جروب لان البوت عضو'
end
send(msg.chat_id_, msg.id_,' ⌯︙ عدد الجروبات الان  ⋖ 「 '..#group..' 」'..KLAERk..''..KLAER..'\n*- الان عدد الجروبات الحقيقي  ⋖ 「 '..sendok..' 」 جروبات\n')   
end
end
end,nil)
end
return false
end

if text and text:match("^(gpinfo)$") or text and text:match("^معلومات الجروب$") then
function gpinfo(arg,data)
-- vardump(data) 
KLAERdx(msg.chat_id_, msg.id_, ' ⌯︙ ايدي المجموعة  ⋖ 「 '..msg.chat_id_..' 」\n ⌯︙ عدد الادمنيه  ⋖ 「 *'..data.administrator_count_..' 」*\n ⌯︙ عدد المحظورين  ⋖ 「 *'..data.kicked_count_..' 」*\n ⌯︙ عدد الاعضاء  ⋖ 「 *'..data.member_count_..' 」*\n', 'md') 
end 
getChannelFull(msg.chat_id_, gpinfo, nil) 
end
-----------
if text ==("مسح") and Mod(msg) and tonumber(msg.reply_to_message_id_) > 0 then
DeleteMessage(msg.chat_id_,{[0] = tonumber(msg.reply_to_message_id_),msg.id_})   
end   
if bot_data:get(ban_id.."numadd:user" .. msg.chat_id_ .. "" .. msg.sender_user_id_) then 
if text and text:match("^الغاء$") then 
bot_data:del(ban_id..'id:user'..msg.chat_id_)  
send(msg.chat_id_, msg.id_, " ⌯︙ تم الغاء الامر ") 
bot_data:del(ban_id.."numadd:user" .. msg.chat_id_ .. "" .. msg.sender_user_id_)  
return false  
end 
bot_data:del(ban_id.."numadd:user" .. msg.chat_id_ .. "" .. msg.sender_user_id_)  
local numadded = string.match(text, "(%d+)") 
local iduserr = bot_data:get(ban_id..'id:user'..msg.chat_id_)  
bot_data:del(ban_id..'Msg_User'..msg.chat_id_..':'..msg.sender_user_id_) 
bot_data:incrby(ban_id..'Msg_User'..msg.chat_id_..':'..iduserr,numadded)  
send(msg.chat_id_, msg.id_," ⌯︙ تم اضافة له {"..numadded..'} من الرسائل')  
end
------------------------------------------------------------------------
if bot_data:get(ban_id.."gemadd:user" .. msg.chat_id_ .. "" .. msg.sender_user_id_) then 
if text and text:match("^الغاء$") then 
bot_data:del(ban_id..'idgem:user'..msg.chat_id_)  
send(msg.chat_id_, msg.id_, " ⌯︙ تم الغاء الامر ") 
bot_data:del(ban_id.."gemadd:user" .. msg.chat_id_ .. "" .. msg.sender_user_id_)  
return false  
end 
bot_data:del(ban_id.."gemadd:user" .. msg.chat_id_ .. "" .. msg.sender_user_id_)  
local numadded = string.match(text, "(%d+)") 
local iduserr = bot_data:get(ban_id..'idgem:user'..msg.chat_id_)  
bot_data:incrby(ban_id..'NUM:GAMES'..msg.chat_id_..iduserr,numadded)  
send(msg.chat_id_, msg.id_,  1, " ⌯︙| تم اضافة له {"..numadded..'} من النقود', 1 , 'md')  
end
------------------------------------------------------------
if text and text:match("^اضف رسائل (%d+)$") and msg.reply_to_message_id_ == 0 and Constructor(msg) then    
ban = text:match("^اضف رسائل (%d+)$")
bot_data:set(ban_id..'id:user'..msg.chat_id_,ban)  
bot_data:setex(ban_id.."numadd:user" .. msg.chat_id_ .. "" .. msg.sender_user_id_, 120, true)  
send(msg.chat_id_, msg.id_, ' ⌯︙ ارسل لي عدد الرسائل الان') 
return false
end
------------------------------------------------------------------------
if text and text:match("^اضف نقاط (%d+)$") and msg.reply_to_message_id_ == 0 and Constructor(msg) then  
ban = text:match("^اضف نقاط (%d+)$")
bot_data:set(ban_id..'idgem:user'..msg.chat_id_,ban)  
bot_data:setex(ban_id.."gemadd:user" .. msg.chat_id_ .. "" .. msg.sender_user_id_, 120, true)  
send(msg.chat_id_, msg.id_, ' ⌯︙ ارسل لي عدد النقاط التي تريد اضافتها') 
return false
end
------------------------------------------------------------------------
if text and text:match("^اضف نقاط (%d+)$") and msg.reply_to_message_id_ ~= 0 and Constructor(msg) then
local Num = text:match("^اضف نقاط (%d+)$")
function reply(extra, result, success)
bot_data:incrby(ban_id..'NUM:GAMES'..msg.chat_id_..result.sender_user_id_,Num)  
send(msg.chat_id_, msg.id_," ⌯︙ تم اضافة له {"..Num..'} من النقاط')  
end
tdcli_function ({ID = "GetMessage",chat_id_=msg.chat_id_,message_id_=tonumber(msg.reply_to_message_id_)},reply, nil)
return false
end
------------------------------------------------------------------------
if text and text:match("^اضف رسائل (%d+)$") and msg.reply_to_message_id_ ~= 0 and Constructor(msg) then
local Num = text:match("^اضف رسائل (%d+)$")
function reply(extra, result, success)
bot_data:del(ban_id..'Msg_User'..msg.chat_id_..':'..result.sender_user_id_) 
bot_data:incrby(ban_id..'Msg_User'..msg.chat_id_..':'..result.sender_user_id_,Num)  
send(msg.chat_id_, msg.id_, "\n ⌯︙ تم اضافة له {"..Num..'} من الرسائل')  
end
tdcli_function ({ID = "GetMessage",chat_id_=msg.chat_id_,message_id_=tonumber(msg.reply_to_message_id_)},reply, nil)
return false
end
if text == 'نقاط' or text == 'نقاطي' then 
if AddChannel(msg.sender_user_id_) == false then
local textchuser = bot_data:get(ban_id..'text:ch:user')
if textchuser then
send(msg.chat_id_, msg.id_,'['..textchuser..']')
else
send(msg.chat_id_, msg.id_,' ⌯︙ لا تستطيع استخدام البوت \n ⌯︙  يرجى الاشتراك بالقناه اولا \n ⌯︙  اشترك هنا ['..bot_data:get(ban_id..'add:ch:username')..']')
end
return false
end
local Num = bot_data:get(ban_id..'NUM:GAMES'..msg.chat_id_..msg.sender_user_id_) or 0
if Num == 0 then 
Text = ' ⌯︙ لم تلعب اي لعبه للحصول على نقاط'
else
Text = ' ⌯︙ عدد نقاطك التي ربحتها هيه * ⋖ 「 '..Num..' 」 نقاط *'
end
send(msg.chat_id_, msg.id_,Text) 
end
if text and text:match("^بيع نقاطي (%d+)$") or text and text:match("^بيع نقاط (%d+)$") then
local NUMPY = text:match("^بيع نقاطي (%d+)$") or text and text:match("^بيع نقاط (%d+)$") 
if AddChannel(msg.sender_user_id_) == false then
local textchuser = bot_data:get(ban_id..'text:ch:user')
if textchuser then
send(msg.chat_id_, msg.id_,'['..textchuser..']')
else
send(msg.chat_id_, msg.id_,' ⌯︙ لا تستطيع استخدام البوت \n ⌯︙  يرجى الاشتراك بالقناه اولا \n ⌯︙  اشترك هنا ['..bot_data:get(ban_id..'add:ch:username')..']')
end
return false
end
if tonumber(NUMPY) == tonumber(0) then
send(msg.chat_id_,msg.id_,"\n* ⌯︙ لا استطيع البيع اقل من 1 *") 
return false 
end
if tonumber(bot_data:get(ban_id..'NUM:GAMES'..msg.chat_id_..msg.sender_user_id_)) == tonumber(0) then
send(msg.chat_id_,msg.id_,' ⌯︙ ليس لديك نقاط في الالعاب\n ⌯︙ اذا كنت تريد ربح نقاط \n ⌯︙ ارسل الالعاب وابدأ اللعب ! ') 
else
local NUM_GAMES = bot_data:get(ban_id..'NUM:GAMES'..msg.chat_id_..msg.sender_user_id_)
if tonumber(NUMPY) > tonumber(NUM_GAMES) then
send(msg.chat_id_,msg.id_,'\n ⌯︙ ليس لديك نقاط في هذه لعبه \n ⌯︙ لزيادة نقاطك في اللعبه \n ⌯︙ ارسل الالعاب وابدأ اللعب !') 
return false 
end
local NUMNKO = (NUMPY * 50)
bot_data:decrby(ban_id..'NUM:GAMES'..msg.chat_id_..msg.sender_user_id_,NUMPY)  
bot_data:incrby(ban_id..'Msg_User'..msg.chat_id_..':'..msg.sender_user_id_,NUMNKO)  
send(msg.chat_id_,msg.id_,' ⌯︙ تم خصم * ⋖ { '..NUMPY..' }* من نقاطك \n ⌯︙ وتم اضافة*  ⋖ { '..(NUMPY * 50)..' } رساله الى رسالك *')
end 
return false 
end
if text == 'فحص البوتت' and Manager(msg) then
local Chek_Info = https.request('https://api.telegram.org/bot'..token..'/getChatMember?chat_id='.. msg.chat_id_ ..'&user_id='.. ban_id..'')
local Json_Info = JSON.decode(Chek_Info)
if Json_Info.ok == true then
if Json_Info.result.status == "administrator" then
if Json_Info.result.can_change_info == true then
info = '✔️' else info = '✖' end
if Json_Info.result.can_delete_messages == true then
delete = '✔️' else delete = '✖' end
if Json_Info.result.can_invite_users == true then
invite = '✔️' else invite = '✖' end
if Json_Info.result.can_pin_messages == true then
pin = '✔️' else pin = '✖' end
if Json_Info.result.can_restrict_members == true then
restrict = '✔️' else restrict = '✖' end
if Json_Info.result.can_promote_members == true then
promote = '✔️' else promote = '✖' end 
send(msg.chat_id_,msg.id_,'\n ⌯︙ اهلا عزيزي البوت هنا ادمن'..'\n ⌯︙ وصلاحياته هي ↓ \n━━━━━━━━━━'..'\n ⌯︙ تغير معلومات الجروب ↞ ❴ '..info..' ❵'..'\n ⌯︙ مسح الرسائل ↞ ❴ '..delete..' ❵'..'\n ⌯︙ حظر المستخدمين ↞ ❴ '..restrict..' ❵'..'\n ⌯︙ دعوة مستخدمين ↞ ❴ '..invite..' ❵'..'\n ⌯︙ تثبيت الرسائل ↞ ❴ '..pin..' ❵'..'\n ⌯︙ اضافة مشرفين جدد ↞ ❴ '..promote..' ❵')   
end
end
end


if text and text:match("^تغير رد المطور (.*)$") and Manager(msg) then
local Teext = text:match("^تغير رد المطور (.*)$") 
bot_data:set(ban_id.."Sudo:Rd"..msg.chat_id_,Teext)
send(msg.chat_id_, msg.id_," ⌯︙ تم تغير رد المطور الى  ⋖ "..Teext)
end
if text and text:match("^تغير رد المالك (.*)$") and Manager(msg) then
local Teext = text:match("^تغير رد المالك (.*)$") 
bot_data:set(ban_id.."CoSu:Rd"..msg.chat_id_,Teext)
send(msg.chat_id_, msg.id_," ⌯︙ تم تغير رد المالك الى  ⋖ "..Teext)
end
if text and text:match("^تغير رد منشئ الاساسي (.*)$") and Manager(msg) then
local Teext = text:match("^تغير رد منشئ الاساسي (.*)$") 
bot_data:set(ban_id.."BasicConstructor:Rd"..msg.chat_id_,Teext)
send(msg.chat_id_, msg.id_," ⌯︙ تم تغير رد المنشئ الاساسي الى  ⋖ "..Teext)
end
if text and text:match("^تغير رد المنشئ (.*)$") and Manager(msg) then
local Teext = text:match("^تغير رد المنشئ (.*)$") 
bot_data:set(ban_id.."Constructor:Rd"..msg.chat_id_,Teext)
send(msg.chat_id_, msg.id_," ⌯︙ تم تغير رد المنشئ الى  ⋖ "..Teext)
end
if text and text:match("^تغير رد المدير (.*)$") and Manager(msg) then
local Teext = text:match("^تغير رد المدير (.*)$") 
bot_data:set(ban_id.."Manager:Rd"..msg.chat_id_,Teext) 
send(msg.chat_id_, msg.id_," ⌯︙ تم تغير رد المدير الى  ⋖ "..Teext)
end
if text and text:match("^تغير رد الادمن (.*)$") and Manager(msg) then
local Teext = text:match("^تغير رد الادمن (.*)$") 
bot_data:set(ban_id.."Mod:Rd"..msg.chat_id_,Teext)
send(msg.chat_id_, msg.id_," ⌯︙ تم تغير رد الادمن الى  ⋖ "..Teext)
end
if text and text:match("^تغير رد المميز (.*)$") and Manager(msg) then
local Teext = text:match("^تغير رد المميز (.*)$") 
bot_data:set(ban_id.."Special:Rd"..msg.chat_id_,Teext)
send(msg.chat_id_, msg.id_," ⌯︙ تم تغير رد المميز الى  ⋖ "..Teext)
end
if text and text:match("^تغير رد الـعـضو  (.*)$") and Manager(msg) then
local Teext = text:match("^تغير رد الـعـضو  (.*)$") 
bot_data:set(ban_id.."Memp:Rd"..msg.chat_id_,Teext)
send(msg.chat_id_, msg.id_," ⌯︙ تم تغير رد الـعـضو  الى  ⋖ "..Teext)
end

if text and text:match("^(.*)$") then
if bot_data:get(ban_id..'help'..msg.sender_user_id_) == 'true' then
send(msg.chat_id_, msg.id_, ' ⌯︙ تم حفظ الكليشه')
bot_data:del(ban_id..'help'..msg.sender_user_id_)
bot_data:set(ban_id..'help_text',text)
return false
end
end
if text and text:match("^(.*)$") then
if bot_data:get(ban_id..'help1'..msg.sender_user_id_) == 'true' then
send(msg.chat_id_, msg.id_, ' ⌯︙ تم حفظ الكليشه')
bot_data:del(ban_id..'help1'..msg.sender_user_id_)
bot_data:set(ban_id..'help1_text',text)
return false
end
end
if text and text:match("^(.*)$") then
if bot_data:get(ban_id..'help2'..msg.sender_user_id_) == 'true' then
send(msg.chat_id_, msg.id_, ' ⌯︙ تم حفظ الكليشه')
bot_data:del(ban_id..'help2'..msg.sender_user_id_)
bot_data:set(ban_id..'help2_text',text)
return false
end
end

if text and text:match("^(.*)$") then
if bot_data:get(ban_id..'help3'..msg.sender_user_id_) == 'true' then
send(msg.chat_id_, msg.id_, ' ⌯︙ تم حفظ الكليشه')
bot_data:del(ban_id..'help3'..msg.sender_user_id_)
bot_data:set(ban_id..'help3_text',text)
return false
end
end
if text and text:match("^(.*)$") then
if bot_data:get(ban_id..'help4'..msg.sender_user_id_) == 'true' then
send(msg.chat_id_, msg.id_, ' ⌯︙ تم حفظ الكليشه')
bot_data:del(ban_id..'help4'..msg.sender_user_id_)
bot_data:set(ban_id..'help4_text',text)
return false
end
end
if text and text:match("^(.*)$") then
if bot_data:get(ban_id..'help5'..msg.sender_user_id_) == 'true' then
send(msg.chat_id_, msg.id_, ' ⌯︙ تم حفظ الكليشه')
bot_data:del(ban_id..'help5'..msg.sender_user_id_)
bot_data:set(ban_id..'help5_text',text)
return false
end
end
if text and text:match("^(.*)$") then
if bot_data:get(ban_id..'help6'..msg.sender_user_id_) == 'true' then
send(msg.chat_id_, msg.id_, ' ⌯︙ تم حفظ الكليشه')
bot_data:del(ban_id..'help6'..msg.sender_user_id_)
bot_data:set(ban_id..'help6_text',text)
return false
end
end
if text and text:match("^(.*)$") then
if bot_data:get(ban_id..'help7'..msg.sender_user_id_) == 'true' then
send(msg.chat_id_, msg.id_, ' ⌯︙ تم حفظ الكليشه')
bot_data:del(ban_id..'help7'..msg.sender_user_id_)
bot_data:set(ban_id..'help7_text',text)
return false
end
end
if text and text:match("^(.*)$") then
if bot_data:get(ban_id..'help8'..msg.sender_user_id_) == 'true' then
send(msg.chat_id_, msg.id_, ' ⌯︙ تم حفظ الكليشه')
bot_data:del(ban_id..'help8'..msg.sender_user_id_)
bot_data:set(ban_id..'help8_text',text)
return false
end
end
if text and text:match("^(.*)$") then
if bot_data:get(ban_id..'help9'..msg.sender_user_id_) == 'true' then
send(msg.chat_id_, msg.id_, ' ⌯︙ تم حفظ الكليشه')
bot_data:del(ban_id..'help9'..msg.sender_user_id_)
bot_data:set(ban_id..'help9_text',text)
return false
end
end
if text and text:match("^(.*)$") then
if bot_data:get(ban_id..'help10'..msg.sender_user_id_) == 'true' then
send(msg.chat_id_, msg.id_, ' ⌯︙ تم حفظ الكليشه')
bot_data:del(ban_id..'help10'..msg.sender_user_id_)
bot_data:set(ban_id..'help10_text',text)
return false
end
end

if text == 'استعاده الاوامر' and Devban(msg) then
bot_data:del(ban_id..'help_text')
bot_data:del(ban_id..'help1_text')
bot_data:del(ban_id..'help2_text')
bot_data:del(ban_id..'help3_text')
bot_data:del(ban_id..'help4_text')
bot_data:del(ban_id..'help5_text')
bot_data:del(ban_id..'help6_text')
bot_data:del(ban_id..'help7_text')
bot_data:del(ban_id..'help8_text')
bot_data:del(ban_id..'help9_text')
bot_data:del(ban_id..'help10_text')
send(msg.chat_id_, msg.id_, ' ⌯︙ تم استعادة الاوامر القديمه')
end
if text == 'تغير امر الاوامر' and Devban(msg) then
send(msg.chat_id_, msg.id_, ' ⌯︙ الان يمكنك ارسال الكليشه الاوامر')
bot_data:set(ban_id..'help'..msg.sender_user_id_,'true')
return false 
end
if text == 'تغير امر ⓵' and Devban(msg) then
send(msg.chat_id_, msg.id_, ' ⌯︙ الان يمكنك ارسال الكليشه ⓵')
bot_data:set(ban_id..'help1'..msg.sender_user_id_,'true')
return false 
end

if text == 'تغير امر⓶' and Devban(msg) then
send(msg.chat_id_, msg.id_, ' ⌯︙ الان يمكنك ارسال الكليشه⓶')
bot_data:set(ban_id..'help2'..msg.sender_user_id_,'true')
return false 
end

if text == 'تغير امر ⓷' and Devban(msg) then
send(msg.chat_id_, msg.id_, ' ⌯︙ الان يمكنك ارسال الكليشه ⓷')
bot_data:set(ban_id..'help3'..msg.sender_user_id_,'true')
return false 
end

if text == 'تغير امر⓸' and Devban(msg) then
send(msg.chat_id_, msg.id_, ' ⌯︙ الان يمكنك ارسال الكليشه⓸')
bot_data:set(ban_id..'help4'..msg.sender_user_id_,'true')
return false 
end

if text == 'تغير امر ⓹' and Devban(msg) then
send(msg.chat_id_, msg.id_, ' ⌯︙ الان يمكنك ارسال الكليشه ⓹')
bot_data:set(ban_id..'help5'..msg.sender_user_id_,'true')
return false 
end

if text == 'تغير امر ⓺' and Devban(msg) then
send(msg.chat_id_, msg.id_, ' ⌯︙ الان يمكنك ارسال الكليشه ⓺')
bot_data:set(ban_id..'help6'..msg.sender_user_id_,'true')
return false 
end

if text == 'تغير امر اوامر التسليه' and Devban(msg) then
send(msg.chat_id_, msg.id_, ' ⌯︙ الان يمكنك ارسال الكليشه اوامر التسليه')
bot_data:set(ban_id..'help7'..msg.sender_user_id_,'true')
return false 
end

if text == 'تغير امر اوامر 𝗗𝗲𝘃 𝗕𝗼𝘁' and Devban(msg) then
send(msg.chat_id_, msg.id_, ' ⌯︙  الان يمكنك ارسال الكليشه اوامر 𝗗𝗲𝘃 𝗕𝗼𝘁')
bot_data:set(ban_id..'help8'..msg.sender_user_id_,'true')
return false 
end

if text == 'تغير امر اوامر مطور الاساسي' and Devban(msg) then
send(msg.chat_id_, msg.id_, ' ⌯︙ الان يمكنك ارسال الكليشه اوامر مطور الاساسي')
bot_data:set(ban_id..'help9'..msg.sender_user_id_,'true')
return false 
end

if text == 'تغير امر اوامر الاعضاء' and Devban(msg) then
send(msg.chat_id_, msg.id_, ' ⌯︙ الان يمكنك ارسال الكليشه اوامر الاعضاء')
bot_data:set(ban_id..'help10'..msg.sender_user_id_,'true')
return false 
end


if text == "تعطيل الابراج" and Manager(msg) then
send(msg.chat_id_, msg.id_, ' ⌯︙ تم تعطيل الابراج')
bot_data:set(ban_id.." ban:brj_Bots"..msg.chat_id_,"close")
end
if text == "تفعيل الابراج" and Manager(msg) then
send(msg.chat_id_, msg.id_,' ⌯︙ تم تفعيل الابراج')
bot_data:set(ban_id.." ban:brj_Bots"..msg.chat_id_,"open")
end
if text and text:match("^برج (.*)$") and bot_data:get(ban_id.." ban:brj_Bots"..msg.chat_id_) == "open" then
local Textbrj = text:match("^برج (.*)$")
gk = https.request('https://rudi-dev.tk/Amir2/Boyka.php?br='..URL.escape(Textbrj)..'')
br = JSON.decode(gk)
i = 0
for k,v in pairs(br.ok) do
i = i + 1
t = v.."\n"
end
send(msg.chat_id_, msg.id_, t)
end
if text == "تعطيل حساب العمر" and Manager(msg) then
send(msg.chat_id_, msg.id_, ' ⌯︙ تم تعطيل حساب العمر')
bot_data:set(ban_id.." ban:age_Bots"..msg.chat_id_,"close")
end
if text == "تعطيل حساب العمر" and Manager(msg) then
send(msg.chat_id_, msg.id_, ' ⌯︙ تم تعطيل حساب العمر')
bot_data:set(ban_id.." ban:age_Bots"..msg.chat_id_,"close")
end
if text == "تفعيل حساب العمر" and Manager(msg) then
send(msg.chat_id_, msg.id_,' ⌯︙ تم تفعيل حساب العمر')
bot_data:set(ban_id.." ban:age_Bots"..msg.chat_id_,"open")
end

if text and text:match("^احسب (.*)$") and bot_data:get(ban_id.." ban:age_Bots"..msg.chat_id_) == "open" then
local Textage = text:match("^احسب (.*)$")
ge = https.request('https://rudi-dev.tk/Amir3/Boyka.php?age='..URL.escape(Textage)..'')
ag = JSON.decode(ge)
i = 0
for k,v in pairs(ag.ok) do
i = i + 1
t = v.."\n"
end
send(msg.chat_id_, msg.id_, t)
end
if text and not database:get(bot_id.."AutoFile") then
Time = database:get(bot_id.."AutoFile:Time")
if Time then 
if Time ~= os.date("%x") then  
local list = database:smembers(bot_id..'Chek:Groups') 
local t = '{"BOT_ID": '..bot_id..',"GP_BOT":{'  
for k,v in pairs(list) do   
NAME = 'TELANDW Chat'
link = database:get(bot_id.."Private:Group:Link"..msg.chat_id_) or ''
CoSu = database:smembers(bot_id..'CoSu'..v)
ASAS = database:smembers(bot_id..'Basic:Constructor'..v)
MNSH = database:smembers(bot_id..'Constructor'..v)
MDER = database:smembers(bot_id..'Manager'..v)
MOD = database:smembers(bot_id..'Mod:User'..v)
if k == 1 then
t = t..'"'..v..'":{"TELANDW":"'..NAME..'",'
else
t = t..',"'..v..'":{"TELANDW":"'..NAME..'",'
end
if #CoSu ~= 0 then 
t = t..'"CoSu":['
for k,v in pairs(CoSu) do
if k == 1 then
t =  t..'"'..v..'"'
else
t =  t..',"'..v..'"'
end
end   
t = t..'],'
end
if #ASAS ~= 0 then 
t = t..'"ASAS":['
for k,v in pairs(ASAS) do
if k == 1 then
t =  t..'"'..v..'"'
else
t =  t..',"'..v..'"'
end
end   
t = t..'],'
end
if #MOD ~= 0 then
t = t..'"MOD":['
for k,v in pairs(MOD) do
if k == 1 then
t =  t..'"'..v..'"'
else
t =  t..',"'..v..'"'
end
end   
t = t..'],'
end
if #MDER ~= 0 then
t = t..'"MDER":['
for k,v in pairs(MDER) do
if k == 1 then
t =  t..'"'..v..'"'
else
t =  t..',"'..v..'"'
end
end   
t = t..'],'
end
if #MNSH ~= 0 then
t = t..'"MNSH":['
for k,v in pairs(MNSH) do
if k == 1 then
t =  t..'"'..v..'"'
else
t =  t..',"'..v..'"'
end
end   
t = t..'],'
end
t = t..'"linkgroup":"'..link..'"}' or ''
end
t = t..'}}'
local File = io.open('./'..bot_id..'.json', "w")
File:write(t)
File:close()
sendDocument(SUDO, msg.id_,0, 1, nil, './'..bot_id..'.json', '⌯︙عدد مجموعات التي في البوت { '..#list..'}')
database:set(bot_id.."AutoFile:Time",os.date("%x"))
end
else 
database:set(bot_id.."AutoFile:Time",os.date("%x"))
end
end
if text == "رد عليه يابوت" or text == "رد عليه" or text == "در انت يابوت" then
if not bot_data:get(ban_id..'lock:add'..msg.chat_id_) then
local texting = {"ولد ولا بنت 🤓"}
send(msg.chat_id_, msg.id_, ''..texting[math.random(#texting)]..'')
end
end
if text == "عقاب" or text == "قول عقاب" or text == "العقاب" then
if not bot_data:get(ban_id..'lock:add'..msg.chat_id_) then
local texting = {"قل لواحد ماتعرفه عطني كف 🧸","🧸سو مشهد تمثيلي عن مصرية بتولد","🧸صور اي شيء يطلبه منك الاعبين","🧸البس طرحه امك او اختك ","🧸لا خلاص معتش في سمحتك"," 🧸اتصل لاخوك و قول له انك سويت حادث و الخ....","🧸تكلم باللغة الانجليزية الين يجي دورك مرة ثانية لازم تتكلم اذا ما تكلمت تنفذ عقاب ثاني","🧸تروح عند شخص تقول له ","🧸 اتصل على ابوك و قول له انك رحت مع بنت و احين هي حامل....","🧸اتصل على امك و قول لها انك ","🧸اذا انت ولد اكسر اغلى او احسن عطور عندك اذا انتي بنت اكسري الروج حقك او الميك اب حقك"}
send(msg.chat_id_, msg.id_, ''..texting[math.random(#texting)]..'')
end
end
if text == "بنت" then
if not bot_data:get(ban_id..'lock:add'..msg.chat_id_) then
local texting = {"اي ي جامده تعي بف هاتي رقمك وهكلمك بليل ي وتكه انتي هاتي بوسه💋😉","اي ي جامده متجبي بوسه ولا اقولك هاتي رقمك اكلمك واتس واخلي بابا يتجوزك😉💋🤸‍♂","ي بت كلمي بابا عايزك بف وابعتي رقمك ها بابا بيحبك 💋❤️🤍🤸‍♂🤸‍♂😉","يعم دي اقل من اني اديها رقمي 😎😜"}
send(msg.chat_id_, msg.id_, ''..texting[math.random(#texting)]..'')
end
end
if text == "تفعيل مريم"  then
if Constructor(msg) then  
bot_data:set(ban_id.."my_maryam:status"..msg.chat_id_,true) 
send(msg.chat_id_, msg.id_," ⌯︙ تـم تـفعـيل مريم") 
return false  
end
end

if text == "تعطيل مريم"  then
if Constructor(msg) then  
bot_data:del(ban_id.."my_maryam:status"..msg.chat_id_) 
send(msg.chat_id_, msg.id_," ⌯︙ تـم تـعـطـيل مريم") 
return false end
end

if text == "ولد" then
if not bot_data:get(ban_id..'lock:add'..msg.chat_id_) then
local texting = {"دا عيل بيضااان","ولا بطيقه اصلا","اقل من اني افكر فيه","كسمو مش حوار"," ظريط سيببك منو"," يعم دا حكاك هتعمل عقلك بي","يابا دا اقل من انك ترد عليه","فكك منه م يستاهلش","احظره واريخ دماغي؟!!"}
send(msg.chat_id_, msg.id_, ''..texting[math.random(#texting)]..'')
end
end
if text == "بتكره دا" then
if not bot_data:get(ban_id..'lock:add'..msg.chat_id_) then
local texting = {"دا عيل بيضااان","ولا بطيقه اصلا","اقل من اني افكر فيه"}
send(msg.chat_id_, msg.id_, ''..texting[math.random(#texting)]..'')
end
end
if text == "هينه" or text == "رزله" or text == "هيني" or text == "رزلي" then
if not bot_data:get(ban_id..'lock:add'..msg.chat_id_) then
local texting = {"يابا دا اقل من انك ترد عليه","فكك منه م يستاهلش","احظره واريخ دماغي؟!! "}
send(msg.chat_id_, msg.id_, ''..texting[math.random(#texting)]..'')
end
end
if text == "مصه" or text == "بوسه" or text == "بوسي" or text == "مصي" then
if not bot_data:get(ban_id..'lock:add'..msg.chat_id_) then
local texting = {"مووووووووواححح💋","الوجه ميساعد😒","تؤ مش ادام الناس😉","لا عيب","يوهه بتكثف🙄","مش بايس حد انا"}send(msg.chat_id_, msg.id_, ''..texting[math.random(#texting)]..'')
end
end

if text == 'الرابط' or text == 'رابط'  then
local Text = [[
•اختار نوع الرابط الي ترودي⇣
]]
keyboard = {} 
keyboard.inline_keyboard = {
{{text = 'رابط اونلاين', callback_data="/ven2"},{text = 'رابط بالصور', callback_data="/ven1"}},   
{{text = 'رابط بنص', callback_data="/ven3"}},
{{text = '•𝗧𝗲𝗮𝗺 𝗚𝗼𝗹𝗱♪', url="t.me/g_00_l_d"}},
}
local msg_id = msg.id_/2097152/0.5
https.request("https://api.telegram.org/bot"..token..'/sendMessage?chat_id=' .. msg.chat_id_ .. '&text=' .. URL.escape(Text).."&reply_to_message_id="..msg_id.."&parse_mode=markdown&disable_web_page_preview=true&reply_markup="..JSON.encode(keyboard))
end

if text == "صلاحياته" and tonumber(msg.reply_to_message_id_) > 0 then    
if tonumber(msg.reply_to_message_id_) ~= 0 then 
function prom_reply(extra, result, success) 
Get_Info(msg,msg.chat_id_,result.sender_user_id_)
end  
tdcli_function ({ID = "GetMessage",chat_id_=msg.chat_id_,message_id_=tonumber(msg.reply_to_message_id_)},prom_reply, nil)
end
end
------------------------------------------------------------------------
if text == "صلاحياتي" then 
if tonumber(msg.reply_to_message_id_) == 0 then 
Get_Info(msg,msg.chat_id_,msg.sender_user_id_)
end  
------------------------------------------------------------------------
if text and text:match('^صلاحياته @(.*)') then   
local username = text:match('صلاحياته @(.*)')   
if tonumber(msg.reply_to_message_id_) == 0 then 
function prom_username(extra, result, success) 
if (result and result.code_ == 400 or result and result.message_ == "USERNAME_NOT_OCCUPIED") then
SendText(msg.chat_id_,msg.id_,"- المعرف غير صحيح \n*")   
return false  end   

Get_Info(msg,msg.chat_id_,result.id_)
end  
tdcli_function ({ID = "SearchPublicChat",username_ = username},prom_username,nil) 
end 
end
--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
end -- Chat_Type = 'GroupBot' 
end -- end msg 
--------------------------------------------------------------------------------------------------------------
function tdcli_update_callback(data)  -- clback
if data.ID == "UpdateChannel" then 
if data.channel_.status_.ID == "ChatMemberStatusKicked" then 
bot_data:srem(ban_id..'Chek:Groups','-100'..data.channel_.id_)  
end
end
if data.ID == "UpdateNewCallbackQuery" then
local Chat_id = data.chat_id_
local Msg_id = data.message_id_
local msg_idd = Msg_id/2097152/0.5
local Text = data.payload_.data_
if Text and Text:match("^(%d+):searchVid(.*)$") then
id_from_user  = Text:match("(%d+)")  
local OnVid = Text:gsub(':searchVid',''):gsub(id_from_user,'')
msgidrp  = OnVid:match("(%d+)")
local id_from_vid = Text:gsub(':',''):gsub('searchVid',''):gsub(id_from_user,''):gsub(msgidrp,'')
if tonumber(data.sender_user_id_) ~= tonumber(id_from_user) then  
local notText = 'متلعبش ف زراير هديك بلقلم'
https.request("https://api.telegram.org/bot"..token.."/answerCallbackQuery?callback_query_id="..data.id_.."&text="..URL.escape(notText).."&show_alert=true")
return false
end
object = https.request('https://black-source.tk/Api/InfoVid.php?url=http://www.youtube.com/watch?v='..URL.escape(id_from_vid))
objectend = JSON.decode(object)
infovid = "⌯︙ اختر صيغه التنزيل الان.\n"
keyboard = {} 
keyboard.inline_keyboard = {
{{text = 'video', callback_data=id_from_user..":DownloadVid:"..msgidrp..":"..id_from_vid..":video"}},
{{text = 'Mp4', callback_data=id_from_user..":DownloadVid:"..msgidrp..":"..id_from_vid..":Mp4"},{text = 'mp3', callback_data=id_from_user..":DownloadVid:"..msgidrp..":"..id_from_vid..":mp3"}},
{{text = 'source klaer',url='http://t.me/g_00_l_d'}},
}
https.request("https://api.telegram.org/bot"..token..'/editMessageText?chat_id='..Chat_id..'&text='..URL.escape(infovid)..'&message_id='..msg_idd..'&parse_mode=markdown&disable_web_page_preview=true&reply_markup='..JSON.encode(keyboard)) 
InfoVid = https.request('https://black-source.tk/Api/BotYoutube.php?Id='..URL.escape(id_from_vid))
InfoVidend = JSON.decode(InfoVid)
if InfoVidend.Info.video == "not" then  
https.request("https://vvvzvv.ml/Xx/searchinbot.php?V="..URL.escape(id_from_vid).."&ch=do")
end
end
if Text and Text:match("^(%d+):DownloadVid(.*)$") then
local notId  = Text:match("(%d+)")  
if tonumber(data.sender_user_id_) ~= tonumber(notId) then  
local notText = '⌯︙ عذرا الاوامر هذه لا تخصك'
https.request("https://api.telegram.org/bot"..token.."/answerCallbackQuery?callback_query_id="..data.id_.."&text="..URL.escape(notText).."&show_alert=true")
return false
end
https.request("https://api.telegram.org/bot"..token.."/deleteMessage?chat_id="..Chat_id.."&message_id="..msg_idd)
https.request("https://vvvzvv.ml/Xx/searchinbot.php?token="..token.."&chat_id="..Chat_id.."&data="..URL.escape(Text).."&n=do")
end
Ok_id  = Text:match("(%d+)")  
if Text == 'okCaptcha'..data.sender_user_id_ then  
DeleteMessage(Chat_id, {[0] = Msg_id}) 
return https.request("https://api.telegram.org/bot" .. token .. "/restrictChatMember?chat_id=" .. Chat_id .. "&user_id="..Ok_id .. "&can_send_messages=True&can_send_media_messages=True&can_send_other_messages=True&can_add_web_page_previews=True")
end
if Text == '/ven3' then
if not CoSu(data) then
local notText = '✘ عذرا الاوامر هذه لا تخصك'
https.request("https://api.telegram.org/bot"..token.."/answerCallbackQuery?callback_query_id="..data.id_.."&text="..URL.escape(notText).."&show_alert=true")
return false
end
tdcli_function({ID ="GetChat",chat_id_=msg.chat_id_},function(arg,ta) 
local link = bot_data:get(ban_id.."Private:Group:Link"..msg.chat_id_)            
if link then                              
send(msg.chat_id_,msg.id_,'.\nـــــــــــــــــــــــــ\n ['..ta.title_..']('..link..')')                          
else                
local linkgpp = json:decode(https.request('https://api.telegram.org/bot'..token..'/exportChatInviteLink?chat_id='..msg.chat_id_))
if linkgpp.ok == true then 
linkgp = '• 🖤 |ＬＩＮＫ ＧＲＯＵＰ.\nـــــــــــــــــــــــــ\n ['..ta.title_..']('..linkgpp.result..')\nـــــــــــــــــــــــــ\n  ['..linkgpp.result..']'
else
linkgp = ' لا يوجد رابط ارسل ضع رابط'
end  
DeleteMessage(Chat_id,{[0] = Msg_id})  
send(msg.chat_id_, msg.id_,linkgp)              
end      
end,nil)
end
if Text == '/ven1' then
if not CoSu(data) then
local notText = '✘ عذرا الاوامر هذه لا تخصك'
https.request("https://api.telegram.org/bot"..token.."/answerCallbackQuery?callback_query_id="..data.id_.."&text="..URL.escape(notText).."&show_alert=true")
return false
end
tdcli_function({ID ="GetChat",chat_id_=msg.chat_id_},function(arg,ta) 
local linkgpp = json:decode(https.request('https://api.telegram.org/bot'..token..'/exportChatInviteLink?chat_id='..msg.chat_id_)) or bot_data:get(ban_id.."Private:Group:Link"..msg.chat_id_) 
if linkgpp.ok == true then 
local linkgp = '• 🖤 |ＬＩＮＫ ＧＲＯＵＰ.\nـــــــــــــــــــــــــ\n ['..ta.title_..']('..linkgpp.result..')\nـــــــــــــــــــــــــ\n  ['..linkgpp.result..']'
keyboard = {} 
keyboard.inline_keyboard = {{{text = ta.title_, url=linkgpp.result}},}
DeleteMessage(Chat_id,{[0] = Msg_id})  
https.request("https://api.telegram.org/bot"..token..'/sendmessage?chat_id=' .. msg.chat_id_ .. '&text=' .. URL.escape(linkgp).."&parse_mode=markdown&reply_markup="..JSON.encode(keyboard)) 
else 
send(msg.chat_id_, msg.id_,'⌯︙ لا يوجد رابط ارسل ضع رابط') 
end 
end,nil) 
end
if Text == '/ven2' then
if not CoSu(data) then
local notText = '✘ عذرا الاوامر هذه لا تخصك'
https.request("https://api.telegram.org/bot"..token.."/answerCallbackQuery?callback_query_id="..data.id_.."&text="..URL.escape(notText).."&show_alert=true")
return false
end
tdcli_function({ID ="GetChat",chat_id_=msg.chat_id_},function(arg,ta) 
local linkgpp = json:decode(https.request('https://api.telegram.org/bot'..token..'/exportChatInviteLink?chat_id='..msg.chat_id_)) or bot_data:get(ban_id.."Private:Group:Link"..msg.chat_id_) 
if linkgpp.ok == true then 
local linkgp = '• 🖤 |ＬＩＮＫ ＧＲＯＵＰ.\nـــــــــــــــــــــــــ\n ['..ta.title_..']('..linkgpp.result..')\nـــــــــــــــــــــــــ\n  ['..linkgpp.result..']'
local inline = {{{text = ta.title_, url=linkgpp.result}},} 
DeleteMessage(Chat_id,{[0] = Msg_id})  
send_inline_key(msg.chat_id_,linkgp,nil,inline,msg.id_/2097152/0.5) 
else 
send(msg.chat_id_, msg.id_,'⌯︙ لا يوجد رابط ارسل ضع رابط') 
end 
end,nil) 
end
if Text and Text:match("^/t7km1 (.*)$") then
local userid = Text:match("^/t7km1 (.*)$")
if not Mod(data) then
local notText = 'يجب ان تكون ادمن لاستخدام هذا الامر'
https.request("https://api.telegram.org/bot"..token.."/answerCallbackQuery?callback_query_id="..data.id_.."&text="..URL.escape(notText).."&show_alert=true")
return false
end
local text = 'تم الغاء كتم العضو بنجاح'
bot_data:srem(ban_id..'Muted:User'..Chat_id, userid)
return https.request("https://api.telegram.org/bot"..token..'/editMessageText?chat_id='..Chat_id..'&text='..URL.escape(text)..'&message_id='..msg_idd) 
end
if Text and Text:match("^/t7km2 (.*)$") then
local userid = Text:match("^/t7km2 (.*)$")
if not Mod(data) then
local notText = 'يجب ان تكون ادمن لاستخدام هذا الامر'
https.request("https://api.telegram.org/bot"..token.."/answerCallbackQuery?callback_query_id="..data.id_.."&text="..URL.escape(notText).."&show_alert=true")
return false
end
local text = 'تم كتم العضو بنجاح'
bot_data:sadd(ban_id..'Muted:User'..Chat_id, userid)
return https.request("https://api.telegram.org/bot"..token..'/editMessageText?chat_id='..Chat_id..'&text='..URL.escape(text)..'&message_id='..msg_idd) 
end
if Text and Text:match("^/t7kmrtb1 (.*)$") then
local userid = Text:match("^/t7kmrtb1 (.*)$")
if not Mod(data) then
local notText = '✘ يجب ان تكون ادمن للضغط هنا'
https.request("https://api.telegram.org/bot"..token.."/answerCallbackQuery?callback_query_id="..data.id_.."&text="..URL.escape(notText).."&show_alert=true")
return false
end
local Teext = 'اضغط علي زراير لتنزيل الرتبه'
keyboard = {} 
keyboard.inline_keyboard = {
{
{text = 'مطور', callback_data="/t7kmrtb1_2 "..userid},{text = 'مطور ثانوي', callback_data="/t7kmrtb1_1 "..userid},
},
{{text = 'انتيمي', callback_data="/t7kmrtb2_320 "..userid}},
{
{text = 'منشئ', callback_data="/t7kmrtb1_5 "..userid},{text = 'منشئ اساسي', callback_data="/t7kmrtb1_4 "..userid},
},
{
{text = 'مالك', callback_data="/t7kmrtb1_3 "..userid},{text = 'مدير', callback_data="/t7kmrtb1_6 "..userid},
},
{
{text = 'ادمن', callback_data="/t7kmrtb1_7 "..userid},{text = 'مميز', callback_data="/t7kmrtb1_8 "..userid},
},
{
{text = 'الغاء الامر', callback_data="/hide"},
},
}
local msg_id = msg.id_/2097152/0.5
https.request("https://api.telegram.org/bot"..token..'/sendMessage?chat_id=' .. msg.chat_id_ .. '&text=' .. URL.escape(Text).."&reply_to_message_id="..msg_id.."&parse_mode=markdown&disable_web_page_preview=true&reply_markup="..JSON.encode(keyboard))
return false
end

if Text and Text:match("^/t7kmrtb2 (.*)$") then
local userid = Text:match("^/t7kmrtb2 (.*)$")
if not Mod(data) then
local notText = 'متلعبش ف زراير ي حبيبي'
https.request("https://api.telegram.org/bot"..token.."/answerCallbackQuery?callback_query_id="..data.id_.."&text="..URL.escape(notText).."&show_alert=true")
return false
end
local Teext = 'اضغط ع زراير للرفع رتبه'
keyboard = {} 
keyboard.inline_keyboard = {
{
{text = 'مطور', callback_data="/t7kmrtb2_2 "..userid},{text = 'مطور ثانوي', callback_data="/t7kmrtb2_1 "..userid},
},
{{text = 'انتيمي', callback_data="/t7kmrtb2_300 "..userid}},
{
{text = 'منشئ', callback_data="/t7kmrtb2_5 "..userid},{text = 'منشئ اساسي', callback_data="/t7kmrtb2_4 "..userid},
},
{
{text = 'مالك', callback_data="/t7kmrtb2_3 "..userid},{text = 'مدير', callback_data="/t7kmrtb2_6 "..userid},
},
{
{text = 'ادمن', callback_data="/t7kmrtb2_7 "..userid},{text = 'مميز', callback_data="/t7kmrtb2_8 "..userid},
},
{
{text = 'الغاء الامر', callback_data="/hide"},
},
}
return https.request("https://api.telegram.org/bot"..token..'/editMessageText?chat_id='..Chat_id..'&text='..URL.escape(Teext)..'&message_id='..msg_idd..'&parse_mode=markdown&disable_web_page_preview=true&reply_markup='..JSON.encode(keyboard)) 
end



if Text and Text:match("^/t7kmrtb2_2 (.*)$") then
local userid = Text:match("^/t7kmrtb2_2 (.*)$")
if not msa3d(data) then
local notText = 'يجب ان تكون رتبتك اعلي لاستخدام هذا الامر'
https.request("https://api.telegram.org/bot"..token.."/answerCallbackQuery?callback_query_id="..data.id_.."&text="..URL.escape(notText).."&show_alert=true")
return false
end
if AddChannel(msg.sender_user_id_) == false then
local textchuser = bot_data:get(ban_id..'text:ch:user')
if textchuser then
send(msg.chat_id_, msg.id_,'['..textchuser..']')
else
send(msg.chat_id_, msg.id_,' ⌯︙ لا تستطيع استخدام البوت \n ⌯︙  يرجى الاشتراك بالقناه اولا \n ⌯︙  اشترك هنا ['..bot_data:get(ban_id..'add:ch:username')..']')
end
return false
end
bot_data:sadd(ban_id..'Sudo:User', userid)
tdcli_function ({ID = "GetUser",user_id_ = userid},function(arg,data) 
if data.first_name_ then
usertext = '\n ⌯︙ الـعـضو   ⌯︙ ['..data.first_name_..'](t.me/'..(data.username_ or 'g_00_l_d')..')'
status  = '\n ⌯︙ تم ترقيته مطور'
send(msg.chat_id_, msg.id_, usertext..status)
else
usertext = '\n ⌯︙ الـعـضو   ⌯︙ '..userid..''
status  = '\n ⌯︙ تم ترقيته مطور'
send(msg.chat_id_, msg.id_, usertext..status)
end;end,nil)
return false 
end

if Text and Text:match("^/t7kmrtb2_1 (.*)$") then
local userid = Text:match("^/t7kmrtb2_1 (.*)$")
if not msa3d(data) then
local notText = 'يجب ان تكون رتبتك اعلي لاستخدام هذا الامر'
https.request("https://api.telegram.org/bot"..token.."/answerCallbackQuery?callback_query_id="..data.id_.."&text="..URL.escape(notText).."&show_alert=true")
return false
end
bot_data:sadd(ban_id.."Dev:ban:2", userid)
Reply_Status(msg,userid,"reply","⌯︙ تم ترقيته مطور ثانوي في البوت")  
return false 
end

if Text and Text:match("^/t7kmrtb2_300 (.*)$") then
local userid = Text:match("^/t7kmrtb2_300 (.*)$")
if not msa3d(data) then
local notText = 'يجب ان تكون رتبتك اعلي لاستخدام هذا الامر'
https.request("https://api.telegram.org/bot"..token.."/answerCallbackQuery?callback_query_id="..data.id_.."&text="..URL.escape(notText).."&show_alert=true")
return false
end
bot_data:sadd(ban_id.."msa3d:ban", userid)
Reply_Status(msg,userid,"reply","⌯︙ تم ترقيته انتيمي في البوت")  
return false 
end

if Text and Text:match("^/t7kmrtb2_4 (.*)$") then
local userid = Text:match("^/t7kmrtb2_4 (.*)$")
if not CoSu(data) then
local notText = 'يجب ان تكون رتبتك اعلي لاستخدام هذا الامر'
https.request("https://api.telegram.org/bot"..token.."/answerCallbackQuery?callback_query_id="..data.id_.."&text="..URL.escape(notText).."&show_alert=true")
return false
end
if AddChannel(msg.sender_user_id_) == false then
local textchuser = bot_data:get(ban_id..'text:ch:user')
if textchuser then
send(msg.chat_id_, msg.id_,'['..textchuser..']')
else
send(msg.chat_id_, msg.id_,' ᥀ لا تستطيع استخدام البوت \n ᥀  يرجى الاشتراك بالقناه اولا \n ᥀  اشترك هنا ['..bot_data:get(ban_id..'add:ch:username')..']')
end
return false
end
bot_data:sadd(ban_id..'Basic:Constructor'..msg.chat_id_, userid)
tdcli_function ({ID = "GetUser",user_id_ = userid},function(arg,data) 
if data.first_name_ then
usertext = '\n ᥀ الـعـضو   ⌯︙ ['..data.first_name_..'](t.me/'..(data.username_ or 'g_00_l_d')..')'
status  = '\n ᥀ تم ترقيته منشئ اساسي'
send(msg.chat_id_, msg.id_, usertext..status)
else
usertext = '\n ᥀ الـعـضو   ⌯︙ '..userid..''
status  = '\n ᥀ تم ترقيته منشئ اساسي'
send(msg.chat_id_, msg.id_, usertext..status)
end;end,nil)
return false
end

if Text and Text:match("^/t7kmrtb2_5 (.*)$") then
local userid = Text:match("^/t7kmrtb2_5 (.*)$")
if not BasicConstructor(data) then
local notText = 'يجب ان تكون رتبتك اعلي لاستخدام هذا الامر'
https.request("https://api.telegram.org/bot"..token.."/answerCallbackQuery?callback_query_id="..data.id_.."&text="..URL.escape(notText).."&show_alert=true")
return false
end
if AddChannel(msg.sender_user_id_) == false then
local textchuser = bot_data:get(ban_id..'text:ch:user')
if textchuser then
send(msg.chat_id_, msg.id_,'['..textchuser..']')
else
send(msg.chat_id_, msg.id_,' ᥀ لا تستطيع استخدام البوت \n ᥀  يرجى الاشتراك بالقناه اولا \n ᥀  اشترك هنا ['..bot_data:get(ban_id..'add:ch:username')..']')
end
return false
end
bot_data:sadd(ban_id..'Constructor'..msg.chat_id_, userid)
tdcli_function ({ID = "GetUser",user_id_ = userid},function(arg,data) 
if data.first_name_ then
usertext = '\n ᥀ الـعـضو   ⌯︙ ['..data.first_name_..'](t.me/'..(data.username_ or 'g_00_l_d')..')'
status  = '\n ᥀ تم ترقيته منشئ'
send(msg.chat_id_, msg.id_, usertext..status)
else
usertext = '\n ᥀  الـعـضو   ⌯︙ '..userid..''
status  = '\n ᥀ تم ترقيته منشئ'
send(msg.chat_id_, msg.id_, usertext..status)
end;end,nil)
end

if Text and Text:match("^/t7kmrtb2_6 (.*)$") then
local userid = Text:match("^/t7kmrtb2_6 (.*)$")
if not Constructor(data) then
local notText = 'يجب ان تكون رتبتك اعلي لاستخدام هذا الامر'
https.request("https://api.telegram.org/bot"..token.."/answerCallbackQuery?callback_query_id="..data.id_.."&text="..URL.escape(notText).."&show_alert=true")
return false
end
if AddChannel(msg.sender_user_id_) == false then
local textchuser = bot_data:get(ban_id..'text:ch:user')
if textchuser then
send(msg.chat_id_, msg.id_,'['..textchuser..']')
else
send(msg.chat_id_, msg.id_,' ᥀ لا تستطيع استخدام البوت \n ᥀  يرجى الاشتراك بالقناه اولا \n ᥀  اشترك هنا ['..bot_data:get(ban_id..'add:ch:username')..']')
end
return false
end
bot_data:sadd(ban_id..'Manager'..msg.chat_id_, userid)
tdcli_function ({ID = "GetUser",user_id_ = userid},function(arg,data) 
if data.first_name_ then
usertext = '\n ᥀ الـعـضو   ⌯︙ ['..data.first_name_..'](t.me/'..(data.username_ or 'g_00_l_d')..')'
status  = '\n ᥀ تم ترقيته مدير'
send(msg.chat_id_, msg.id_, usertext..status)
else
usertext = '\n ᥀ الـعـضو   ⌯︙ '..userid..''
status  = '\n ᥀ تم ترقيته مدير'
send(msg.chat_id_, msg.id_, usertext..status)
end;end,nil)
return false
end  

if Text and Text:match("^/t7kmrtb2_8 (.*)$") then
local userid = Text:match("^/t7kmrtb2_8 (.*)$")
if not Manager(data) then
local notText = 'يجب ان تكون رتبتك اعلي لاستخدام هذا الامر'
https.request("https://api.telegram.org/bot"..token.."/answerCallbackQuery?callback_query_id="..data.id_.."&text="..URL.escape(notText).."&show_alert=true")
return false
end
if AddChannel(msg.sender_user_id_) == false then
local textchuser = bot_data:get(ban_id..'text:ch:user')
if textchuser then
send(msg.chat_id_, msg.id_,'['..textchuser..']')
else
send(msg.chat_id_, msg.id_,' ᥀ لا تستطيع استخدام البوت \n ᥀  يرجى الاشتراك بالقناه اولا \n ᥀  اشترك هنا ['..bot_data:get(ban_id..'add:ch:username')..']')
end
return false
end
if bot_data:get(ban_id..'Lock:Add:Bot'..msg.chat_id_) and not Constructor(msg) then
send(msg.chat_id_, msg.id_,' ᥀ تم تعطيل الرفع') 
return false
end
bot_data:sadd(ban_id..'Mod:User'..msg.chat_id_, userid)
tdcli_function ({ID = "GetUser",user_id_ = userid},function(arg,data) 
if data.first_name_ then
usertext = '\n ᥀ الـعـضو   ⌯︙ ['..data.first_name_..'](t.me/'..(data.username_ or 'g_00_l_d')..')'
status  = '\n ᥀ تم ترقيته ادمن'
send(msg.chat_id_, msg.id_, usertext..status)
else
usertext = '\n ᥀ الـعـضو   ⌯︙ '..userid..''
status  = '\n ᥀ تم ترقيته ادمن'
send(msg.chat_id_, msg.id_, usertext..status)
end;end,nil)
return false
end

if Text and Text:match("^/t7kmrtb2_7 (.*)$") then
local userid = Text:match("^/t7kmrtb2_7 (.*)$")
if not Manager(data) then
local notText = 'يجب ان تكون رتبتك اعلي لاستخدام هذا الامر'
https.request("https://api.telegram.org/bot"..token.."/answerCallbackQuery?callback_query_id="..data.id_.."&text="..URL.escape(notText).."&show_alert=true")
return false
end
if AddChannel(msg.sender_user_id_) == false then
local textchuser = bot_data:get(ban_id..'text:ch:user')
if textchuser then
send(msg.chat_id_, msg.id_,'['..textchuser..']')
else
send(msg.chat_id_, msg.id_,' ᥀ لا تستطيع استخدام البوت \n ᥀  يرجى الاشتراك بالقناه اولا \n ᥀  اشترك هنا ['..bot_data:get(ban_id..'add:ch:username')..']')
end
return false
end
if bot_data:get(ban_id..'Lock:Add:Bot'..msg.chat_id_) and not Constructor(msg) then
send(msg.chat_id_, msg.id_,' ᥀ تم تعطيل الرفع') 
return false
end
bot_data:sadd(ban_id..'Special:User'..msg.chat_id_, userid)
tdcli_function ({ID = "GetUser",user_id_ = userid},function(arg,data) 
if data.first_name_ then
usertext = '\n ᥀ الـعـضو   ⌯︙ ['..data.first_name_..'](t.me/'..(data.username_ or 'g_00_l_d')..')'
local  statuss  = '\n ᥀ تم ترقيته مميز'
send(msg.chat_id_, msg.id_, usertext..statuss)
else
usertext = '\n ᥀ الـعـضو   ⌯︙ '..userid..''
local  statuss  = '\n ᥀ تم ترقيته مميز'
send(msg.chat_id_, msg.id_, usertext..statuss)
end;end,nil)
return false
end
if Text and Text:match("^/t7kmrtb1_2 (.*)$") then
local userid = Text:match("^/t7kmrtb1_2 (.*)$")
if not msa3d(data) then
local notText = 'يجب ان تكون رتبتك اعلي لاستخدام هذا الامر'
https.request("https://api.telegram.org/bot"..token.."/answerCallbackQuery?callback_query_id="..data.id_.."&text="..URL.escape(notText).."&show_alert=true")
return false
end
if AddChannel(msg.sender_user_id_) == false then
local textchuser = bot_data:get(ban_id..'text:ch:user')
if textchuser then
send(msg.chat_id_, msg.id_,'['..textchuser..']')
else
send(msg.chat_id_, msg.id_,' ᥀ لا تستطيع استخدام البوت \n ᥀  يرجى الاشتراك بالقناه اولا \n ᥀  اشترك هنا ['..bot_data:get(ban_id..'add:ch:username')..']')
end
return false
end
bot_data:srem(ban_id..'Sudo:User', userid)
tdcli_function ({ID = "GetUser",user_id_ = userid},function(arg,data) 
if data.first_name_ then
usertext = '\n ᥀ الـعـضو   ⌯︙ ['..data.first_name_..'](t.me/'..(data.username_ or 'g_00_l_d')..')'
status  = '\n ᥀ تم تنزيله من المطورين'
send(msg.chat_id_, msg.id_, usertext..status)
else
usertext = '\n ᥀ الـعـضو   ⌯︙ '..userid..''
status  = '\n ᥀ تم تنزيله من المطورين'
send(msg.chat_id_, msg.id_, usertext..status)
end;end,nil)
return false 
end

if Text and Text:match("^/t7kmrtb1_1 (.*)$") then
local userid = Text:match("^/t7kmrtb1_1 (.*)$")
if not msa3d(data) then
local notText = 'يجب ان تكون رتبتك اعلي لاستخدام هذا الامر'
https.request("https://api.telegram.org/bot"..token.."/answerCallbackQuery?callback_query_id="..data.id_.."&text="..URL.escape(notText).."&show_alert=true")
return false
end
bot_data:srem(ban_id.."Dev:ban:2", userid)
Reply_Status(msg,userid,"reply","᥀ تم تنزيله من المطور ثانويين")  
return false 
end

if Text and Text:match("^/t7kmrtb1_2 (.*)$") then
local userid = Text:match("^/t7kmrtb1_2 (.*)$")
if not msa3d(data) then
local notText = 'يجب ان تكون رتبتك اعلي لاستخدام هذا الامر'
https.request("https://api.telegram.org/bot"..token.."/answerCallbackQuery?callback_query_id="..data.id_.."&text="..URL.escape(notText).."&show_alert=true")
return false
end
if AddChannel(msg.sender_user_id_) == false then
local textchuser = bot_data:get(ban_id..'text:ch:user')
if textchuser then
send(msg.chat_id_, msg.id_,'['..textchuser..']')
else
send(msg.chat_id_, msg.id_,' ᥀ لا تستطيع استخدام البوت \n ᥀  يرجى الاشتراك بالقناه اولا \n ᥀  اشترك هنا ['..bot_data:get(ban_id..'add:ch:username')..']')
end
return false
end
bot_data:srem(ban_id..'Sudo:User', userid)
tdcli_function ({ID = "GetUser",user_id_ = userid},function(arg,data) 
if data.first_name_ then
usertext = '\n ᥀ الـعـضو   ⌯︙ ['..data.first_name_..'](t.me/'..(data.username_ or 'g_00_l_d')..')'
status  = '\n ᥀ تم تنزيله من المطورين'
send(msg.chat_id_, msg.id_, usertext..status)
else
usertext = '\n ᥀ الـعـضو   ⌯︙ '..userid..''
status  = '\n ᥀ تم تنزيله من المطورين'
send(msg.chat_id_, msg.id_, usertext..status)
end;end,nil)
return false 
end

if Text and Text:match("^/t7kmrtb1_320 (.*)$") then
local userid = Text:match("^/t7kmrtb1_320 (.*)$")
if not msa3d(data) then
local notText = 'يجب ان تكون رتبتك اعلي لاستخدام هذا الامر'
https.request("https://api.telegram.org/bot"..token.."/answerCallbackQuery?callback_query_id="..data.id_.."&text="..URL.escape(notText).."&show_alert=true")
return false
end
if AddChannel(msg.sender_user_id_) == false then
local textchuser = bot_data:get(ban_id..'text:ch:user')
if textchuser then
send(msg.chat_id_, msg.id_,'['..textchuser..']')
else
send(msg.chat_id_, msg.id_,' ᥀ لا تستطيع استخدام البوت \n ᥀  يرجى الاشتراك بالقناه اولا \n ᥀  اشترك هنا ['..bot_data:get(ban_id..'add:ch:username')..']')
end
return false
end
bot_data:srem(ban_id..'msa3d:ban', userid)
tdcli_function ({ID = "GetUser",user_id_ = userid},function(arg,data) 
if data.first_name_ then
usertext = '\n ᥀ الـعـضو   ⌯︙ ['..data.first_name_..'](t.me/'..(data.username_ or 'g_00_l_d')..')'
status  = '\n ᥀ تم تنزيله من المطورين الثانوين'
send(msg.chat_id_, msg.id_, usertext..status)
else
usertext = '\n ᥀ الـعـضو   ⌯︙ '..userid..''
status  = '\n ᥀ تم تنزيله من المطورين الثانوين'
send(msg.chat_id_, msg.id_, usertext..status)
end;end,nil)
return false 
end

if Text and Text:match("^/t7kmrtb1_4 (.*)$") then
local userid = Text:match("^/t7kmrtb1_4 (.*)$")
if not CoSu(data) then
local notText = 'يجب ان تكون رتبتك اعلي لاستخدام هذا الامر'
https.request("https://api.telegram.org/bot"..token.."/answerCallbackQuery?callback_query_id="..data.id_.."&text="..URL.escape(notText).."&show_alert=true")
return false
end
if AddChannel(msg.sender_user_id_) == false then
local textchuser = bot_data:get(ban_id..'text:ch:user')
if textchuser then
send(msg.chat_id_, msg.id_,'['..textchuser..']')
else
send(msg.chat_id_, msg.id_,' ᥀ لا تستطيع استخدام البوت \n ᥀  يرجى الاشتراك بالقناه اولا \n ᥀  اشترك هنا ['..bot_data:get(ban_id..'add:ch:username')..']')
end
return false
end
bot_data:srem(ban_id..'Basic:Constructor'..msg.chat_id_, userid)
tdcli_function ({ID = "GetUser",user_id_ = userid},function(arg,data) 
if data.first_name_ then
usertext = '\n ᥀ الـعـضو   ⌯︙ ['..data.first_name_..'](t.me/'..(data.username_ or 'g_00_l_d')..')'
status  = '\n ᥀ تم تنزيله من الاساسيين'
send(msg.chat_id_, msg.id_, usertext..status)
else
usertext = '\n ᥀ الـعـضو   ⌯︙ '..userid..''
status  = '\n ᥀ تم تنزيله من الاساسيين'
send(msg.chat_id_, msg.id_, usertext..status)
end;end,nil)
return false
end

if Text and Text:match("^/t7kmrtb1_3 (.*)$") then
local userid = Text:match("^/t7kmrtb1_3 (.*)$")
if not CoSu(data) then
local notText = 'يجب ان تكون رتبتك اعلي لاستخدام هذا الامر'
https.request("https://api.telegram.org/bot"..token.."/answerCallbackQuery?callback_query_id="..data.id_.."&text="..URL.escape(notText).."&show_alert=true")
return false
end
if AddChannel(msg.sender_user_id_) == false then
local textchuser = bot_data:get(ban_id..'text:ch:user')
if textchuser then
send(msg.chat_id_, msg.id_,'['..textchuser..']')
else
send(msg.chat_id_, msg.id_,' ᥀ لا تستطيع استخدام البوت \n ᥀  يرجى الاشتراك بالقناه اولا \n ᥀  اشترك هنا ['..bot_data:get(ban_id..'add:ch:username')..']')
end
return false
end
bot_data:srem(ban_id..'CoSu'..msg.chat_id_, userid)
tdcli_function ({ID = "GetUser",user_id_ = userid},function(arg,data) 
if data.first_name_ then
usertext = '\n ᥀ الـعـضو   ⌯︙ ['..data.first_name_..'](t.me/'..(data.username_ or 'g_00_l_d')..')'
status  = '\n ᥀ تم تنزيله من مالك'
send(msg.chat_id_, msg.id_, usertext..status)
else
usertext = '\n ᥀ الـعـضو   ⌯︙ '..userid..''
status  = '\n ᥀ تم تنزيله من مالك'
send(msg.chat_id_, msg.id_, usertext..status)
end;end,nil)
return false
end

if Text and Text:match("^/t7kmrtb1_5 (.*)$") then
local userid = Text:match("^/t7kmrtb1_5 (.*)$")
if not BasicConstructor(data) then
local notText = 'يجب ان تكون رتبتك اعلي لاستخدام هذا الامر'
https.request("https://api.telegram.org/bot"..token.."/answerCallbackQuery?callback_query_id="..data.id_.."&text="..URL.escape(notText).."&show_alert=true")
return false
end
if AddChannel(msg.sender_user_id_) == false then
local textchuser = bot_data:get(ban_id..'text:ch:user')
if textchuser then
send(msg.chat_id_, msg.id_,'['..textchuser..']')
else
send(msg.chat_id_, msg.id_,' ᥀ لا تستطيع استخدام البوت \n ᥀  يرجى الاشتراك بالقناه اولا \n ᥀  اشترك هنا ['..bot_data:get(ban_id..'add:ch:username')..']')
end
return false
end
bot_data:srem(ban_id..'Constructor'..msg.chat_id_, userid)
tdcli_function ({ID = "GetUser",user_id_ = userid},function(arg,data) 
if data.first_name_ then
usertext = '\n ᥀ الـعـضو   ⌯︙ ['..data.first_name_..'](t.me/'..(data.username_ or 'g_00_l_d')..')'
status  = '\n ᥀ تم تنزيله من المنشئين'
send(msg.chat_id_, msg.id_, usertext..status)
else
usertext = '\n ᥀ الـعـضو   ⌯︙ '..userid..''
status  = '\n ᥀ تم تنزيله من المنشئين'
send(msg.chat_id_, msg.id_, usertext..status)
end;end,nil)
end

if Text and Text:match("^/t7kmrtb1_6 (.*)$") then
local userid = Text:match("^/t7kmrtb1_6 (.*)$")
if not Constructor(data) then
local notText = 'يجب ان تكون رتبتك اعلي لاستخدام هذا الامر'
https.request("https://api.telegram.org/bot"..token.."/answerCallbackQuery?callback_query_id="..data.id_.."&text="..URL.escape(notText).."&show_alert=true")
return false
end
if AddChannel(msg.sender_user_id_) == false then
local textchuser = bot_data:get(ban_id..'text:ch:user')
if textchuser then
send(msg.chat_id_, msg.id_,'['..textchuser..']')
else
send(msg.chat_id_, msg.id_,' ᥀ لا تستطيع استخدام البوت \n ᥀  يرجى الاشتراك بالقناه اولا \n ᥀  اشترك هنا ['..bot_data:get(ban_id..'add:ch:username')..']')
end
return false
end
bot_data:srem(ban_id..'Manager'..msg.chat_id_, userid)
tdcli_function ({ID = "GetUser",user_id_ = userid},function(arg,data) 
if data.first_name_ then
usertext = '\n ᥀ الـعـضو   ⌯︙ ['..data.first_name_..'](t.me/'..(data.username_ or 'g_00_l_d')..')'
status  = '\n ᥀ تم تنزيله من المدراء'
send(msg.chat_id_, msg.id_, usertext..status)
else
usertext = '\n ᥀ الـعـضو   ⌯︙ '..userid..''
status  = '\n ᥀ تم تنزيله من المدراء'
send(msg.chat_id_, msg.id_, usertext..status)
end;end,nil)
return false
end

if Text and Text:match("^/t7kmrtb1_7 (.*)$") then
local userid = Text:match("^/t7kmrtb1_7 (.*)$")
if not Manager(data) then
local notText = 'يجب ان تكون رتبتك اعلي لاستخدام هذا الامر'
https.request("https://api.telegram.org/bot"..token.."/answerCallbackQuery?callback_query_id="..data.id_.."&text="..URL.escape(notText).."&show_alert=true")
return false
end
if AddChannel(msg.sender_user_id_) == false then
local textchuser = bot_data:get(ban_id..'text:ch:user')
if textchuser then
send(msg.chat_id_, msg.id_,'['..textchuser..']')
else
send(msg.chat_id_, msg.id_,' ᥀ لا تستطيع استخدام البوت \n ᥀  يرجى الاشتراك بالقناه اولا \n ᥀  اشترك هنا ['..bot_data:get(ban_id..'add:ch:username')..']')
end
return false
end
bot_data:srem(ban_id..'Mod:User'..msg.chat_id_, userid)
tdcli_function ({ID = "GetUser",user_id_ = userid},function(arg,data) 
if data.first_name_ then
usertext = '\n ᥀ الـعـضو   ⌯︙ ['..data.first_name_..'](t.me/'..(data.username_ or 'g_00_l_d')..')'
status  = '\n ᥀ تم تنزيله من الادمنيه'
send(msg.chat_id_, msg.id_, usertext..status)
else
usertext = '\n ᥀ الـعـضو   ⌯︙ '..userid..''
status  = '\n ᥀ تم تنزيله من الادمنيه'
send(msg.chat_id_, msg.id_, usertext..status)
end;end,nil)
return false
end

if Text and Text:match("^/t7kmrtb1_8 (.*)$") then
local userid = Text:match("^/t7kmrtb1_8 (.*)$")
if not Mod(data) then
local notText = 'يجب ان تكون رتبتك اعلي لاستخدام هذا الامر'
https.request("https://api.telegram.org/bot"..token.."/answerCallbackQuery?callback_query_id="..data.id_.."&text="..URL.escape(notText).."&show_alert=true")
return false
end
if AddChannel(msg.sender_user_id_) == false then
local textchuser = bot_data:get(ban_id..'text:ch:user')
if textchuser then
send(msg.chat_id_, msg.id_,'['..textchuser..']')
else
send(msg.chat_id_, msg.id_,' ᥀ لا تستطيع استخدام البوت \n ᥀  يرجى الاشتراك بالقناه اولا \n ᥀  اشترك هنا ['..bot_data:get(ban_id..'add:ch:username')..']')
end
return false
end
bot_data:srem(ban_id..'Special:User'..msg.chat_id_, userid)
tdcli_function ({ID = "GetUser",user_id_ = userid},function(arg,data) 
if data.first_name_ then
usertext = '\n ᥀ لعضو  ⌯︙ ['..data.first_name_..'](t.me/'..(data.username_ or 'g_00_l_d')..')'
status  = '\n ᥀ تم تنزيله من المميزين'
send(msg.chat_id_, msg.id_, usertext..status)
else
usertext = '\n ᥀ الـعـضو   ⌯︙ '..userid..''
status  = '\n ᥀ تم تنزيله من المميزين'
send(msg.chat_id_, msg.id_, usertext..status)
end;end,nil)
return false
end
if Text == '/help1' then
if not Mod(data) then
local notText = '✘ عذرا الاوامر هذه لا تخصك'
https.request("https://api.telegram.org/bot"..token.."/answerCallbackQuery?callback_query_id="..data.id_.."&text="..URL.escape(notText).."&show_alert=true")
return false
end
local Teext =[[
⇊ اوامر القفل والفتح ⌯︙
•━═━═━═「ɢᴏʟᴅ」═━═━═━•

]]
keyboard = {} 
keyboard.inline_keyboard = {
{
{text = 'قفل الاباحي', callback_data="/lockdul"},{text = 'فتح الاباحي', callback_data="/oppor"},
},
{
{text = 'قفل الازعاج', callback_data="/ayq79"},{text = 'فتح الازعاج', callback_data="/Andrew"},
},
{
{text = 'قفل السب', callback_data="/Louis"},{text = 'فتح السب', callback_data="/tho"},
},
{
{text = 'قفل المحن', callback_data="/Gogh"},{text = 'فتح المحن', callback_data="/Omni"},
},
{
{text = 'قفل الدردشه', callback_data="/Lokll"},{text = 'فتح الدردشه', callback_data="/openqg"},
},
{
{text = 'قفل الدخول', callback_data="/lockaghv"},{text = 'فتح الاضافه', callback_data="/oppgagf"},
},
{
{text = 'قفل البوتات', callback_data="/lockbot"},{text = 'فتح البوتات', callback_data="/opabot"},
},
{
{text = 'قفل الاشعارات', callback_data="/lockash"},{text = 'فتح الاشعارات', callback_data="/opaash"},
},
{
{text = 'قفل الروابط', callback_data="/locklink"},{text = 'فتح الروابط', callback_data="/opalink"},
},
{
{text = 'قفل التثبيت', callback_data="/lockpin"},{text = 'فتح التثبيت', callback_data="/opapin"},
},
{
{text = 'قفل التعديل', callback_data="/lockedit"},{text = 'فتح التعديل', callback_data="/opaedit"},
},
{
{text = 'قفل الفارسيه', callback_data="/lockFars"},{text = 'فتح الفارسيه', callback_data="/opaFars"},
},
{
{text = 'قفل الانكليزيه', callback_data="/lockEngilsh"},{text = 'فتح الانكليزيه', callback_data="/opaEngilsh"},
},
{
{text = 'قفل تعديل الميديا', callback_data="/lockeditmed"},{text = 'فتح تعديل الميديا', callback_data="/opaeditmed"},
},
{
{text = 'قفل الانلاين', callback_data="/lockinline"},{text = 'فتح الانلاين', callback_data="/opainline"},
},
{
{text = 'رجوع 🔙', callback_data="/help8"},
},
{
{text = 'اخفاء الاوامر', callback_data="/hide"},
},
}
return https.request("https://api.telegram.org/bot"..token..'/editMessageText?chat_id='..Chat_id..'&text='..URL.escape(Teext)..'&message_id='..msg_idd..'&parse_mode=markdown&disable_web_page_preview=true&reply_markup='..JSON.encode(keyboard)) 
end



if Text == '/help2' then
if not Mod(data) then
local notText = '✘ عذرا الاوامر هذه لا تخصك'
https.request("https://api.telegram.org/bot"..token.."/answerCallbackQuery?callback_query_id="..data.id_.."&text="..URL.escape(notText).."&show_alert=true")
return false
end
local Teext =[[
⇊ 「اوامر التفعيل」 والتعطي ⌯︙
•━═━═━═「ɢᴏʟᴅ」═━═━═━•
]]
keyboard = {} 
keyboard.inline_keyboard = {
{
{text = 'تفعيل اطردني', callback_data="/opCick"},{text = 'تعطيل اطردني', callback_data="/lockCick"},
},
{
{text = 'تفعيل التحقق', callback_data="/lockCickp"},{text = 'تعطيل التحقق', callback_data="/opCickp"},
},
{
{text = 'تفعيل الرابط', callback_data="/locklinka"},{text = 'تعطيل الرابط', callback_data="/opalinka"},
},
{
{text = 'تفعيل مريم', callback_data="/Loumarem"},{text = 'تعطيل مريم', callback_data="/thomarem"},
},
{
{text = 'تفعيل صورتي', callback_data="/lookpohi"},{text = 'تعطيل صورتي', callback_data="/opphotop"},
},
{
{text = 'تفعيل الزخرفه', callback_data="/Lokzal"},{text = 'تعطيل الزخرفه', callback_data="/opeza"},
},
{
{text = 'تفعيل  انا مين', callback_data="/lockanmen"},{text = 'تعطيل انا مين', callback_data="/oppganmen"},
},
{
{text = 'تفعيل ضافني', callback_data="/lockbafne"},{text = 'تعطيل ضافني', callback_data="/opaDRGfe"},
},
{
{text = 'تفعيل الالعاب', callback_data="/lockgams"},{text = 'تعطيل الالعاب', callback_data="/opagams"},
},
{
{text = 'تفعيل الايدي', callback_data="/lockid"},{text = 'تعطيل الايدي', callback_data="/opaid"},
},
{
{text = 'تفعيل الترحيب', callback_data="/lockwelcm"},{text = 'تعطيل الترحيب', callback_data="/opawelcm"},
},
{
{text = 'تفعيل نسبه الكره', callback_data="/locnspm"},{text = 'تعطيل نسبه الكره', callback_data="/opansamp"},
},
{
{text = 'تفعيل نسبه الانوثه ', callback_data="/locknsamgk"},{text = 'تعطيل نسبه الانوثه ', callback_data="/opansamg"},
},
{
{text = 'تفعيل نسبة الحب', callback_data="/locknsak"},{text = 'تعطيل نسبة الحب', callback_data="/opanams"},
},
{
{text = 'تفعيل نسبة الرجوله', callback_data="/lockman"},{text = 'تعطيل  نسبة الرجوله', callback_data="/opamanh"},
},
{
{text = 'تفعيل نسبه جمالي', callback_data="/lockgmale"},{text = 'تعطيل نسبه جمالي', callback_data="/opagmale"},
},
{
{text = 'تفعيل حساب العمر', callback_data="/lockamr"},{text = 'تعطيل حساب العمر', callback_data="/opamar"},
},
{
{text = 'تفعيل all', callback_data="/lockall"},{text = 'تعطيل all', callback_data="/opaall"},
},
{
{text = 'تفعيل ردود السورس', callback_data="/lockreb"},{text = 'تعطيل ردود السورس', callback_data="/opareb"},
},
{
{text = 'رجوع 🔙', callback_data="/help8"},
},
{
{text = 'اخفاء الاوامر', callback_data="/hide"},
},
}
return https.request("https://api.telegram.org/bot"..token..'/editMessageText?chat_id='..Chat_id..'&text='..URL.escape(Teext)..'&message_id='..msg_idd..'&parse_mode=markdown&disable_web_page_preview=true&reply_markup='..JSON.encode(keyboard)) 
end

if Text == '/help3' then
if not Mod(data) then
local notText = '✘ عذرا الاوامر هذه لا تخصك'
https.request("https://api.telegram.org/bot"..token.."/answerCallbackQuery?callback_query_id="..data.id_.."&text="..URL.escape(notText).."&show_alert=true")
return false
end
local Teext =[[
 ⌯︙️ 「 m 1 」 Orders Protect Group ⇊
•━═━═━═「ɢᴏʟᴅ」═━═━═━•
⌯︙ Lock ↵Open + it
⌯︙ Lock ↵» Open 「 All 」
•━═━═━═「ɢᴏʟᴅ」═━═━═━•
⌯︙ Chat
⌯︙ Knows
⌯︙ Pictures
⌯︙ videos
⌯︙ Sticker
⌯︙ files
Mobile moving
⌯︙ Lift
⌯︙ Audio
⌯︙ Optiments
⌯︙ Welcome
⌯︙ The decorative
⌯︙ Translate
⌯︙ Responses
⌯︙ Guidance
⌯︙ Notifications
⌯︙ Crown
⌯︙ Delete link
⌯︙ expulsion
⌯︙ Games
⌯︙ Novels
⌯︙ towers
⌯︙ Meanings of names
⌯︙ Welcome
•━═━═━═「ɢᴏʟᴅ」═━═━═━•
⌯︙ Links
⌯︙ Guidance
⌯︙ popcorn
⌯︙ Bots
⌯︙ Prohibited
•━═━═━═「ɢᴏʟᴅ」═━═━═━•

]]
keyboard = {} 
keyboard.inline_keyboard = {
{
{text = 'رجوع 🔙', callback_data="/help90"},
},
{
{text = 'اخفاء الاوامر', callback_data="/hide"},
},
}
return https.request("https://api.telegram.org/bot"..token..'/editMessageText?chat_id='..Chat_id..'&text='..URL.escape(Teext)..'&message_id='..msg_idd..'&parse_mode=markdown&disable_web_page_preview=true&reply_markup='..JSON.encode(keyboard)) 
end
if Text == '/help4' then
if not Mod(data) then
local notText = '✘ عذرا الاوامر هذه لا تخصك'
https.request("https://api.telegram.org/bot"..token.."/answerCallbackQuery?callback_query_id="..data.id_.."&text="..URL.escape(notText).."&show_alert=true")
return false
end
local Teext =[[
 ⌯︙ 「 m 3 」 3 ⌯︙ Tall orders ⇊
⌯︙ Lifting ↵ Download + it
•━═━═━═「ɢᴏʟᴅ」═━═━═━•
⌯︙ my son
⌯︙ Crown for children
⌯︙ Survey sons
•━═━═━═「ɢᴏʟᴅ」═━═━═━•
⌯︙ Crown for girls
⌯︙ Clear the girls
•━═━═━═「ɢᴏʟᴅ」═━═━═━•
    ⌯︙ Habayeb survey..↑↓
•━═━═━═「ɢᴏʟᴅ」═━═━═━•
⌯︙ my husDRGd
⌯︙ Crown for couples
⌯︙ Survey of couples
•━═━═━═「ɢᴏʟᴅ」═━═━═━•
⌯︙ My wife
⌯︙ Crown for the wives
⌯︙ Wipe waves
•━═━═━═「ɢᴏʟᴅ」═━═━═━•
⌯︙ Khayen
⌯︙ Crown for him
⌯︙ Clear the moon
•━═━═━═「ɢᴏʟᴅ」═━═━═━•
⌯︙ Crown for the two
⌯︙ Khiennine survey
•━═━═━═「ɢᴏʟᴅ」═━═━═━•
⌯︙ Abit
⌯︙ Crown for the mixture
⌯︙ Survey
•━═━═━═「ɢᴏʟᴅ」═━═━═━•
⌯︙ Crown for Paradise
⌯︙ Storage survey
•━═━═━═「ɢᴏʟᴅ」═━═━═━•

]]
keyboard = {} 
keyboard.inline_keyboard = {
{
{text = 'رجوع 🔙', callback_data="/help90"},
},
{
{text = 'اخفاء الاوامر', callback_data="/hide"},
},
}
return https.request("https://api.telegram.org/bot"..token..'/editMessageText?chat_id='..Chat_id..'&text='..URL.escape(Teext)..'&message_id='..msg_idd..'&parse_mode=markdown&disable_web_page_preview=true&reply_markup='..JSON.encode(keyboard)) 
end
if Text == '/hiddnt' then
if not Mod(data) then
local notText = '✘ عذرا الاوامر هذه لا تخصك'
https.request("https://api.telegram.org/bot"..token.."/answerCallbackQuery?callback_query_id="..data.id_.."&text="..URL.escape(notText).."&show_alert=true")
return false
end
local Teext =[[
⌯︙ 「 m 4 」 Orders of members ⇊
•━═━═━═「ɢᴏʟᴅ」═━═━═━•
⌯︙ Age account
⌯︙ Picture ↵
⌯︙ Quran
⌯︙ Settings
⌯︙ Qatari
⌯︙ Delete ↵ Sell 「 Qatari
•━═━═━═「ɢᴏʟᴅ」═━═━═━•
⌯︙ My messages ↵ Delete 
⌯︙ Decorating ↵ Songs
⌯︙ Movies ↵ Cartoon
⌯︙ Translate + novels
⌯︙ YouTube ↵ Games
⌯︙ Weather + area
⌯︙ Dark ↵link
•━═━═━═「ɢᴏʟᴅ」═━═━═━•
⌯︙ My name is 
⌯︙ My Juices ↵ Delete my juices
⌯︙ Powers ↵ Ping
⌯︙ Say + word
⌯︙ Prohibited Words
⌯︙ I am Maine
⌯︙ Say + word
⌯︙ Qatah ↵ dog
•━═━═━═「ɢᴏʟᴅ」═━═━═━•
⌯︙ Source ↵Developer
⌯︙ link ↵hands
⌯︙ Rank ↵ Revealed
⌯︙ Reply you, Bot
⌯︙ Any your opinion Yapot
⌯︙ Hino ↵ Hinha
⌯︙ Boso ↵ her pussy
⌯︙ Mido ↵ 
⌯︙ Delete link
•━═━═━═「ɢᴏʟᴅ」═━═━═━•

]]
keyboard = {} 
keyboard.inline_keyboard = {
{
{text = 'رجوع 🔙', callback_data="/help90"},
},
{
{text = 'اخفاء الاوامر', callback_data="/hide"},
},
}
return https.request("https://api.telegram.org/bot"..token..'/editMessageText?chat_id='..Chat_id..'&text='..URL.escape(Teext)..'&message_id='..msg_idd..'&parse_mode=markdown&disable_web_page_preview=true&reply_markup='..JSON.encode(keyboard)) 
end
if Text == '/help5' then
if not Mod(data) then
local notText = '✘ عذرا الاوامر هذه لا تخصك'
https.request("https://api.telegram.org/bot"..token.."/answerCallbackQuery?callback_query_id="..data.id_.."&text="..URL.escape(notText).."&show_alert=true")
return false
end
local Teext =[[
 ⌯︙مرحب بيك في اوامر للمطورين ⌯︙
اوامر المطورين ⇊
「المطور 」  ⇊
•━═━═━═「ɢᴏʟᴅ」═━═━═━•
 ⌯︙تفعيل ⋖ تعطيل 
 ⌯︙المجموعات ⋖ المشتركين ⋖ الاحصائيات
 ⌯︙رفع ⋖ تنزيل منشئ اساسي
 ⌯︙مسح الاساسين ⋖ المنشئين الاساسين
 ⌯︙مسح المنشئين ⋖ المنشئين
 ⌯︙اسم ~ ايدي + بوت غادر 
 ⌯︙اذاعه 
•━═━═━═「ɢᴏʟᴅ」═━═━═━•
「المطور الاساسي+ المطور الثانوي」
•━═━═━═「ɢᴏʟᴅ」═━═━═━•
 ⌯︙تفعيل
 ⌯︙تعطيل
 ⌯︙مسح الاساسين
 ⌯︙المنشئين الاساسين
 ⌯︙رفع/تنزيل منشئ اساسي
 ⌯︙رفع/تنزيل مطور اساسي 
 ⌯︙  رفع/تنزيل مدير عام
 ⌯︙  رفع /تنزيل ادمن عام
 ⌯︙مسح المطورين
 ⌯︙المطورين
 ⌯︙رفع | تنزيل مطور
 ⌯︙اسم البوت + غادر
 ⌯︙غادر
 ⌯︙اسم بوت + الرتبه
 ⌯︙تحديث السورس
 ⌯︙حضر عام
 ⌯︙كتم عام
 ⌯︙الغاء العام
 ⌯︙قائمه العام
 ⌯︙مسح قائمه العام
 ⌯︙جلب النسخه
 ⌯︙رفع النسخه
 ⌯︙ جلب المشتركين
 ⌯︙ رفع المشتركين
 ⌯︙اذاعه خاص
 ⌯︙اذاعه
 ⌯︙اذاعه بالتوجيه
 ⌯︙اذاعه بالتوجيه خاص
 ⌯︙اذاعه بالتثبيت
 ⌯︙جلب نسخه البوت
 ⌯︙رفع نسخه البوت
 ⌯︙ضع عدد الاعضاء + العدد
 ⌯︙ضع كليشه المطور
 ⌯︙تفعيل/تعطيل الاذاعه
 ⌯︙تفعيل/تعطيل البوت الخدمي
 ⌯︙تفعيل/تعطيل التواصل
 ⌯︙تغير اسم البوت
 ⌯︙اضف/مسح رد عام
 ⌯︙الردود العامه
 ⌯︙مسح الردود العامه
 ⌯︙الاشتراك الاجباري
 ⌯︙تعطيل الاشتراك الاجباري
 ⌯︙تفعيل الاشتراك الاجباري
 ⌯︙مسح رساله الاشتراك
 ⌯︙تغير رساله الاشتراك
 ⌯︙تغير الاشتراك
 ⌯︙الاحصائيات
 ⌯︙المشتركين
 ⌯︙المجموعات 
 ⌯︙تفعيل/تعطيل المغادره
 ⌯︙مسح الجروبات
•━═━═━═「ɢᴏʟᴅ」═━═━═━•
]]
keyboard = {} 
keyboard.inline_keyboard = {
{
{text = 'رجوع 🔙', callback_data="/help8"},
},
{
{text = 'اخفاء الاوامر', callback_data="/hide"},
},
}
return https.request("https://api.telegram.org/bot"..token..'/editMessageText?chat_id='..Chat_id..'&text='..URL.escape(Teext)..'&message_id='..msg_idd..'&parse_mode=markdown&disable_web_page_preview=true&reply_markup='..JSON.encode(keyboard)) 
end
if Text == '/help6' then
if not Mod(data) then
local notText = '✘ عذرا الاوامر هذه لا تخصك'
https.request("https://api.telegram.org/bot"..token.."/answerCallbackQuery?callback_query_id="..data.id_.."&text="..URL.escape(notText).."&show_alert=true")
return false
end
local Teext =[[
    「اوامر الاعضاء ⇊」     
•━═━═━═「ɢᴏʟᴅ」═━═━═━•
 ⌯︙   غنيلي ⇔ حساب العمر   
 ⌯︙   صورتي ⇔ نسبه جمالي
 ⌯︙   نقاطي
 ⌯︙    مسح ⇔ بيع 「نقاطي 」 
 ⌯︙   رسائلي ⇔  مسح 「رسائلي 」 
 ⌯︙   زخرفه ⇔ اغاني 
 ⌯︙   اسمي ⇔ الرتبه
 ⌯︙  جهاتي 
 ⌯︙  صلاحياتي
 ⌯︙  قول +الكلمه
 ⌯︙  تفعيل  تعطيل+ اطردني   
 ⌯︙   سورس ⇔ المطور
 ⌯︙   الرابط ⇔ ايدي
 ⌯︙   رتبتي ⇔ كشف
 ⌯︙   رد  انت يا بوت
 ⌯︙  ي رايك يابوت
 ⌯︙   هينو ⇔ هينها
 ⌯︙   بوسو ⇔ بوسها
 ⌯︙   بتحب دي ⇔ بتحب ده
 ⌯︙  بوت الحذف⇔رابط الحذف
•━═━═━═「ɢᴏʟᴅ」═━═━═━•
]]
keyboard = {} 
keyboard.inline_keyboard = {
{
{text = 'رجوع 🔙', callback_data="/help8"},
},
{
{text = 'اخفاء الاوامر', callback_data="/hide"},
},
}
return https.request("https://api.telegram.org/bot"..token..'/editMessageText?chat_id='..Chat_id..'&text='..URL.escape(Teext)..'&message_id='..msg_idd..'&parse_mode=markdown&disable_web_page_preview=true&reply_markup='..JSON.encode(keyboard)) 
end
if Text == '/help7' then
if not Mod(data) then
local notText = '✘ عذرا الاوامر هذه لا تخصك'
https.request("https://api.telegram.org/bot"..token.."/answerCallbackQuery?callback_query_id="..data.id_.."&text="..URL.escape(notText).."&show_alert=true")
return false
end
local Teext =[[
اوامر 「التسليه」  ⇊
رفع ⇔ تنزيل + الامر
•━═━═━═「ɢᴏʟᴅ」═━═━═━•
 ⌯︙رفع + تنزيل ⋖ متوحد
 ⌯︙تاك للمتوحدين
•━═━═━═「ɢᴏʟᴅ」═━═━═━•
 ⌯︙رفع + تنزيل ⋖ كلب
 ⌯︙تاك للكلاب
•━═━═━═「ɢᴏʟᴅ」═━═━═━•
 ⌯︙رفع + تنزيل ⋖ قرد
 ⌯︙تاك للقرود
•━═━═━═「ɢᴏʟᴅ」═━═━═━•
 ⌯︙رفع + تنزيل ⋖ زوجتي
 ⌯︙تاك للزوجات
•━═━═━═「ɢᴏʟᴅ」═━═━═━•
 ⌯︙رفع + تنزيل ⋖ قلبي
 ⌯︙تاك لقلبي
•━═━═━═「ɢᴏʟᴅ」═━═━═━•
 ⌯︙رفع + تنزيل ⋖ بقره
 ⌯︙تاك للبقرات
•━═━═━═「ɢᴏʟᴅ」═━═━═━•
 ⌯︙رفع + تنزيل ⋖ ارمله
 ⌯︙تاك للارامل
•━═━═━═「ɢᴏʟᴅ」═━═━═━•
 ⌯︙رفع + تنزيل ⋖ خول
 ⌯︙تاك للخولات
•━═━═━═「ɢᴏʟᴅ」═━═━═━•
 ⌯︙رفع + تنزيل ⋖ حمار
 ⌯︙تاك للحمير
•━═━═━═「ɢᴏʟᴅ」═━═━═━•
 ⌯︙رفع + تنزيل ⋖ مزه
 ⌯︙تاك للمزز
•━═━═━═「ɢᴏʟᴅ」═━═━═━•
 ⌯︙رفع + تنزيل ⋖ وتكه
 ⌯︙تاك للوتكات
•━═━═━═「ɢᴏʟᴅ」═━═━═━•
 ⌯︙رفع + تنزيل ⋖ كس
 ⌯︙تاك للاكساس
•━═━═━═「ɢᴏʟᴅ」═━═━═━•
 ⌯︙رفع + تنزيل ⋖ ابني
 ⌯︙تاك لولادي 
•━═━═━═「ɢᴏʟᴅ」═━═━═━•
 ⌯︙رفع + تنزيل ⋖ بنتي
 ⌯︙تاك لبناتي
•━═━═━═「ɢᴏʟᴅ」═━═━═━•
 ⌯︙رفع + تنزيل ⋖ خاين
 ⌯︙تاك للخاينين
•━═━═━═「ɢᴏʟᴅ」═━═━═━•
 ⌯︙رفع  ⋖ علي زبي
 ⌯︙تنزيل ⋖من زبي 
 ⌯︙تاك للمتناكين
•━═━═━═「ɢᴏʟᴅ」═━═━═━•
]]
keyboard = {} 
keyboard.inline_keyboard = {
{
{text = 'رجوع 🔙', callback_data="/help8"},
},
{
{text = 'اخفاء الاوامر', callback_data="/hide"},
},
}
return https.request("https://api.telegram.org/bot"..token..'/editMessageText?chat_id='..Chat_id..'&text='..URL.escape(Teext)..'&message_id='..msg_idd..'&parse_mode=markdown&disable_web_page_preview=true&reply_markup='..JSON.encode(keyboard)) 
end

if Text == '/hide' then
local hide = 'تم اخفاء الاوامر'
DeleteMessage(Chat_id,{[0] = Msg_id})  
https.request("https://api.telegram.org/bot"..token..'/editMessageText?chat_id='..Chat_id..'&text='..URL.escape(hide)..'&message_id='..msg_idd..'&parse_mode=markdown&disable_web_page_preview=true') 
end
if Text == '/help8' then
if not Mod(data) then
local notText = '✘ عذرا الاوامر هذه لا تخصك'
https.request("https://api.telegram.org/bot"..token.."/answerCallbackQuery?callback_query_id="..data.id_.."&text="..URL.escape(notText).."&show_alert=true")
return false
end
local Teext =[[
⚙️╖⁩ ❬ 1 ❭ اوامر المطورين ⇊
🥳╢ ❬ 2 ❭ اوامر التسليه ⇊
💫╢ ❬ 3 ❭ اوامر الاعضاء ⇊
👮‍♂️╢ ❬ 4 ❭ اوامر التعطيل ⇊
💎╜ ❬ 5 ❭ أوامر الفتح والقفل ⇊
╾╾╾╾╾╾╾╾╾╾╾╾╾╾╾╸
[ᴛᴇᴀᴍ ɢᴏʟᴅ ](t.me/g_00_l_d)
]]
keyboard = {} 
keyboard.inline_keyboard = {
{
{text = 'م1', callback_data="/help5"},{text = 'م2', callback_data="/help7"},
},
{
{text = 'م3', callback_data="/help6"},
},
{
{text = 'م4', callback_data="/help2"},{text = 'م5', callback_data="/help1"},
},
{
{text = 'تغيير اللغه 🇦🇮.', callback_data="/help90"},
},
}
return https.request("https://api.telegram.org/bot"..token..'/editMessageText?chat_id='..Chat_id..'&text='..URL.escape(Teext)..'&message_id='..msg_idd..'&parse_mode=markdown&disable_web_page_preview=true&reply_markup='..JSON.encode(keyboard)) 
end

if Text == '/help9' then
if not Mod(data) then
local notText = '✘ عذرا الاوامر هذه لا تخصك'
https.request("https://api.telegram.org/bot"..token.."/answerCallbackQuery?callback_query_id="..data.id_.."&text="..URL.escape(notText).."&show_alert=true")
return false
end
local Teext =[[
⌯︙ 「 m 5 」 Orders of Developers ⇊
⌯︙ Developer ⋖⇊
•━═━═━═「ɢᴏʟᴅ」═━═━═━•
⌯︙ Lifting «download 「 owner 」
⌯︙ Change the group link
⌯︙ Destination of groups
⌯︙ Destination by guidance for groups
⌯︙ A radio face
⌯︙ Special radio
•━═━═━═「ɢᴏʟᴅ」═━═━═━•
⌯︙ A special guidance
⌯︙ Fix the installation
⌯︙ bring back copy
⌯︙ raise its backup copy
⌯︙ Statistics
⌯︙ Delete owners
•━═━═━═「ɢᴏʟᴅ」═━═━═━•
   ⌯︙ Basic Developer..↑↓
•━═━═━═「ɢᴏʟᴅ」═━═━═━•
⌯︙ Add "← Delete a general response
⌯︙ Lifting «download 「 special year 」
⌯︙ Featured Survey
⌯︙ General responses
⌯︙ Delete public responses
⌯︙ A special guidance
⌯︙ Destination by guidance for groups
⌯︙ Fix the installation
⌯︙ A radio face
⌯︙ bring ↵ raising 
•━═━═━═「ɢᴏʟᴅ」═━═━═━•
⌯︙ Statistics
⌯︙ Lifting «download 「 Developer 」
⌯︙ Developers ↵ Delete Developers
⌯︙ Put the name of the bot
⌯︙ Change the departing message
⌯︙ Prohibition ↵ Mute 「 General 」
⌯︙ General makers
⌯︙ Preventors General
⌯︙ Canceling the general
•━═━═━═「ɢᴏʟᴅ」═━═━═━•

]]
keyboard = {} 
keyboard.inline_keyboard = {
{
{text = 'رجوع 🔙', callback_data="/help90"},
},
{
{text = 'اخفاء الاوامر', callback_data="/hide"},
},
}
return https.request("https://api.telegram.org/bot"..token..'/editMessageText?chat_id='..Chat_id..'&text='..URL.escape(Teext)..'&message_id='..msg_idd..'&parse_mode=markdown&disable_web_page_preview=true&reply_markup='..JSON.encode(keyboard)) 
end
if Text == '/help10' then
local help_text = bot_data:get(ban_id..'help10_text')
local Teext =[[
⌯︙ 「 m 2 」 2 ⌯︙ entertainment orders ⇊
⌯︙ Lifting ↵» Download + it
•━═━═━═「ɢᴏʟᴅ」═━═━═━•
⌯︙ and Take
⌯︙ Crown for Soutat
⌯︙ Wipe Wattat
•━═━═━═「ɢᴏʟᴅ」═━═━═━•
⌯︙
⌯︙ Crown for drapes
⌯︙ Clear Docks
•━═━═━═「ɢᴏʟᴅ」═━═━═━•
⌯︙ Jeep
⌯︙ Crown for bodies
⌯︙ Scanning
•━═━═━═「ɢᴏʟᴅ」═━═━═━•
⌯︙ animal
⌯︙ Crown for animals
⌯︙ Animals
•━═━═━═「ɢᴏʟᴅ」═━═━═━•
⌯︙ failed
⌯︙ Crown for failure
⌯︙ Scan of failure
•━═━═━═「ɢᴏʟᴅ」═━═━═━•
⌯︙ Dermatology
⌯︙ Crown for perforation
⌯︙ Scanning
•━═━═━═「ɢᴏʟᴅ」═━═━═━•
⌯︙ Catte
⌯︙ Crown for cats
⌯︙ Cats survey
•━═━═━═「ɢᴏʟᴅ」═━═━═━•
]]
keyboard = {} 
keyboard.inline_keyboard = {
{
{text = 'رجوع 🔙', callback_data="/help90"},
},
{
{text = 'اخفاء الاوامر', callback_data="/hide"},
},
}
return https.request("https://api.telegram.org/bot"..token..'/editMessageText?chat_id='..Chat_id..'&text='..URL.escape(Teext)..'&message_id='..msg_idd..'&parse_mode=markdown&disable_web_page_preview=true&reply_markup='..JSON.encode(keyboard)) 
end

if Text == '/help90' then
local Teext =[[
⌯︙ Welcome to the orders section↑↓
•━═━═━═「ɢᴏʟᴅ」═━═━═━•
]]
keyboard = {} 
keyboard.inline_keyboard = {
{
{text = '˹protection˼', callback_data="/help3"},{text = '˹addictive˼', callback_data="/help10"},
},
{
{text = '˹Administration˼', callback_data="/help4"},
},
{
{text = '˹Developer˼', callback_data="/help9"},{text = '˹Disabled orders˼', callback_data="/hiddnt"},
},
{
{text = 'تغيير اللغه 🇦🇮.', callback_data="/help8"},
},
}
return https.request("https://api.telegram.org/bot"..token..'/editMessageText?chat_id='..Chat_id..'&text='..URL.escape(Teext)..'&message_id='..msg_idd..'&parse_mode=markdown&disable_web_page_preview=true&reply_markup='..JSON.encode(keyboard)) 
end
------------------------------ callback add dev mr DRG
if Text == '/may' then
local Teext =[[
• يلا بنا نبحث عن المنزل •
]]
keyboard = {} 
keyboard.inline_keyboard = {
{
{text = 'هيا بنا', callback_data="/afkl"},
},
}
return https.request("https://api.telegram.org/bot"..token..'/editMessagecaption?chat_id='..Chat_id..'&caption='..URL.escape(Teext)..'&message_id='..msg_idd..'&disable_web_page_preview=true&reply_markup='..JSON.encode(keyboard))  
end
if Text == '/afkl' then
local Teext =[[
• في صوت هل صدر من الامام ام الخلف •
]]
keyboard = {} 
keyboard.inline_keyboard = {
{
{text = 'الامام', callback_data="/amen"},{text = 'الخلف', callback_data="/should"},
},
}
return https.request("https://api.telegram.org/bot"..token..'/editMessagecaption?chat_id='..Chat_id..'&caption='..URL.escape(Teext)..'&message_id='..msg_idd..'&disable_web_page_preview=true&reply_markup='..JSON.encode(keyboard))  
end
if Text == '/amen' then
local Teext =[[
• هيا بنا نذهب الي الامام لنرا المنزل •
]]
keyboard = {} 
keyboard.inline_keyboard = {
{
{text = 'هيا', callback_data="/have"},
},
}
return https.request("https://api.telegram.org/bot"..token..'/editMessagecaption?chat_id='..Chat_id..'&caption='..URL.escape(Teext)..'&message_id='..msg_idd..'&disable_web_page_preview=true&reply_markup='..JSON.encode(keyboard))  
end
if Text == '/should' then
local Teext =[[
• هيا بنا نذهب الي الخلف لنرا المنزل •
]]
keyboard = {} 
keyboard.inline_keyboard = {
{
{text = 'هيا', callback_data="/have"},
},
}
return https.request("https://api.telegram.org/bot"..token..'/editMessagecaption?chat_id='..Chat_id..'&caption='..URL.escape(Teext)..'&message_id='..msg_idd..'&disable_web_page_preview=true&reply_markup='..JSON.encode(keyboard))  
end
if Text == '/have' then
local Teext =[[
• لقد وصلنا الى المنزل شكراَ جزيلَ انتطرني ثواني وسوف اعود •
]]
keyboard = {} 
keyboard.inline_keyboard = {
{
{text = 'منتظر', callback_data="/VBV"},
},
}
return https.request("https://api.telegram.org/bot"..token..'/editMessagecaption?chat_id='..Chat_id..'&caption='..URL.escape(Teext)..'&message_id='..msg_idd..'&disable_web_page_preview=true&reply_markup='..JSON.encode(keyboard))  
end

if Text == '/VBV' then
local Teext =[[
• لقد عودت إليك ظهر شيئ •
]]
keyboard = {} 
keyboard.inline_keyboard = {
{
{text = 'احد ما خرج من المنزل', callback_data="/ALLL"},
},
}
return https.request("https://api.telegram.org/bot"..token..'/editMessagecaption?chat_id='..Chat_id..'&caption='..URL.escape(Teext)..'&message_id='..msg_idd..'&disable_web_page_preview=true&reply_markup='..JSON.encode(keyboard))  
end
if Text == '/ALLL' then
local Teext =[[
• هيا نذهب داخل المنزل •
]]
keyboard = {} 
keyboard.inline_keyboard = {
{
{text = 'هيا', callback_data="/Jake"},
},
}
return https.request("https://api.telegram.org/bot"..token..'/editMessagecaption?chat_id='..Chat_id..'&caption='..URL.escape(Teext)..'&message_id='..msg_idd..'&disable_web_page_preview=true&reply_markup='..JSON.encode(keyboard))  
end
if Text == '/Jake' then
local Teext =[[
•  نحنو نتوه في هذه المكان •
]]
keyboard = {} 
keyboard.inline_keyboard = {
{
{text = 'تعالي نذهب الي الضوء', callback_data="/GGGG"},
},
}
return https.request("https://api.telegram.org/bot"..token..'/editMessagecaption?chat_id='..Chat_id..'&caption='..URL.escape(Teext)..'&message_id='..msg_idd..'&disable_web_page_preview=true&reply_markup='..JSON.encode(keyboard))  
end
if Text == '/GGGG' then
local Teext =[[
• لا يوجد ضواء في هذا المكان •
]]
keyboard = {} 
keyboard.inline_keyboard = {
{
{text = 'ياالهي كان هناك', callback_data="/can"},
},
}
return https.request("https://api.telegram.org/bot"..token..'/editMessagecaption?chat_id='..Chat_id..'&caption='..URL.escape(Teext)..'&message_id='..msg_idd..'&disable_web_page_preview=true&reply_markup='..JSON.encode(keyboard))  
end
if Text == '/can' then
local Teext =[[
• تعالى نذهب الي الباب الرئيسي •
]]
keyboard = {} 
keyboard.inline_keyboard = {
{
{text = 'انهو مغلق', callback_data="/zxz"},
},
}
return https.request("https://api.telegram.org/bot"..token..'/editMessagecaption?chat_id='..Chat_id..'&caption='..URL.escape(Teext)..'&message_id='..msg_idd..'&disable_web_page_preview=true&reply_markup='..JSON.encode(keyboard))  
end
if Text == '/zxz' then
local Teext =[[
• انها النهاية هتكمل ولا لا •
]]
keyboard = {} 
keyboard.inline_keyboard = {
{
{text = 'هكمل', callback_data="/optionis"},{text = 'انسحب', callback_data="/looks"},
},
}
return https.request("https://api.telegram.org/bot"..token..'/editMessagecaption?chat_id='..Chat_id..'&caption='..URL.escape(Teext)..'&message_id='..msg_idd..'&disable_web_page_preview=true&reply_markup='..JSON.encode(keyboard))  
end
if Text == '/optionis' then
local Teext =[[
• سارسل اليك  سوال مع اختيارت لو حليت صح ستنجو من العقاب لو خطأ سيقوم عليك العقاب •
السوال هوا - شيء لا يتأثر بالماء حتى عندما يمر من خلالها فمن يكون؟
]]
keyboard = {} 
keyboard.inline_keyboard = {
{
{text = 'السمك', callback_data="/Kelly"},{text = 'المركب', callback_data="/kalalal"},
},
{
{text = 'الضوء', callback_data="/klllag"},{text = 'الحوت', callback_data="/akakakk"},
},
{
{text = 'الخضار', callback_data="/allowj"},{text = 'الموت', callback_data="/allaly"},
},
}
return https.request("https://api.telegram.org/bot"..token..'/editMessagecaption?chat_id='..Chat_id..'&caption='..URL.escape(Teext)..'&message_id='..msg_idd..'&disable_web_page_preview=true&reply_markup='..JSON.encode(keyboard))  
end
if Text == '/klllag' then
local Teext =[[
•مبروك لقد فوزت ونجيت من العقاب•
]]
keyboard = {} 
keyboard.inline_keyboard = {
{
{text = '✅✅✅✅✅', callback_data="/01ahakaka"},
},
}
return https.request("https://api.telegram.org/bot"..token..'/editMessagecaption?chat_id='..Chat_id..'&caption='..URL.escape(Teext)..'&message_id='..msg_idd..'&disable_web_page_preview=true&reply_markup='..JSON.encode(keyboard))  
end
if Text == '/allowj' then
local Teext =[[
• غلط القاب هوا-   خلاص سامحتك •
]]
keyboard = {} 
keyboard.inline_keyboard = {
{
{text = '❌❌❌❌❌', callback_data="/01ahakaka"},
},
}
return https.request("https://api.telegram.org/bot"..token..'/editMessagecaption?chat_id='..Chat_id..'&caption='..URL.escape(Teext)..'&message_id='..msg_idd..'&disable_web_page_preview=true&reply_markup='..JSON.encode(keyboard))  
end
if Text == '/dulljob' then
ght = math.random(1,57); 
local Text ='اكتب ثيم وسيتم اختيار ثيم اخار' 
keyboard = {}  
keyboard.inline_keyboard = { 
{
{text = 'ثيم آخر 🌎', callback_data="/dulljob"},
},
}
return https.request("https://api.telegram.org/bot"..token..'/editMessagedocument?chat_id='..Chat_id..'&document='..URL.escape(Text)..'&message_id='..msg_idd..'&disable_web_page_preview=true&reply_markup='..JSON.encode(keyboard))  
end

if Text == '/allaly' then
local Teext =[[
• غلط القاب هوا-    سكر خشمك و قول كلمة من اختيار الاعبين الي معك•
]]
keyboard = {} 
keyboard.inline_keyboard = {
{
{text = '❌❌❌❌❌', callback_data="/01ahakaka"},
},
}
return https.request("https://api.telegram.org/bot"..token..'/editMessagecaption?chat_id='..Chat_id..'&caption='..URL.escape(Teext)..'&message_id='..msg_idd..'&disable_web_page_preview=true&reply_markup='..JSON.encode(keyboard))  
end
if Text == '/akakakk' then
local Teext =[[
• غلط القاب هوا-    اذهب الى واحد ماتعرفه وقل له انا كيوت وابي بوسه •
]]
keyboard = {} 
keyboard.inline_keyboard = {
{
{text = '❌❌❌❌❌', callback_data="/01ahakaka"},
},
}
return https.request("https://api.telegram.org/bot"..token..'/editMessagecaption?chat_id='..Chat_id..'&caption='..URL.escape(Teext)..'&message_id='..msg_idd..'&disable_web_page_preview=true&reply_markup='..JSON.encode(keyboard))  
end
if Text == '/kalalal' then
local Teext =[[
• غلط القاب هوا-    روح المطبخ و اكسر صحن او كوب•
]]
keyboard = {} 
keyboard.inline_keyboard = {
{
{text = '❌❌❌❌❌', callback_data="/01ahakaka"},
},
}
return https.request("https://api.telegram.org/bot"..token..'/editMessagecaption?chat_id='..Chat_id..'&caption='..URL.escape(Teext)..'&message_id='..msg_idd..'&disable_web_page_preview=true&reply_markup='..JSON.encode(keyboard))  
end
if Text == '/Kelly' then
local Teext =[[
• غلط القاب هوا-    تتصل على الوالده  و تقول لها تزوجت با سر•
]]
keyboard = {} 
keyboard.inline_keyboard = {
{
{text = '❌❌❌❌❌', callback_data="/01ahakaka"},
},
}
return https.request("https://api.telegram.org/bot"..token..'/editMessagecaption?chat_id='..Chat_id..'&caption='..URL.escape(Teext)..'&message_id='..msg_idd..'&disable_web_page_preview=true&reply_markup='..JSON.encode(keyboard))  
end



if Text == '/looks' then
local Teext =[[
• انت ستندم سأقتلك •
]]
keyboard = {} 
keyboard.inline_keyboard = {
{
{text = '❌❌❌❌❌', callback_data="/01ahakaka"},
},
}
return https.request("https://api.telegram.org/bot"..token..'/editMessagecaption?chat_id='..Chat_id..'&caption='..URL.escape(Teext)..'&message_id='..msg_idd..'&disable_web_page_preview=true&reply_markup='..JSON.encode(keyboard))  
end
if Text == '/ahakaka' then
local Teext = [[
⍆ هل انت جهاز للعب ⍆
]]
keyboard = {} 
keyboard.inline_keyboard = {
{
{text = 'حسنا', callback_data="/guitar"},
},
}
return https.request("https://api.telegram.org/bot"..token..'/editMessagecaption?chat_id='..Chat_id..'&caption='..URL.escape(Teext)..'&message_id='..msg_idd..'&disable_web_page_preview=true&reply_markup='..JSON.encode(keyboard))  
end
if Text == '/WTT' then
local Teext =[[
✖ لقد خصرت العاب من جديد ✖
]]
keyboard = {} 
keyboard.inline_keyboard = {
{
{text = 'العاب مجدداً', callback_data="/ahakaka"},
},
}
return https.request("https://api.telegram.org/bot"..token..'/editMessagecaption?chat_id='..Chat_id..'&caption='..URL.escape(Teext)..'&message_id='..msg_idd..'&disable_web_page_preview=true&reply_markup='..JSON.encode(keyboard))  
end
if Text == '/guitar' then
local Teext =[[
شيء لا يمشي إلا بالضرب فمن يكون؟
]]
keyboard = {} 
keyboard.inline_keyboard = {
{
{text = 'الحمار', callback_data="/WTT"},{text = 'الكلب', callback_data="/WTT"},
},
{
{text = 'المسمار', callback_data="/Karen"},{text = 'انت', callback_data="/WTT"},
},
}
return https.request("https://api.telegram.org/bot"..token..'/editMessagecaption?chat_id='..Chat_id..'&caption='..URL.escape(Teext)..'&message_id='..msg_idd..'&disable_web_page_preview=true&reply_markup='..JSON.encode(keyboard))  
end
if Text == '/Karen' then
local Teext =[[
لقد كسبت مبروك ✓
]]
keyboard = {} 
keyboard.inline_keyboard = {
{
{text = 'سوال اخر', callback_data="/whoa"},
},
}
return https.request("https://api.telegram.org/bot"..token..'/editMessagecaption?chat_id='..Chat_id..'&caption='..URL.escape(Teext)..'&message_id='..msg_idd..'&disable_web_page_preview=true&reply_markup='..JSON.encode(keyboard))  
end
if Text == '/whoa' then
local Teext =[[
شخص توجد قدماه في الأرض ورأسه عند النجوم فمن يكون؟
]]
keyboard = {} 
keyboard.inline_keyboard = {
{
{text = 'الكوكب', callback_data="/WTT"},{text = 'برج خليفا', callback_data="/WTT"},
},
{
{text = 'القمر', callback_data="/WTT"},{text = 'الضابط', callback_data="/fighting"},
},
}
return https.request("https://api.telegram.org/bot"..token..'/editMessagecaption?chat_id='..Chat_id..'&caption='..URL.escape(Teext)..'&message_id='..msg_idd..'&disable_web_page_preview=true&reply_markup='..JSON.encode(keyboard))  
end
if Text == '/fighting' then
local Teext =[[
لقد كسبت مبروك ✓
]]
keyboard = {} 
keyboard.inline_keyboard = {
{
{text = 'سوال اخر', callback_data="/aliquots"},
},
}
return https.request("https://api.telegram.org/bot"..token..'/editMessagecaption?chat_id='..Chat_id..'&caption='..URL.escape(Teext)..'&message_id='..msg_idd..'&disable_web_page_preview=true&reply_markup='..JSON.encode(keyboard))  
end
if Text == '/aliquots' then
local Teext =[[
شيء كلما ذبحته بكيت عليه فمن هو؟
]]
keyboard = {} 
keyboard.inline_keyboard = {
{
{text = 'الخروف', callback_data="/WTT"},{text = 'البصل', callback_data="/trait"},
},
{
{text = 'ابي', callback_data="/WTT"},{text = 'الثوم', callback_data="/WTT"},
},
}
return https.request("https://api.telegram.org/bot"..token..'/editMessagecaption?chat_id='..Chat_id..'&caption='..URL.escape(Teext)..'&message_id='..msg_idd..'&disable_web_page_preview=true&reply_markup='..JSON.encode(keyboard))  
end
if Text == '/trait' then
local Teext =[[
لقد كسبت مبروك ✓
]]
keyboard = {} 
keyboard.inline_keyboard = {
{
{text = 'سوال اخر', callback_data="/qqpi"},
},
}
return https.request("https://api.telegram.org/bot"..token..'/editMessagecaption?chat_id='..Chat_id..'&caption='..URL.escape(Teext)..'&message_id='..msg_idd..'&disable_web_page_preview=true&reply_markup='..JSON.encode(keyboard))  
end
if Text == '/qqpi' then
local Teext =[[
شيء يتحرك أمامك ولكن لم تشاهده فمن هو؟
]]
keyboard = {} 
keyboard.inline_keyboard = {
{
{text = 'الجن', callback_data="/WTT"},{text = 'الفهد', callback_data="/WTT"},
},
{
{text = 'الهواء', callback_data="/duio"},{text = 'النمله', callback_data="/WTT"},
},
}
return https.request("https://api.telegram.org/bot"..token..'/editMessagecaption?chat_id='..Chat_id..'&caption='..URL.escape(Teext)..'&message_id='..msg_idd..'&disable_web_page_preview=true&reply_markup='..JSON.encode(keyboard))  
end
if Text == '/duio' then
local Teext =[[
لقد كسبت مبروك ✓
]]
keyboard = {} 
keyboard.inline_keyboard = {
{
{text = 'سوال اخر', callback_data="/yyuu"},
},
}
return https.request("https://api.telegram.org/bot"..token..'/editMessagecaption?chat_id='..Chat_id..'&caption='..URL.escape(Teext)..'&message_id='..msg_idd..'&disable_web_page_preview=true&reply_markup='..JSON.encode(keyboard))  
end
if Text == '/yyuu' then
local Teext =[[
شيء يوجد في الليل ثلاث مرات وفي النهار مرة واحدة فمن هو؟
]]
keyboard = {} 
keyboard.inline_keyboard = {
{
{text = 'النجوم', callback_data="/WTT"},{text = 'القمر', callback_data="/WTT"},
},
{
{text = 'حرف الالف', callback_data="/WTT"},{text = 'حرف اللام', callback_data="/your"},
},
}
return https.request("https://api.telegram.org/bot"..token..'/editMessagecaption?chat_id='..Chat_id..'&caption='..URL.escape(Teext)..'&message_id='..msg_idd..'&disable_web_page_preview=true&reply_markup='..JSON.encode(keyboard))  
end
if Text == '/your' then
local Teext =[[
لقد كسبت مبروك ✓
]]
keyboard = {} 
keyboard.inline_keyboard = {
{
{text = 'سوال اخر', callback_data="/oppp"},
},
}
return https.request("https://api.telegram.org/bot"..token..'/editMessagecaption?chat_id='..Chat_id..'&caption='..URL.escape(Teext)..'&message_id='..msg_idd..'&disable_web_page_preview=true&reply_markup='..JSON.encode(keyboard))  
end
if Text == '/oppp' then
local Teext =[[
يتحرك بلا أقدام ولا يدخل إلى بالأذنين فما هو؟
]]
keyboard = {} 
keyboard.inline_keyboard = {
{
{text = 'منظف الاذنين', callback_data="/WTT"},{text = 'الهواء', callback_data="/WTT"},
},
{
{text = 'التراب', callback_data="/WTT"},{text = 'الصوت', callback_data="/plma"},
},
}
return https.request("https://api.telegram.org/bot"..token..'/editMessagecaption?chat_id='..Chat_id..'&caption='..URL.escape(Teext)..'&message_id='..msg_idd..'&disable_web_page_preview=true&reply_markup='..JSON.encode(keyboard))  
end
if Text == '/plma' then
local Teext =[[
لقد كسبت مبروك ✓
]]
keyboard = {} 
keyboard.inline_keyboard = {
{
{text = 'سوال اخر', callback_data="/fusion"},
},
}
return https.request("https://api.telegram.org/bot"..token..'/editMessagecaption?chat_id='..Chat_id..'&caption='..URL.escape(Teext)..'&message_id='..msg_idd..'&disable_web_page_preview=true&reply_markup='..JSON.encode(keyboard))  
end
if Text == '/verp' then
local Teext =[[
لقد كسبت مبروك ✓
]]
keyboard = {} 
keyboard.inline_keyboard = {
{
{text = 'نسبه الذكاء 100%', callback_data="/ججج"},
},
}
return https.request("https://api.telegram.org/bot"..token..'/editMessagecaption?chat_id='..Chat_id..'&caption='..URL.escape(Teext)..'&message_id='..msg_idd..'&disable_web_page_preview=true&reply_markup='..JSON.encode(keyboard))  
end
if Text == '/pulng' then
local Teext =[[
✖ لقد خصرت  ✖
]]
keyboard = {} 
keyboard.inline_keyboard = {
{
{text = 'نسبه الذكاء 70%', callback_data="/ججج"},
},
}
return https.request("https://api.telegram.org/bot"..token..'/editMessagecaption?chat_id='..Chat_id..'&caption='..URL.escape(Teext)..'&message_id='..msg_idd..'&disable_web_page_preview=true&reply_markup='..JSON.encode(keyboard))  
end
if Text == '/pullin' then
local Teext =[[
✖ لقد خصرت  ✖
]]
keyboard = {} 
keyboard.inline_keyboard = {
{
{text = 'نسبه الذكاء 40%', callback_data="/ججج"},
},
}
return https.request("https://api.telegram.org/bot"..token..'/editMessagecaption?chat_id='..Chat_id..'&caption='..URL.escape(Teext)..'&message_id='..msg_idd..'&disable_web_page_preview=true&reply_markup='..JSON.encode(keyboard))  
end
if Text == '/plling' then
local Teext =[[
✖ لقد خصرت  ✖
]]
keyboard = {} 
keyboard.inline_keyboard = {
{
{text = 'نسبه الذكاء 0%', callback_data="/ججج"},
},
}
return https.request("https://api.telegram.org/bot"..token..'/editMessagecaption?chat_id='..Chat_id..'&caption='..URL.escape(Teext)..'&message_id='..msg_idd..'&disable_web_page_preview=true&reply_markup='..JSON.encode(keyboard))  
end

if Text == '/fusion' then
local Teext =[[
نشأ القانون الدولي....؟
]]
keyboard = {} 
keyboard.inline_keyboard = {
{
{text = 'في الحرب العالمية', callback_data="/WTT"},{text = 'قبل الحرب العالمية', callback_data="/WTT"},
},
{
{text = 'بعد الحرب العالمية', callback_data="/akkakak"},{text = 'في حرب فيتنام', callback_data="/WTT"},
},
}
return https.request("https://api.telegram.org/bot"..token..'/editMessagecaption?chat_id='..Chat_id..'&caption='..URL.escape(Teext)..'&message_id='..msg_idd..'&disable_web_page_preview=true&reply_markup='..JSON.encode(keyboard))  
end
if Text == '/akkakak' then
local Teext =[[
لقد كسبت مبروك ✓
]]
keyboard = {} 
keyboard.inline_keyboard = {
{
{text = 'لبدا العبه من جديد', callback_data="/ahakaka"},
},
}
return https.request("https://api.telegram.org/bot"..token..'/editMessagecaption?chat_id='..Chat_id..'&caption='..URL.escape(Teext)..'&message_id='..msg_idd..'&disable_web_page_preview=true&reply_markup='..JSON.encode(keyboard))  
end
if Text == '/mute-name' then
local Teext =[[
 ⌯︙أنت الآن في العاب السورس ..↑↓
•━═━═━═「ɢᴏʟᴅ」═━═━═━•
]]
keyboard = {} 
keyboard.inline_keyboard = {
{{text = 'لعبه البات', callback_data="/help30"},{text = 'لعبه الرياضيات', callback_data="/help37"}},   
{{text = 'لعبه المختلف', callback_data="/help31"},{text = 'لعبه السمايلات', callback_data="/help38"}}, 
{{text = 'لعبه التخمين', callback_data="/help32"},{text = 'لعبه العكس', callback_data="/help39"}}, 
{{text = 'لعبه الاسرع', callback_data="/help33"},{text = 'لعبه الانكليزي', callback_data="/help40"}}, 
{{text = 'لعبه حزوره', callback_data="/help34"},{text = 'لعبه المعاني', callback_data="/help41"}}, 
{{text = 'لعبه الامثله', callback_data="/help35"}},
{{text = 'لعبه كشف الكذب', callback_data="/help47"}},
{{text = 'مريم', callback_data="/help36"},{text = 'عقاب', callback_data="/help42"}},
{{text = '◗القائمه الرئيسيه◖', callback_data="/add"}},
{{text = '𝐓𝐞𝐚𝐦 𝐆𝐨𝐥𝐝', url="t.me/g_00_l_d"}},
}
return https.request("https://api.telegram.org/bot"..token..'/editMessagecaption?chat_id='..Chat_id..'&caption='..URL.escape(Teext)..'&message_id='..msg_idd..'&disable_web_page_preview=true&reply_markup='..JSON.encode(keyboard))  
end

if Text == '/help30' then
local Text = 'لتجربه العلبه عليك ان تكتب البات في الشات🔒'
https.request("https://api.telegram.org/bot"..token.."/answerCallbackQuery?callback_query_id="..data.id_.."&text="..URL.escape(Text).."&show_alert=true")
return false
end
if Text == '/help31' then
local Text = 'لتجربه العلبه عليك ان تكتب المختلف في الشات🔒'
https.request("https://api.telegram.org/bot"..token.."/answerCallbackQuery?callback_query_id="..data.id_.."&text="..URL.escape(Text).."&show_alert=true")
return false
end
if Text == '/help32' then
local Text = 'لتجربه العلبه عليك ان تكتب التخمين في الشات🔒'
https.request("https://api.telegram.org/bot"..token.."/answerCallbackQuery?callback_query_id="..data.id_.."&text="..URL.escape(Text).."&show_alert=true")
return false
end
if Text == '/help33' then
local Text = 'لتجربه العلبه عليك ان تكتب الاسرع في الشات🔒'
https.request("https://api.telegram.org/bot"..token.."/answerCallbackQuery?callback_query_id="..data.id_.."&text="..URL.escape(Text).."&show_alert=true")
return false
end
if Text == '/help34' then
local Text = 'لتجربه العلبه عليك ان تكتب الحزوه في الشات🔒'
https.request("https://api.telegram.org/bot"..token.."/answerCallbackQuery?callback_query_id="..data.id_.."&text="..URL.escape(Text).."&show_alert=true")
return false
end
if Text == '/help35' then
local Text = 'لتجربه العلبه عليك ان تكتب امثله في الشات🔒'
https.request("https://api.telegram.org/bot"..token.."/answerCallbackQuery?callback_query_id="..data.id_.."&text="..URL.escape(Text).."&show_alert=true")
return false
end
if Text == '/help36' then
local Text = 'لتجربه العلبه عليك ان تكتب مريم في الشات🔒'
https.request("https://api.telegram.org/bot"..token.."/answerCallbackQuery?callback_query_id="..data.id_.."&text="..URL.escape(Text).."&show_alert=true")
return false
end
if Text == '/help37' then
local Text = 'لتجربه العلبه عليك ان تكتب الرياضيات في الشات🔒'
https.request("https://api.telegram.org/bot"..token.."/answerCallbackQuery?callback_query_id="..data.id_.."&text="..URL.escape(Text).."&show_alert=true")
return false
end
if Text == '/help38' then
local Text = 'لتجربه العلبه عليك ان تكتب السمايلات في الشات🔒'
https.request("https://api.telegram.org/bot"..token.."/answerCallbackQuery?callback_query_id="..data.id_.."&text="..URL.escape(Text).."&show_alert=true")
return false
end
if Text == '/help39' then
local Text = 'لتجربه العلبه عليك ان تكتب العكس في الشات🔒'
https.request("https://api.telegram.org/bot"..token.."/answerCallbackQuery?callback_query_id="..data.id_.."&text="..URL.escape(Text).."&show_alert=true")
return false
end
if Text == '/help40' then
local Text = 'لتجربه العلبه عليك ان تكتب الانكليزي في الشات🔒'
https.request("https://api.telegram.org/bot"..token.."/answerCallbackQuery?callback_query_id="..data.id_.."&text="..URL.escape(Text).."&show_alert=true")
return false
end
if Text == '/help41' then
local Text = 'لتجربه العلبه عليك ان تكتب المعاني في الشات🔒'
https.request("https://api.telegram.org/bot"..token.."/answerCallbackQuery?callback_query_id="..data.id_.."&text="..URL.escape(Text).."&show_alert=true")
return false
end
if Text == '/help42' then
local Text = 'لتجربه العلبه عليك ان تكتب عقاب في الشات🔒'
https.request("https://api.telegram.org/bot"..token.."/answerCallbackQuery?callback_query_id="..data.id_.."&text="..URL.escape(Text).."&show_alert=true")
return false
end
if Text == '/help47' then
local Text = 'لتجربه العلبه عليك ان تكتب كشف الكذب في الشات🔒'
https.request("https://api.telegram.org/bot"..token.."/answerCallbackQuery?callback_query_id="..data.id_.."&text="..URL.escape(Text).."&show_alert=true")
return false
end
function mahmoudr(chat_id, reply_to_message_id, audio, caption, markdown) 
send_api = "https://api.telegram.org/bot"..token 
local url = send_api.."/sendAudio?chat_id=" .. chat_id .. "&audio=" .. audio .."&caption=" .. URL.escape(caption) 
if reply_to_message_id ~= 0 then 
reply_to_message_id_ = reply_to_message_id
url = url .. "&reply_to_message_id=" .. reply_to_message_id_ .."&parse_mode=Markdown" 
end 
return s_api(url) 
end
if text == 'صوت' then
audio = 'هنا تحط رابط الاغنيه'
caption = 'هنا تكتب النص اللي هيظهر مع الاغنيه'
mahmoudr(msg.chat_id_, msg.id_/2097152/0.5,audio,caption)
end

if Text == '/DRG' then
local Teext =[[
 ⌯︙ مرحبا بيك في الالعاب  الالكترونيه ..↑↓
•━═━═━═「ɢᴏʟᴅ」═━═━═━•
]]
keyboard = {} 
keyboard.inline_keyboard = {
{{text = 'فلابي بيرد', url="https://t.me/awesomebot?game=FlappyBird"},{text = 'تحداني فالرياضيات',url="https://t.me/gamebot?game=MathBattle"}},   
{{text = 'لعبه دراجات', url="https://t.me/gamee?game=MotoFX"},{text = 'سباق سيارات', url="https://t.me/gamee?game=F1Racer"}}, 
{{text = 'تشابه', url="https://t.me/gamee?game=DiamondRows"},{text = 'كره القدم', url="https://t.me/gamee?game=FootballStar"}}, 
{{text = 'ورق', url="https://t.me/gamee?game=Hexonix"},{text = 'لعبه 2048', url="https://t.me/awesomebot?game=g2048"}}, 
{{text = 'SQUARES', url="https://t.me/gamee?game=Squares"},{text = 'ATOMIC', url="https://t.me/gamee?game=AtomicDrop1"}}, 
{{text = 'CORSAIRS', url="https://t.me/gamebot?game=Corsairs"},{text = 'LumberJack', url="https://t.me/gamebot?game=LumberJack"}}, 
{{text = 'LittlePlane', url="https://t.me/gamee?game=LittlePlane"},{text = 'RollerDisco', url="https://t.me/gamee?game=RollerDisco"}},  
{{text = 'كره القدم 2', url="https://t.me/gamee?game=PocketWorldCup"},{text = 'جمع المياه', url="https://t.me/gamee?game=BlockBuster"}},  
{{text = 'لا تجعلها تسقط', url="https://t.me/gamee?game=Touchdown"},{text = 'GravityNinja', url="https://t.me/gamee?game=GravityNinjaEmeraldCity"}},  
{{text = 'Astrocat', url="https://t.me/gamee?game=Astrocat"},{text = 'Skipper', url="https://t.me/gamee?game=Skipper"}},  
{{text = 'WorldCup', url="https://t.me/gamee?game=PocketWorldCup"},{text = 'GeometryRun', url="https://t.me/gamee?game=GeometryRun"}},  
{{text = 'Ten2One', url="https://t.me/gamee?game=Ten2One"},{text = 'NeonBlast2', url="https://t.me/gamee?game=NeonBlast2"}},  
{{text = 'Paintio', url="https://t.me/gamee?game=Paintio"},{text = 'onetwothree', url="https://t.me/gamee?game=onetwothree"}},  
{{text = 'BrickStacker', url="https://t.me/gamee?game=BrickStacker"},{text = 'StairMaster3D', url="https://t.me/gamee?game=StairMaster3D"}},  
{{text = 'LoadTheVan', url="https://t.me/gamee?game=LoadTheVan"},{text = 'BasketBoyRush', url="https://t.me/gamee?game=BasketBoyRush"}},  
{{text = 'GravityNinja21', url="https://t.me/gamee?game=GravityNinja21"},{text = 'MarsRover', url="https://t.me/gamee?game=MarsRover"}},  
{{text = 'LoadTheVan', url="https://t.me/gamee?game=LoadTheVan"},{text = 'GroovySki', url="https://t.me/gamee?game=GroovySki"}},  
{{text = 'PaintioTeams', url="https://t.me/gamee?game=PaintioTeams"},{text = 'KeepItUp', url="https://t.me/gamee?game=KeepItUp"}},  
{{text = 'SunshineSolitaire', url="https://t.me/gamee?game=SunshineSolitaire"},{text = 'Qubo', url="https://t.me/gamee?game=Qubo"}},  
{{text = 'PenaltyShooter2', url="https://t.me/gamee?game=PenaltyShooter2"},{text = 'Getaway', url="https://t.me/gamee?game=Getaway"}},  
{{text = 'PaintioTeams', url="https://t.me/gamee?game=PaintioTeams"},{text = 'SpikyFish2', url="https://t.me/gamee?game=SpikyFish2"}},  
{{text = 'GroovySki', url="https://t.me/gamee?game=GroovySki"},{text = 'KungFuInc', url="https://t.me/gamee?game=KungFuInc"}},  
{{text = 'SpaceTraveler', url="https://t.me/gamee?game=SpaceTraveler"},{text = 'RedAndBlue', url="https://t.me/gamee?game=RedAndBlue"}},  
{{text = 'SkodaHockey1 ', url="https://t.me/gamee?game=SkodaHockey1"},{text = 'SummerLove', url="https://t.me/gamee?game=SummerLove"}},  
{{text = 'SmartUpShark', url="https://t.me/gamee?game=SmartUpShark"},{text = 'SpikyFish3', url="https://t.me/gamee?game=SpikyFish3"}},  
{{text = '◗القائمه الرئيسيه◖', callback_data="/add"}},
{{text = '𝐓𝐞𝐚𝐦 𝐆𝐨𝐥𝐝', url="t.me/g_00_l_d"}},
}
return https.request("https://api.telegram.org/bot"..token..'/editMessagecaption?chat_id='..Chat_id..'&caption='..URL.escape(Teext)..'&message_id='..msg_idd..'&disable_web_page_preview=true&reply_markup='..JSON.encode(keyboard))  
end
if Text == '/change-names' then
local Teext =[[
    「اوامر الاعضاء ⇊」  
 •━═━═━═「ɢᴏʟᴅ」═━═━═━•
 ⌯︙   غنيلي ⇔ حساب العمر   
 ⌯︙   صورتي ⇔ نسبه جمالي
 ⌯︙   نقاطي
 ⌯︙    مسح ⇔ بيع 「نقاطي 」 
 ⌯︙   رسائلي ⇔  مسح 「رسائلي 」 
 ⌯︙   زخرفه ⇔ اغاني 
 ⌯︙   اسمي ⇔ الرتبه
 ⌯︙  جهاتي 
 ⌯︙  صلاحياتي
 ⌯︙  قول +الكلمه
 ⌯︙  تفعيل  تعطيل+ اطردني   
 ⌯︙   سورس ⇔ المطور
 ⌯︙   الرابط ⇔ ايدي
 ⌯︙   رتبتي ⇔ كشف
 ⌯︙   رد  انت يا بوت
 ⌯︙  ي رايك يابوت
 ⌯︙   هينو ⇔ هينها
 ⌯︙   بوسو ⇔ بوسها
 ⌯︙   بتحب دي ⇔ بتحب ده
 ⌯︙  بوت الحذف⇔رابط الحذف
•━═━═━═「ɢᴏʟᴅ」═━═━═━•
 
]]
keyboard = {} 
keyboard.inline_keyboard = {
{
{text = '◗القائمه الرئيسيه◖', callback_data="/change-id"},
},
{
{text = '𝐓𝐞𝐚𝐦 𝐆𝐨𝐥𝐝', url="t.me/g_00_l_d"},
},
}
return https.request("https://api.telegram.org/bot"..token..'/editMessageText?chat_id='..Chat_id..'&text='..URL.escape(Teext)..'&message_id='..msg_idd..'&parse_mode=markdown&disable_web_page_preview=true&reply_markup='..JSON.encode(keyboard)) 
end
if Text == '/change-id' then
local Teext =[[
 ⌯︙ الاوامر الاعضاء ..↑↓
 تحت لي في الزر الأسفل↓
•━═━═━═「ɢᴏʟᴅ」═━═━═━•
]]
keyboard = {} 
keyboard.inline_keyboard = {
{
{text = 'اوامر الاعضاء', callback_data="/change-names"},
},
{
{text = '𝐓𝐞𝐚𝐦 𝐆𝐨𝐥𝐝', url="t.me/g_00_l_d"},
},
}
return https.request("https://api.telegram.org/bot"..token..'/editMessageText?chat_id='..Chat_id..'&text='..URL.escape(Teext)..'&message_id='..msg_idd..'&parse_mode=markdown&disable_web_page_preview=true&reply_markup='..JSON.encode(keyboard)) 
end
if Text == '/change-photo' then
local Teext =[[
⌯︙ مرحباً بك في الالعاب المضافه حديثا ..↑↓
•━═━═━═「ɢᴏʟᴅ」═━═━═━•
]]
keyboard = {} 
keyboard.inline_keyboard = {
{{text = 'تويت', callback_data="/help12"},{text = 'تويت بالصور', callback_data="/help56"}},   
{{text = 'لو خيروك', callback_data="/help20"},{text = 'لو خيروك بالصور', callback_data="/help25"}}, 
{{text = 'انصحني', callback_data="/help13"},{text = 'كتبات', callback_data="/help19"}}, 
{{text = 'الصراحه', callback_data="/help14"},{text = 'حروف', callback_data="/help21"}}, 
{{text = 'اسالني', callback_data="/hakwl"},{text = 'اختبار الذكاء', callback_data="/wyauuu"}}, 
{{text = 'مستقلبي', callback_data="/whklpp"},{text = 'الابراج', callback_data="/uwujjh"}}, 
{{text = 'رزله', callback_data="/help15"},{text = 'رد عليه يابوت', callback_data="/help22"}}, 
{{text = 'بتكره دا', callback_data="/help16"},{text = 'نكته', callback_data="/help23"}}, 
{{text = 'حروف بالصور', callback_data="/Xcvb"},{text = 'اصنع', callback_data="/klpou6"}}, 
{{text = 'غنيلي', callback_data="/help17"}},
{{text = 'نسبه جمالي', callback_data="/help18"},{text = 'اليتيوب', callback_data="/help24"}},
{{text = '◗القائمه الرئيسيه◖', callback_data="/add"}},
{{text = '𝐓𝐞𝐚𝐦 𝐆𝐨𝐥𝐝', url="t.me/g_00_l_d"}},
}
return https.request("https://api.telegram.org/bot"..token..'/editMessagecaption?chat_id='..Chat_id..'&caption='..URL.escape(Teext)..'&message_id='..msg_idd..'&disable_web_page_preview=true&reply_markup='..JSON.encode(keyboard))  
end
if Text == '/Xcvb' then
local Text = 'لتجربه العلبه عليك ان تكتب حروف بالصور في الشات🔒'
https.request("https://api.telegram.org/bot"..token.."/answerCallbackQuery?callback_query_id="..data.id_.."&text="..URL.escape(Text).."&show_alert=true")
return false
end
if Text == '/klpou6' then
local Text = 'لو عايز يوزر ليك اكتب اصنع واستخرج يوزرك🔒'
https.request("https://api.telegram.org/bot"..token.."/answerCallbackQuery?callback_query_id="..data.id_.."&text="..URL.escape(Text).."&show_alert=true")
return false
end
if Text == '/hakwl' then
local Text = 'لتجربه العلبه عليك ان تكتب اسالني في الشات🔒'
https.request("https://api.telegram.org/bot"..token.."/answerCallbackQuery?callback_query_id="..data.id_.."&text="..URL.escape(Text).."&show_alert=true")
return false
end
if Text == '/wyauuu' then
local Text = 'لتجربه العلبه عليك ان تكتب اختبار الذكاء في الشات🔒'
https.request("https://api.telegram.org/bot"..token.."/answerCallbackQuery?callback_query_id="..data.id_.."&text="..URL.escape(Text).."&show_alert=true")
return false
end
if Text == '/whklpp' then
local Text = 'لتجربه العلبه عليك ان تكتب مستقبلي في الشات🔒'
https.request("https://api.telegram.org/bot"..token.."/answerCallbackQuery?callback_query_id="..data.id_.."&text="..URL.escape(Text).."&show_alert=true")
return false
end
if Text == '/uwujjh' then
local Text = 'لتجربه العلبه عليك ان تكتب الابراج في الشات🔒'
https.request("https://api.telegram.org/bot"..token.."/answerCallbackQuery?callback_query_id="..data.id_.."&text="..URL.escape(Text).."&show_alert=true")
return false
end
if Text == '/help12' then
local Text = 'لتجربه العلبه عليك ان تكتب تويت في الشات🔒'
https.request("https://api.telegram.org/bot"..token.."/answerCallbackQuery?callback_query_id="..data.id_.."&text="..URL.escape(Text).."&show_alert=true")
return false
end
if Text == '/help13' then
local Text = 'لتجربه العلبه عليك ان تكتب انصحني في الشات🔒'
https.request("https://api.telegram.org/bot"..token.."/answerCallbackQuery?callback_query_id="..data.id_.."&text="..URL.escape(Text).."&show_alert=true")
return false
end
if Text == '/help14' then
local Text = 'لتجربه العلبه عليك ان تكتب الصراحه في الشات🔒'
https.request("https://api.telegram.org/bot"..token.."/answerCallbackQuery?callback_query_id="..data.id_.."&text="..URL.escape(Text).."&show_alert=true")
return false
end
if Text == '/help15' then
local Text = 'لتجربه العلبه عليك ان تكتب رزله في الشات🔒'
https.request("https://api.telegram.org/bot"..token.."/answerCallbackQuery?callback_query_id="..data.id_.."&text="..URL.escape(Text).."&show_alert=true")
return false
end
if Text == '/help16' then
local Text = 'لتجربه العلبه عليك ان تكتب بتكره دا في الشات🔒'
https.request("https://api.telegram.org/bot"..token.."/answerCallbackQuery?callback_query_id="..data.id_.."&text="..URL.escape(Text).."&show_alert=true")
return false
end
if Text == '/help17' then
local Text = 'للاستماع للاغاني عليك ان تكتب غنيلي في الشات🔒'
https.request("https://api.telegram.org/bot"..token.."/answerCallbackQuery?callback_query_id="..data.id_.."&text="..URL.escape(Text).."&show_alert=true")
return false
end
if Text == '/help18' then
local Text = 'لتجربه العلبه عليك ان تكتب نسبه جمالي في الشات🔒'
https.request("https://api.telegram.org/bot"..token.."/answerCallbackQuery?callback_query_id="..data.id_.."&text="..URL.escape(Text).."&show_alert=true")
return false
end
if Text == '/help19' then
local Text = 'لتجربه العلبه عليك ان تكتب كتبات في الشات🔒'
https.request("https://api.telegram.org/bot"..token.."/answerCallbackQuery?callback_query_id="..data.id_.."&text="..URL.escape(Text).."&show_alert=true")
return false
end
if Text == '/help20' then
local Text = 'لتجربه العلبه عليك ان تكتب لو خيروك في الشات🔒'
https.request("https://api.telegram.org/bot"..token.."/answerCallbackQuery?callback_query_id="..data.id_.."&text="..URL.escape(Text).."&show_alert=true")
return false
end
if Text == '/help21' then
local Text = 'لتجربه العلبه عليك ان تكتب حروف في الشات🔒'
https.request("https://api.telegram.org/bot"..token.."/answerCallbackQuery?callback_query_id="..data.id_.."&text="..URL.escape(Text).."&show_alert=true")
return false
end
if Text == '/help22' then
local Text = 'لتجربه العلبه عليك ان تكتب رد عليه يابوت في الشات🔒'
https.request("https://api.telegram.org/bot"..token.."/answerCallbackQuery?callback_query_id="..data.id_.."&text="..URL.escape(Text).."&show_alert=true")
return false
end
if Text == '/help23' then
local Text = 'لتجربه العلبه عليك ان تكتب نكته في الشات🔒'
https.request("https://api.telegram.org/bot"..token.."/answerCallbackQuery?callback_query_id="..data.id_.."&text="..URL.escape(Text).."&show_alert=true")
return false
end
if Text == '/help24' then
local Text = 'لتحميل من المواقع عليك ان تكتب اليتيوب في الشات🔒'
https.request("https://api.telegram.org/bot"..token.."/answerCallbackQuery?callback_query_id="..data.id_.."&text="..URL.escape(Text).."&show_alert=true")
return false
end
if Text == '/help25' then
local Text = 'لتجربه العلبه عليك ان تكتب لو خيروك بالصور في الشات🔒'
https.request("https://api.telegram.org/bot"..token.."/answerCallbackQuery?callback_query_id="..data.id_.."&text="..URL.escape(Text).."&show_alert=true")
return false
end
if Text == '/help56' then
local Text = 'لتجربه العلبه عليك ان تكتب تويت بالصور في الشات🔒'
https.request("https://api.telegram.org/bot"..token.."/answerCallbackQuery?callback_query_id="..data.id_.."&text="..URL.escape(Text).."&show_alert=true")
return false
end
--- callback added
if Text == '/add' then
local Teext =[[
⌯︙ اهلا بك في قسم الالعاب ..↑↓
 اختر العبه الذي تريدها .↑↓
ده من الازرار بلاسفل . ↓
•━═━═━═「ɢᴏʟᴅ」═━═━═━•
 
]]
keyboard = {} 
keyboard.inline_keyboard = {
{
{text = '◗العاب السورس◖', callback_data="/mute-name"},{text = '◗الاضافات◖', callback_data="/change-photo"},
},
{
{text = '◗ متطوره◖', callback_data="/DRG"},
},
{
{text = '𝐓𝐞𝐚𝐦 𝐆𝐨𝐥𝐝', url="t.me/g_00_l_d"},
},
}
return https.request("https://api.telegram.org/bot"..token..'/editMessagecaption?chat_id='..Chat_id..'&caption='..URL.escape(Teext)..'&message_id='..msg_idd..'&disable_web_page_preview=true&reply_markup='..JSON.encode(keyboard))  
end
if Text == '/zDRGd' then
local Teext =[[
• اختر برجك عزيزي •📮،⍆
]]
keyboard = {} 
keyboard.inline_keyboard = {
{
{text = '• الاسد ،🦁', callback_data="/zking"},{text = '• الثور 🐂', callback_data="/zzor"},
},
{
{text = '• العقرب 🦂', callback_data="/zakrb"},{text = '• القوس 🏹', callback_data="/zkos"},
},
{
{text = '• الحمل 🐐', callback_data="/zBoody"},
},
{
{text = '• السرطان 🦀', callback_data="/zsltan"},{text = '• العذراء 🦋', callback_data="/zazra"},
},
{
{text = '• الميزان ⚖', callback_data="/zmezan"},{text = '• الجدي 🦌', callback_data="/zgagy"},
},
{
{text = ' معرفة برجك 🧭', callback_data="/zporg"},
},
{
{text = '• الحوت 🐋', callback_data="/zhot"},
},
{
{text = '• الجوزاء 🌩', callback_data="/zguza"},{text = '• الدلو 🦯', callback_data="/zdlu"},
},
{
{text = '𝐓𝐞𝐚𝐦 𝐆𝐨𝐥𝐝', url="t.me/g_00_l_d"},
},
}
return https.request("https://api.telegram.org/bot"..token..'/editMessagecaption?chat_id='..Chat_id..'&caption='..URL.escape(Teext)..'&message_id='..msg_idd..'&disable_web_page_preview=true&reply_markup='..JSON.encode(keyboard))  
end

if Text == '/change-hhh' then
local Teext =[[ 
⌯︙ اليك قائمه الاسعار في الاسفل ..↑↓
•━═━═━═「ɢᴏʟᴅ」═━═━═━•
]]
keyboard = {} 
keyboard.inline_keyboard = {
{
{text = 'نبذه عن السورس', callback_data="/change-ghjjgyy"},
},
{
{text = '𝐓𝐞𝐚𝐦 𝐆𝐨𝐥𝐝', url="t.me/g_00_l_d"},
},
}
return https.request("https://api.telegram.org/bot"..token..'/editMessagecaption?chat_id='..Chat_id..'&caption='..URL.escape(Teext)..'&message_id='..msg_idd..'&disable_web_page_preview=true&reply_markup='..JSON.encode(keyboard))  
end
if Text == '/change-ghjjgyy' then
local Teext =[[
📬 • 𝐚𝐛𝐨𝐮𝐭 𝐭𝐡𝐞 𝐬𝐨𝐮𝐫𝐜𝐞
•━═━═━═「ɢᴏʟᴅ」═━═━═━•
⌯︙سورس خاص في حماية المجموعات من التفليش 🚸 . 
⌯︙تستطيع تنصيب بوتك وتصبح المطور الاساسي 👨🏼‍✈️.
⌯︙تستطيع اضافة قناتك اشتراك اجباري في بوتك ⚠️ .
⌯︙سرعة في اداء البوت ومزايا حصرية فقط لسورسنا 〽️ .
⌯︙لمعرفة ميزات اكثر عن السورس زور قناة التحديثات .
⌯︙اطلب بوتك الأن 🌐 .
 •━═━═━═「ɢᴏʟᴅ」═━═━═━•

]]
keyboard = {} 
keyboard.inline_keyboard = {
{{text = '𝐓𝐞𝐚𝐦 𝐆𝐨𝐥𝐝', url="t.me/g_00_l_d"}},
{{text = '˹تــواصــل الـسـورس˼',url="t.me/Hdudbdbot"}}, 
{{text = 'رجوع 🔙', callback_data="/change-hhh"}},
}
return https.request("https://api.telegram.org/bot"..token..'/editMessagecaption?chat_id='..Chat_id..'&caption='..URL.escape(Teext)..'&message_id='..msg_idd..'&disable_web_page_preview=true&reply_markup='..JSON.encode(keyboard))  
end
if Text == '/change-siusr' then
local Teext =[[
𖢜 𝗪𝗲𝗹𝗰𝗼𝗺𝗲 𝘁𝗼 𝗦𝗼𝘂𝗿𝗰𝗲 𝗚𝗼𝗹𝗱⇣
]]
keyboard = {} 
keyboard.inline_keyboard = {
{{text = '𝗔𝗵𝗺𝗲𝗱 𝗘𝗹𝗺𝗮𝘀𝗿𝘆',url="t.me/DEV_AH8"},{text = '𝗝𝗮𝘃𝗮 𝗘𝗹𝗵𝗮𝗸𝗲𝗿',url="t.me/JAI6H"}},
{{text = '𝗗𝗲𝘃 𝗔𝗯𝗱𝗼',url="t.me/DV_ABDO"}}, 
{{text = '𝗜𝘀𝗹𝗮𝗺',url="t.me/Amvggddghhgddsfhhfddhh"},{text = '𝗧𝗶𝗴𝗲𝗿',url="t.me/Dev_RE4"}},
{{text = '𝗗𝗲𝘃 𝗕𝗼𝘁 ➪.', url="http://t.me/"..sudos.UserName}},
}
return https.request("https://api.telegram.org/bot"..token..'/editMessagecaption?chat_id='..Chat_id..'&caption='..URL.escape(Teext)..'&message_id='..msg_idd..'&disable_web_page_preview=true&reply_markup='..JSON.encode(keyboard))  
end

if Text == '/Ajobanf' then
local Teext =[[
 source Gold the best tele 
we the best of tele 

]]
keyboard = {} 
keyboard.inline_keyboard = {
{{text = '𝗦𝗼𝘂𝗿𝗰𝗲 𝗚𝗼𝗹𝗱 𝟮',url="https://t.me/AKJA0"},{text = '𝐓𝐞𝐚𝐦 𝐆𝐨𝐥𝐝',url="t.me/g_00_l_d"}},
{{text = 'رجوع 🔙', callback_data="/change-hhh"}},
}
return https.request("https://api.telegram.org/bot"..token..'/editMessagecaption?chat_id='..Chat_id..'&caption='..URL.escape(Teext)..'&message_id='..msg_idd..'&disable_web_page_preview=true&reply_markup='..JSON.encode(keyboard))  
end

if Text == '/HHH' then
local Teext =[[
𝗪𝗲𝗹𝗰𝗼𝗺𝗲 𝘁𝗼 𝗦𝗼𝘂𝗿𝗰𝗲 𝗚𝗼𝗹𝗱
]]
keyboard = {} 
keyboard.inline_keyboard = {
{{text = '𝗗𝗲𝘃 𝗦𝗼𝘂𝗿𝗰𝗲', callback_data="/units"},{text = '𝗧𝗲𝗮𝗺 𝗚𝗼𝗹𝗱', callback_data="/theytry"}},   
{{text = '𝗗𝗲𝘃 𝗕𝗼𝘁', url="http://t.me/"..sudos.UserName}},
{{text = 'اضغط لاضافه البوت لمجموعتك' ,url="t.me/"..dofile("./Info.lua").botUserName.."?startgroup=start"}}, 
}
return https.request("https://api.telegram.org/bot"..token..'/editMessagecaption?chat_id='..Chat_id..'&caption='..URL.escape(Teext)..'&message_id='..msg_idd..'&disable_web_page_preview=true&reply_markup='..JSON.encode(keyboard))  
end
if Text == '/theytry' then
local Teext =[[
𝗪𝗲𝗹𝗰𝗼𝗺𝗲 𝘁𝗼 𝗦𝗼𝘂𝗿𝗰𝗲 𝗚𝗼𝗹𝗱
]]
keyboard = {} 
keyboard.inline_keyboard = {
{{text = '𝗧𝗲𝗮𝗺 𝗚𝗼𝗹𝗱',url="t.me/g_00_l_d"},{text = '𝗦𝗼𝘂𝗿𝗰𝗲 𝗚𝗼𝗹𝗱 𝟮', url="https://t.me/AKJA0"}},
{{text = '𝗧𝗮𝘄𝗼𝘀𝗹',url="t.me/Hdudbdbot"}}, 
{{text = 'رجوع 🔙', callback_data="/HHH"}},
}
return https.request("https://api.telegram.org/bot"..token..'/editMessagecaption?chat_id='..Chat_id..'&caption='..URL.escape(Teext)..'&message_id='..msg_idd..'&disable_web_page_preview=true&reply_markup='..JSON.encode(keyboard))  
end
if Text == '/units' then
local Teext =[[
𝗪𝗲𝗹𝗰𝗼𝗺𝗲 𝘁𝗼 𝗦𝗼𝘂𝗿𝗰𝗲 𝗚𝗼𝗹𝗱
]]
keyboard = {} 
keyboard.inline_keyboard = {
{{text = '𝗔𝗵𝗺𝗲𝗱 𝗘𝗹𝗺𝗮𝘀𝗿𝘆',url="t.me/DEV_AH8"},{text = '𝗝𝗮𝘃𝗮 𝗘𝗹𝗵𝗮𝗸𝗲𝗿',url="t.me/JAI6H"}},
{{text = '𝗗𝗲𝘃 𝗔𝗯𝗱𝗼',url="t.me/DV_ABDO"}}, 
{{text = '𝗜𝘀𝗹𝗮𝗺',url="t.me/Amvggddghhgddsfhhfddhh"},{text = '𝗧𝗶𝗴𝗲𝗿',url="t.me/Dev_RE4"}},
{{text = 'رجوع 🔙', callback_data="/HHH"}},
}
return https.request("https://api.telegram.org/bot"..token..'/editMessagecaption?chat_id='..Chat_id..'&caption='..URL.escape(Teext)..'&message_id='..msg_idd..'&disable_web_page_preview=true&reply_markup='..JSON.encode(keyboard))  
end
if Text == '/zzor' then
local Teext =[[
برج الثور ( 20/4 - 20/5 )

الكوكب : الزهرة

أرقام الحظ : 11, 29, 29, 37, 56

الأحجار : الزمرد , الفيروز

البرج : ترابي

يتوافق مع :  برج العذراء   و برج الجدي -  برج السرطان - برج الحوت 

الأعمال الملائمة  : موظفي بنك- فنانين- محاسبين-موسيقيين- عمال

إيجابيات برج الثور : صبور- يمكن الاعتماد عليه- محب- من طبعه الإصرار والتصميم- هادئ ويحب الطمأنينة
 •━═━═━═「ɢᴏʟᴅ」═━═━═━•

]]
keyboard = {} 
keyboard.inline_keyboard = {
{
{text = 'رجوع 🔙', callback_data="/zDRGd"},
},
}
return https.request("https://api.telegram.org/bot"..token..'/editMessagecaption?chat_id='..Chat_id..'&caption='..URL.escape(Teext)..'&message_id='..msg_idd..'&disable_web_page_preview=true&reply_markup='..JSON.encode(keyboard))  
end
if Text == '/zguza' then
local Teext =[[
برج الجوزاء ( 21/5 - 20 /6 ) كوكب برج الجوزاء : عطارد أرقام الحظ  لبرج الجوزاء: 12-21-30-48-47 أحجار برج الجوزاء : العقيق نوع برج الجوزاء : هوائي يتوافق برج الجوزاء مع : برج الميزان - برج الحمل - برج الأسد - برج القوس الأعمال الملائمة لبرج الجوزاء : برامج حوارية - تجار - مك
إيجابيات  برج الجوزاء: ذكي - متقد الذهن - فصيح - لدية روح الشباب - متعدد المواهب - اجتماعي - متأقلم

سلبيات برج الجوزاء : متوتر - غير ثابت على حال - عصبي - ماكر- فضولي
 •━═━═━═「ɢᴏʟᴅ」═━═━═━•

]]
keyboard = {} 
keyboard.inline_keyboard = {
{
{text = 'رجوع 🔙', callback_data="/zDRGd"},
},
}
return https.request("https://api.telegram.org/bot"..token..'/editMessagecaption?chat_id='..Chat_id..'&caption='..URL.escape(Teext)..'&message_id='..msg_idd..'&disable_web_page_preview=true&reply_markup='..JSON.encode(keyboard))  
end

if Text == '/zdlu' then
local Teext =[[
برج الدلو ( 20/1 - 18/2 )

الكوكب : زحل

ارقام الحظ : 11- 29- 38-47- 56

الاحجار : الفيروز

البرج : هوائي

يتوافق مع : برج الجوزاء - برج الميزان -برج الحمل -برج الجوزاء

الاعمال الملائمة برج الدلو : مخترعين- سياسيين- كتاب- علماء- رواد فضاء- منجمين

ايجابيات برج الدلو  : ودود، إنساني، صادق، وفي وصاحب ولاء، مبدئي، مبتكر

سلبيات برج الدلو : مستقل وذكي. عنيد، يقف ضد الأمور، مشاكس، غير متوقع التصرفات، غير عاطفي وله استقلاليته.
 •━═━═━═「ɢᴏʟᴅ」═━═━═━•

]]
keyboard = {} 
keyboard.inline_keyboard = {
{
{text = 'رجوع 🔙', callback_data="/zDRGd"},
},
}
return https.request("https://api.telegram.org/bot"..token..'/editMessagecaption?chat_id='..Chat_id..'&caption='..URL.escape(Teext)..'&message_id='..msg_idd..'&disable_web_page_preview=true&reply_markup='..JSON.encode(keyboard))  
end


if Text == '/zhot' then
local Teext =[[
برج الحوت ( 19/2 - 20/3 )

الكوكب : المشتري ارقام الحظ : 12- 21- 39- 48- 57

الاحجار : حجر القمر

البرج : مائي

يتوافق مع : برج السرطان - برج العقرب -برج الثور

الاعمال الملائمة : أطباء بيطريين- علماء أحياء- فنانين- أطباء-موسيقيين- علماء نفس

ايجابيات برج الحوت : صاحب خيال، حساس، عاطفي، لطيف، غير أناني، لا تهمه الماديات، صاحب حدس وبديهة ويتعاطف مع الآخرين.

سلبيات برج الحوت  : مثالي و يتهرب من الواقع، كتوم للأسرار وغامض، إرادته ضعيفة وسهل الانقياد.
 •━═━═━═「ɢᴏʟᴅ」═━═━═━•

]]
keyboard = {} 
keyboard.inline_keyboard = {
{
{text = 'رجوع 🔙', callback_data="/zDRGd"},
},
}
return https.request("https://api.telegram.org/bot"..token..'/editMessagecaption?chat_id='..Chat_id..'&caption='..URL.escape(Teext)..'&message_id='..msg_idd..'&disable_web_page_preview=true&reply_markup='..JSON.encode(keyboard))  
end


if Text == '/zakrb' then
local Teext =[[
برج العقرب ( 24/10 - 21/11 )

الكوكب : المريخ

ارقام الحظ : 17- 26- 35- 44-53

الاحجار : الياقوت-العقيق

البرج : مائي

يتوافق مع : برج الحوت - برج السرطان - برج الثور

الاعمال الملائمة : أطباء- محققين- علماء بيئة- مهندسين- عملاء سريين.

ايجابيات برج العقرب: صاحب عزيمة- قوي- عاطفي- ذو حدس- ذو طاقة - مثير - شخصيته جذابة- كتوم للأسرار

سلبيات برج العقرب : كثير الرفض- يحب السيطرة - محب للتملك- غيور -عنيد.
 •━═━═━═「ɢᴏʟᴅ」═━═━═━•

]]
keyboard = {} 
keyboard.inline_keyboard = {
{
{text = 'رجوع 🔙', callback_data="/zDRGd"},
},
}
return https.request("https://api.telegram.org/bot"..token..'/editMessagecaption?chat_id='..Chat_id..'&caption='..URL.escape(Teext)..'&message_id='..msg_idd..'&disable_web_page_preview=true&reply_markup='..JSON.encode(keyboard))  
end

if Text == '/zkos' then
local Teext =[[
برج القوس ( 22/11 - 21/12)
الكوكب : المشتري

ارقام الحظ : 18-27- 36-45- 54

الاحجار : الفيروز

البرج : ناري

يتوافق مع : الحمل - الاسد-الجوزاء

الاعمال الملائمة : وكلاء سفر-مكتشفين-بروفيسورات- سفراء- تجار

ايجابيات : متفائل، محب للحرية، مرح، له روح مرحة جميلة، صادق، مستقيم، ذكي وصاحب فلسفة
سلبيات : متفائل بصورة عمياء، مهمل، غير مسؤول، سطحي، غير لبق، قلق
 •━═━═━═「ɢᴏʟᴅ」═━═━═━•

]]
keyboard = {} 
keyboard.inline_keyboard = {
{
{text = 'رجوع 🔙', callback_data="/zDRGd"},
},
}
return https.request("https://api.telegram.org/bot"..token..'/editMessagecaption?chat_id='..Chat_id..'&caption='..URL.escape(Teext)..'&message_id='..msg_idd..'&disable_web_page_preview=true&reply_markup='..JSON.encode(keyboard))  
end


if Text == '/zmezan' then
local Teext =[[
برج الميزان ( 23/9 - 23/10 )

الكوكب : الزهرة

ارقام الحظ : 6- 16- 25- 34- 43- 52

الاحجار : الماس

البرج : هوائي

يتوافق مع : برج الدلو - برج الجوزاء - برج القوس

الاعمال الملائمة : وظائف دبلوماسية- قضاة- مستشارين- أخصائيين نفسيين - فنانين

ايجابيات برج الميزان : دبلوماسي، مؤدب، رومانسي، ساحر، سهل النقياد، اجتماعي، صاحب مبادئ ومسالم

سلبيات برج الميزان : متردد، قابل للتغير، ساذج، يتأثر بسرعة، منطوي على نفسه.
 •━═━═━═「ɢᴏʟᴅ」═━═━═━•

]]
keyboard = {} 
keyboard.inline_keyboard = {
{
{text = 'رجوع 🔙', callback_data="/zDRGd"},
},
}
return https.request("https://api.telegram.org/bot"..token..'/editMessagecaption?chat_id='..Chat_id..'&caption='..URL.escape(Teext)..'&message_id='..msg_idd..'&disable_web_page_preview=true&reply_markup='..JSON.encode(keyboard))  
end



if Text == '/zazra' then
local Teext =[[
برج العذراء ( 23/8 - 22/9 )

الكوكب : عطارد

ارقام الحظ : 6- 15- 24- 33- 42- 51

الاحجار : العقيق

البرج : ارضي

يتوافق: مع   برج الجدي   ، برج الثور ،برج السرطان ، برج العقرب

الاعمال الملائمة : كيميائيين- أطباء-محققين- أخصائيي تغذية- أطباء بيطريين- مدراء- مقاولين
ايجابيات برج العذراء : متواضع، خجول، دقيق، يمكن الاعتماد عليه، عملي، مجتهد، ذكي ويميل إلى التحليل
سلبيات برج العذراء : سريع الانزعاج، كثير القلق، كثير الانتقاد، قاسي، يسعى نحو الكمالية ومحافظ
 •━═━═━═「ɢᴏʟᴅ」═━═━═━•

]]
keyboard = {} 
keyboard.inline_keyboard = {
{
{text = 'رجوع 🔙', callback_data="/zDRGd"},
},
}
return https.request("https://api.telegram.org/bot"..token..'/editMessagecaption?chat_id='..Chat_id..'&caption='..URL.escape(Teext)..'&message_id='..msg_idd..'&disable_web_page_preview=true&reply_markup='..JSON.encode(keyboard))  
end
if Text == '/zking' then
local Teext =[[
برج الأسد ( 23/6 - 22/8 )

الكوكب : الشمس

ارقام الحظ : 14- 13- 32-41- 50

الاحجار : الياقوت،العنبر

البرج : ناري

يتوافق مع : برج القوس - برج الحمل - برج الدلو

الاعمال الملائمة : مدراء، مهندسين معماريين، مخترعين، مدرسين، رياضيين ومدراء

ايجابيات برج الأسد : كريم، دافئ القلب، مبدع، حماسي، واسع العقل، وفي محب
 •━═━═━═「ɢᴏʟᴅ」═━═━═━•

]]
keyboard = {} 
keyboard.inline_keyboard = {
{
{text = 'رجوع 🔙', callback_data="/zDRGd"},
},
}
return https.request("https://api.telegram.org/bot"..token..'/editMessagecaption?chat_id='..Chat_id..'&caption='..URL.escape(Teext)..'&message_id='..msg_idd..'&disable_web_page_preview=true&reply_markup='..JSON.encode(keyboard))  
end

if Text == '/zsltan' then
local Teext =[[
برج السرطان ( 22/6 - 22/7 )

الكوكب : القمر

ارقام الحظ : 13- 22-31-40- 48- 57

الاحجار : اللؤلؤ،العنبر-الياقوت

البرج : مائي

يتوافق مع : برج العقرب ، برج الحوت ،برج الجدي ،برج الثور

الاعمال الملائمة : أطباء، صيادلة، مدرجولد، أخصائيو تغذية، شيف، سماسرة

ايجابيات برج السرطان : عاطفي، محب، صاحب حدس وبديهة، صاحب خيال واسع
 •━═━═━═「ɢᴏʟᴅ」═━═━═━•

]]
keyboard = {} 
keyboard.inline_keyboard = {
{
{text = 'رجوع 🔙', callback_data="/zDRGd"},
},
}
return https.request("https://api.telegram.org/bot"..token..'/editMessagecaption?chat_id='..Chat_id..'&caption='..URL.escape(Teext)..'&message_id='..msg_idd..'&disable_web_page_preview=true&reply_markup='..JSON.encode(keyboard))  
end
if Text == '/zBoody' then
local Teext =[[
برج الحمل :- ( 21/3 - 19/4 )

الكوكب : المريخ

أرقام الحظ : 10 ,19, 28, 37, 46, 55

الأحجار : الياقوت - الماس

البرج : نارى

يتوافق مع :برج الاسد -برج  القوس - برج الجوزاء -برج  الدلو

الأعمال الملائمة : رجل إطفاء ، طبيب ، ميكانيكي ، طبيب أسنان ، لاعب رياضي محترف أو رجل أعمال
سلبيات برج الحمل : أناني - سريع الغضب - متهور - عديم الصبر – الطيش
  مميّزات برج الحمل ١.١ الثقة العالية بالنّفس ١.٢ روح القيادة ١.٣ الطاقة الإيجابيّة ١.٤ الشجاعة ١.٥ الإبداع ١.٦ الطّموح ١.٧ حبّ المغامرة ١.٨ الإخلاص ١.٩ الاستقلاليّة ٢ عيوب برج الحمل ٢.١ الأنانيّة ٢.٢ حبّ لفت الانتباه ٢.٣ الغضب ٢.٤ احتكار الحديث ٢.٥ التسرّع
 •━═━═━═「ɢᴏʟᴅ」═━═━═━•
]]
keyboard = {} 
keyboard.inline_keyboard = {
{
{text = 'رجوع 🔙', callback_data="/zDRGd"},
},
}
return https.request("https://api.telegram.org/bot"..token..'/editMessagecaption?chat_id='..Chat_id..'&caption='..URL.escape(Teext)..'&message_id='..msg_idd..'&disable_web_page_preview=true&reply_markup='..JSON.encode(keyboard))  
end

if Text == '/zgagy' then
local Teext =[[
برج الجدي ( 22/12 - 19/1 )

الكوكب : زحل

ارقام الحظ: 10-28- 37-46- 55

الاحجار : العقيق اليماني

البرج : ترابي

يتوافق مع : برج الثور- برج العذراء

الاعمال الملائمة : مدراء عامين- مدراء-وزراء، -مهندسي كومبيوتر.

ايجابيات برج الجدي: عملي، عاقل- طموح- منظم- صبور- حذر- صاحب روح مرحة ومتحفظ

سلبيات برج الجدي : متشائم- متعلق بالأقدار- بائس- حاقد، متمسك بالتقاليد أكثر من اللازم وجامد.
 •━═━═━═「ɢᴏʟᴅ」═━═━═━•

]]
keyboard = {} 
keyboard.inline_keyboard = {
{
{text = 'رجوع 🔙', callback_data="/zDRGd"},
},
}
return https.request("https://api.telegram.org/bot"..token..'/editMessagecaption?chat_id='..Chat_id..'&caption='..URL.escape(Teext)..'&message_id='..msg_idd..'&disable_web_page_preview=true&reply_markup='..JSON.encode(keyboard))  
end
if Text == '/zporg' then
local Teext =[[
❣- برج الجدي: من 12/22 - الى 1/19•
❣- برج الدلو: من 1/20 - الى 2/18•
❣- برج الحوت: من 2/19 - الى 3/20•
❣- برج الحمل: من 3/21 - الى 4/19•
❣- برج الثور: من 4/20 - الى 5/20•
❣- برج الجوزاء: من 5/21 - الى 6/20•
❣- برج السرطان: من 6/21 - الى 7/21•
❣- برج الاسد: من 7/23 - الى 8/22•
❣- برج العذراء: من 8/23 - الى 9/22•
❣- برج الميزان: من 9/23 - الى 10/22•
❣- برج العقرب: من 10/23 - الى 11/21•
❣- برج القوس: من 11/22 - الى 12/21•
 •━═━═━═「ɢᴏʟᴅ」═━═━═━•
]]
keyboard = {} 
keyboard.inline_keyboard = {
{
{text = 'رجوع 🔙', callback_data="/zDRGd"},
},
}
return https.request("https://api.telegram.org/bot"..token..'/editMessagecaption?chat_id='..Chat_id..'&caption='..URL.escape(Teext)..'&message_id='..msg_idd..'&disable_web_page_preview=true&reply_markup='..JSON.encode(keyboard))  
end

if Text == '/lockwelcm' then
if not Mod(data) then
local notText = '✘ عذرا الاوامر هذه لا تخصك'
https.request("https://api.telegram.org/bot"..token.."/answerCallbackQuery?callback_query_id="..data.id_.."&text="..URL.escape(notText).."&show_alert=true")
return false
end
local Text = '• تم تفعيل الترحيب '
bot_data:set(ban_id.."Chek:Welcome"..Chat_id,true)  
keyboard = {} 
keyboard.inline_keyboard = {
{
{text = 'رجوع 🔙', callback_data="/help8"},
},
}
return https.request("https://api.telegram.org/bot"..token..'/editMessageText?chat_id='..Chat_id..'&text='..URL.escape(Text)..'&message_id='..msg_idd..'&parse_mode=markdown&disable_web_page_preview=true&reply_markup='..JSON.encode(keyboard))  
end
if Text == '/opawelcm' then
if not Mod(data) then
local notText = '✘ عذرا الاوامر هذه لا تخصك'
https.request("https://api.telegram.org/bot"..token.."/answerCallbackQuery?callback_query_id="..data.id_.."&text="..URL.escape(notText).."&show_alert=true")
return false
end
local Text = '• تم تعطيل الترحيب '
bot_data:del(ban_id.."Chek:Welcome"..Chat_id)  
keyboard = {} 
keyboard.inline_keyboard = {
{
{text = 'رجوع 🔙', callback_data="/help8"},
},
}
return https.request("https://api.telegram.org/bot"..token..'/editMessageText?chat_id='..Chat_id..'&text='..URL.escape(Text)..'&message_id='..msg_idd..'&parse_mode=markdown&disable_web_page_preview=true&reply_markup='..JSON.encode(keyboard))  
end
if Text == '/lockCickp' then
if not Mod(data) then
local notText = '✘ عذرا الاوامر هذه لا تخصك'
https.request("https://api.telegram.org/bot"..token.."/answerCallbackQuery?callback_query_id="..data.id_.."&text="..URL.escape(notText).."&show_alert=true")
return false
end
local Text = '• تم تفعيل التحقق '
bot_data:set(ban_id.."CAPTCHA"..Chat_id,true)  
keyboard = {} 
keyboard.inline_keyboard = {
{
{text = 'رجوع 🔙', callback_data="/help8"},
},
}
return https.request("https://api.telegram.org/bot"..token..'/editMessageText?chat_id='..Chat_id..'&text='..URL.escape(Text)..'&message_id='..msg_idd..'&parse_mode=markdown&disable_web_page_preview=true&reply_markup='..JSON.encode(keyboard))  
end
if Text == '/opCickp' then
if not Mod(data) then
local notText = '✘ عذرا الاوامر هذه لا تخصك'
https.request("https://api.telegram.org/bot"..token.."/answerCallbackQuery?callback_query_id="..data.id_.."&text="..URL.escape(notText).."&show_alert=true")
return false
end
local Text = '• تم تعطيل التحقق '
bot_data:del(ban_id.."CAPTCHA"..Chat_id)  
keyboard = {} 
keyboard.inline_keyboard = {
{
{text = 'رجوع 🔙', callback_data="/help8"},
},
}
return https.request("https://api.telegram.org/bot"..token..'/editMessageText?chat_id='..Chat_id..'&text='..URL.escape(Text)..'&message_id='..msg_idd..'&parse_mode=markdown&disable_web_page_preview=true&reply_markup='..JSON.encode(keyboard))  
end

if Text == '/lockreb' then
if not Mod(data) then
local notText = '✘ عذرا الاوامر هذه لا تخصك'
https.request("https://api.telegram.org/bot"..token.."/answerCallbackQuery?callback_query_id="..data.id_.."&text="..URL.escape(notText).."&show_alert=true")
return false
end
local Text = '• تم تفعيل ردود السورس '
bot_data:set(ban_id.."my_GHoeq2:status"..Chat_id,true)  
keyboard = {} 
keyboard.inline_keyboard = {
{
{text = 'رجوع 🔙', callback_data="/help8"},
},
}
return https.request("https://api.telegram.org/bot"..token..'/editMessageText?chat_id='..Chat_id..'&text='..URL.escape(Text)..'&message_id='..msg_idd..'&parse_mode=markdown&disable_web_page_preview=true&reply_markup='..JSON.encode(keyboard))  
end
if Text == '/opareb' then
if not Mod(data) then
local notText = '✘ عذرا الاوامر هذه لا تخصك'
https.request("https://api.telegram.org/bot"..token.."/answerCallbackQuery?callback_query_id="..data.id_.."&text="..URL.escape(notText).."&show_alert=true")
return false
end
local Text = '• تم تعطيل ردود السورس '
bot_data:del(ban_id.."my_GHoeq2:status"..Chat_id)  
keyboard = {} 
keyboard.inline_keyboard = {
{
{text = 'رجوع 🔙', callback_data="/help8"},
},
}
return https.request("https://api.telegram.org/bot"..token..'/editMessageText?chat_id='..Chat_id..'&text='..URL.escape(Text)..'&message_id='..msg_idd..'&parse_mode=markdown&disable_web_page_preview=true&reply_markup='..JSON.encode(keyboard))  
end
if Text == '/lockamr' then
if not Mod(data) then
local notText = '✘ عذرا الاوامر هذه لا تخصك'
https.request("https://api.telegram.org/bot"..token.."/answerCallbackQuery?callback_query_id="..data.id_.."&text="..URL.escape(notText).."&show_alert=true")
return false
end
local Text = '• تم تفعيل حساب العمر '
bot_data:set(ban_id.."DRG:age_Bots"..Chat_id,true)  
keyboard = {} 
keyboard.inline_keyboard = {
{
{text = 'رجوع 🔙', callback_data="/help8"},
},
}
return https.request("https://api.telegram.org/bot"..token..'/editMessageText?chat_id='..Chat_id..'&text='..URL.escape(Text)..'&message_id='..msg_idd..'&parse_mode=markdown&disable_web_page_preview=true&reply_markup='..JSON.encode(keyboard))  
end
if Text == '/opamar' then
if not Mod(data) then
local notText = '✘ عذرا الاوامر هذه لا تخصك'
https.request("https://api.telegram.org/bot"..token.."/answerCallbackQuery?callback_query_id="..data.id_.."&text="..URL.escape(notText).."&show_alert=true")
return false
end
local Text = '• تم تعطيل حساب العمر '
bot_data:del(ban_id.."DRG:age_Bots"..Chat_id)  
keyboard = {} 
keyboard.inline_keyboard = {
{
{text = 'رجوع 🔙', callback_data="/help8"},
},
}
return https.request("https://api.telegram.org/bot"..token..'/editMessageText?chat_id='..Chat_id..'&text='..URL.escape(Text)..'&message_id='..msg_idd..'&parse_mode=markdown&disable_web_page_preview=true&reply_markup='..JSON.encode(keyboard))  
end
if Text == '/lockgmale' then
if not Mod(data) then
local notText = '✘ عذرا الاوامر هذه لا تخصك'
https.request("https://api.telegram.org/bot"..token.."/answerCallbackQuery?callback_query_id="..data.id_.."&text="..URL.escape(notText).."&show_alert=true")
return false
end
local Text = '• تم تفعيل نسبه جمالي '
bot_data:set(ban_id.."pp_photo:status"..Chat_id,true)  
keyboard = {} 
keyboard.inline_keyboard = {
{
{text = 'رجوع 🔙', callback_data="/help8"},
},
}
return https.request("https://api.telegram.org/bot"..token..'/editMessageText?chat_id='..Chat_id..'&text='..URL.escape(Text)..'&message_id='..msg_idd..'&parse_mode=markdown&disable_web_page_preview=true&reply_markup='..JSON.encode(keyboard))  
end
if Text == '/opagmale' then
if not Mod(data) then
local notText = '✘ عذرا الاوامر هذه لا تخصك'
https.request("https://api.telegram.org/bot"..token.."/answerCallbackQuery?callback_query_id="..data.id_.."&text="..URL.escape(notText).."&show_alert=true")
return false
end
local Text = '• تم تعطيل نسبه جمالي '
bot_data:del(ban_id.."pp_photo:status"..Chat_id)  
keyboard = {} 
keyboard.inline_keyboard = {
{
{text = 'رجوع 🔙', callback_data="/help8"},
},
}
return https.request("https://api.telegram.org/bot"..token..'/editMessageText?chat_id='..Chat_id..'&text='..URL.escape(Text)..'&message_id='..msg_idd..'&parse_mode=markdown&disable_web_page_preview=true&reply_markup='..JSON.encode(keyboard))  
end
if Text == '/lockman' then
if not Mod(data) then
local notText = '✘ عذرا الاوامر هذه لا تخصك'
https.request("https://api.telegram.org/bot"..token.."/answerCallbackQuery?callback_query_id="..data.id_.."&text="..URL.escape(notText).."&show_alert=true")
return false
end
local Text = '• تم تفعيل نسبة الرجوله '
bot_data:set(ban_id.."Cick:rjo"..Chat_id,true)  
keyboard = {} 
keyboard.inline_keyboard = {
{
{text = 'رجوع 🔙', callback_data="/help8"},
},
}
return https.request("https://api.telegram.org/bot"..token..'/editMessageText?chat_id='..Chat_id..'&text='..URL.escape(Text)..'&message_id='..msg_idd..'&parse_mode=markdown&disable_web_page_preview=true&reply_markup='..JSON.encode(keyboard))  
end
if Text == '/opamanh' then
if not Mod(data) then
local notText = '✘ عذرا الاوامر هذه لا تخصك'
https.request("https://api.telegram.org/bot"..token.."/answerCallbackQuery?callback_query_id="..data.id_.."&text="..URL.escape(notText).."&show_alert=true")
return false
end
local Text = '• تم تعطيل نسبة الرجوله '
bot_data:del(ban_id.."Cick:rjo"..Chat_id)  
keyboard = {} 
keyboard.inline_keyboard = {
{
{text = 'رجوع 🔙', callback_data="/help8"},
},
}
return https.request("https://api.telegram.org/bot"..token..'/editMessageText?chat_id='..Chat_id..'&text='..URL.escape(Text)..'&message_id='..msg_idd..'&parse_mode=markdown&disable_web_page_preview=true&reply_markup='..JSON.encode(keyboard))  
end
if Text == '/locknsak' then
if not Mod(data) then
local notText = '✘ عذرا الاوامر هذه لا تخصك'
https.request("https://api.telegram.org/bot"..token.."/answerCallbackQuery?callback_query_id="..data.id_.."&text="..URL.escape(notText).."&show_alert=true")
return false
end
local Text = '• تم تفعيل  نسبة الحب '
bot_data:set(ban_id.."Cick:lov"..Chat_id,true)  
keyboard = {} 
keyboard.inline_keyboard = {
{
{text = 'رجوع 🔙', callback_data="/help8"},
},
}
return https.request("https://api.telegram.org/bot"..token..'/editMessageText?chat_id='..Chat_id..'&text='..URL.escape(Text)..'&message_id='..msg_idd..'&parse_mode=markdown&disable_web_page_preview=true&reply_markup='..JSON.encode(keyboard))  
end
if Text == '/opanams' then
if not Mod(data) then
local notText = '✘ عذرا الاوامر هذه لا تخصك'
https.request("https://api.telegram.org/bot"..token.."/answerCallbackQuery?callback_query_id="..data.id_.."&text="..URL.escape(notText).."&show_alert=true")
return false
end
local Text = '• تم تعطيل  نسبة الحب '
bot_data:del(ban_id.."Cick:lov"..Chat_id)  
keyboard = {} 
keyboard.inline_keyboard = {
{
{text = 'رجوع 🔙', callback_data="/help8"},
},
}
return https.request("https://api.telegram.org/bot"..token..'/editMessageText?chat_id='..Chat_id..'&text='..URL.escape(Text)..'&message_id='..msg_idd..'&parse_mode=markdown&disable_web_page_preview=true&reply_markup='..JSON.encode(keyboard))  
end
if Text == '/locknsamgk' then
if not Mod(data) then
local notText = '✘ عذرا الاوامر هذه لا تخصك'
https.request("https://api.telegram.org/bot"..token.."/answerCallbackQuery?callback_query_id="..data.id_.."&text="..URL.escape(notText).."&show_alert=true")
return false
end
local Text = '• تم تفعيل نسبه الانوثه '
bot_data:set(ban_id.."Cick:ano"..Chat_id,true)  
keyboard = {} 
keyboard.inline_keyboard = {
{
{text = 'رجوع 🔙', callback_data="/help8"},
},
}
return https.request("https://api.telegram.org/bot"..token..'/editMessageText?chat_id='..Chat_id..'&text='..URL.escape(Text)..'&message_id='..msg_idd..'&parse_mode=markdown&disable_web_page_preview=true&reply_markup='..JSON.encode(keyboard))  
end
if Text == '/opansamg' then
if not Mod(data) then
local notText = '✘ عذرا الاوامر هذه لا تخصك'
https.request("https://api.telegram.org/bot"..token.."/answerCallbackQuery?callback_query_id="..data.id_.."&text="..URL.escape(notText).."&show_alert=true")
return false
end
local Text = '• تم تعطيل نسبه الانوثه '
bot_data:del(ban_id.."Cick:ano"..Chat_id)  
keyboard = {} 
keyboard.inline_keyboard = {
{
{text = 'رجوع 🔙', callback_data="/help8"},
},
}
return https.request("https://api.telegram.org/bot"..token..'/editMessageText?chat_id='..Chat_id..'&text='..URL.escape(Text)..'&message_id='..msg_idd..'&parse_mode=markdown&disable_web_page_preview=true&reply_markup='..JSON.encode(keyboard))  
end
if Text == '/locnspm' then
if not Mod(data) then
local notText = '✘ عذرا الاوامر هذه لا تخصك'
https.request("https://api.telegram.org/bot"..token.."/answerCallbackQuery?callback_query_id="..data.id_.."&text="..URL.escape(notText).."&show_alert=true")
return false
end
local Text = '• تم تفعيل نسبه الكره '
bot_data:set(ban_id.."Cick:krh"..Chat_id,true)  
keyboard = {} 
keyboard.inline_keyboard = {
{
{text = 'رجوع 🔙', callback_data="/help8"},
},
}
return https.request("https://api.telegram.org/bot"..token..'/editMessageText?chat_id='..Chat_id..'&text='..URL.escape(Text)..'&message_id='..msg_idd..'&parse_mode=markdown&disable_web_page_preview=true&reply_markup='..JSON.encode(keyboard))  
end
if Text == '/opansamp' then
if not Mod(data) then
local notText = '✘ عذرا الاوامر هذه لا تخصك'
https.request("https://api.telegram.org/bot"..token.."/answerCallbackQuery?callback_query_id="..data.id_.."&text="..URL.escape(notText).."&show_alert=true")
return false
end
local Text = '• تم تعطيل نسبه الكره '
bot_data:del(ban_id.."Cick:krh"..Chat_id)  
keyboard = {} 
keyboard.inline_keyboard = {
{
{text = 'رجوع 🔙', callback_data="/help8"},
},
}
return https.request("https://api.telegram.org/bot"..token..'/editMessageText?chat_id='..Chat_id..'&text='..URL.escape(Text)..'&message_id='..msg_idd..'&parse_mode=markdown&disable_web_page_preview=true&reply_markup='..JSON.encode(keyboard))  
end
if Text == '/lockid' then
if not Mod(data) then
local notText = '✘ عذرا الاوامر هذه لا تخصك'
https.request("https://api.telegram.org/bot"..token.."/answerCallbackQuery?callback_query_id="..data.id_.."&text="..URL.escape(notText).."&show_alert=true")
return false
end
local Text = '• تم تفعيل الايدي '
bot_data:set(ban_id.."Bot:Id"..Chat_id,true)  
keyboard = {} 
keyboard.inline_keyboard = {
{
{text = 'رجوع 🔙', callback_data="/help8"},
},
}
return https.request("https://api.telegram.org/bot"..token..'/editMessageText?chat_id='..Chat_id..'&text='..URL.escape(Text)..'&message_id='..msg_idd..'&parse_mode=markdown&disable_web_page_preview=true&reply_markup='..JSON.encode(keyboard))  
end
if Text == '/opaid' then
if not Mod(data) then
local notText = '✘ عذرا الاوامر هذه لا تخصك'
https.request("https://api.telegram.org/bot"..token.."/answerCallbackQuery?callback_query_id="..data.id_.."&text="..URL.escape(notText).."&show_alert=true")
return false
end
local Text = '• تم تعطيل الايدي '
bot_data:del(ban_id.."Bot:Id"..Chat_id)  
keyboard = {} 
keyboard.inline_keyboard = {
{
{text = 'رجوع 🔙', callback_data="/help8"},
},
}
return https.request("https://api.telegram.org/bot"..token..'/editMessageText?chat_id='..Chat_id..'&text='..URL.escape(Text)..'&message_id='..msg_idd..'&parse_mode=markdown&disable_web_page_preview=true&reply_markup='..JSON.encode(keyboard))  
end

if Text == '/lockgams' then
if not Mod(data) then
local notText = '✘ عذرا الاوامر هذه لا تخصك'
https.request("https://api.telegram.org/bot"..token.."/answerCallbackQuery?callback_query_id="..data.id_.."&text="..URL.escape(notText).."&show_alert=true")
return false
end
local Text = '• تم تفعيل الالعاب '
bot_data:set(ban_id.."Lock:Games"..Chat_id,true)  
keyboard = {} 
keyboard.inline_keyboard = {
{
{text = 'رجوع 🔙', callback_data="/help8"},
},
}
return https.request("https://api.telegram.org/bot"..token..'/editMessageText?chat_id='..Chat_id..'&text='..URL.escape(Text)..'&message_id='..msg_idd..'&parse_mode=markdown&disable_web_page_preview=true&reply_markup='..JSON.encode(keyboard))  
end
if Text == '/opagams' then
if not Mod(data) then
local notText = '✘ عذرا الاوامر هذه لا تخصك'
https.request("https://api.telegram.org/bot"..token.."/answerCallbackQuery?callback_query_id="..data.id_.."&text="..URL.escape(notText).."&show_alert=true")
return false
end
local Text = '• تم تعطيل الالعاب '
bot_data:del(ban_id.."Lock:Games"..Chat_id)  
keyboard = {} 
keyboard.inline_keyboard = {
{
{text = 'رجوع 🔙', callback_data="/help8"},
},
}
return https.request("https://api.telegram.org/bot"..token..'/editMessageText?chat_id='..Chat_id..'&text='..URL.escape(Text)..'&message_id='..msg_idd..'&parse_mode=markdown&disable_web_page_preview=true&reply_markup='..JSON.encode(keyboard))  
end
if Text == '/lockbafne' then
if not Mod(data) then
local notText = '✘ عذرا الاوامر هذه لا تخصك'
https.request("https://api.telegram.org/bot"..token.."/answerCallbackQuery?callback_query_id="..data.id_.."&text="..URL.escape(notText).."&show_alert=true")
return false
end
local Text = '• تم تفعيل ضافني '
bot_data:set(ban_id.."Added:Me"..Chat_id,true)  
keyboard = {} 
keyboard.inline_keyboard = {
{
{text = 'رجوع 🔙', callback_data="/help8"},
},
}
return https.request("https://api.telegram.org/bot"..token..'/editMessageText?chat_id='..Chat_id..'&text='..URL.escape(Text)..'&message_id='..msg_idd..'&parse_mode=markdown&disable_web_page_preview=true&reply_markup='..JSON.encode(keyboard))  
end
if Text == '/opaDRGfe' then
if not Mod(data) then
local notText = '✘ عذرا الاوامر هذه لا تخصك'
https.request("https://api.telegram.org/bot"..token.."/answerCallbackQuery?callback_query_id="..data.id_.."&text="..URL.escape(notText).."&show_alert=true")
return false
end
local Text = '• تم تعطيل ضافني '
bot_data:del(ban_id.."Added:Me"..Chat_id)  
keyboard = {} 
keyboard.inline_keyboard = {
{
{text = 'رجوع 🔙', callback_data="/help8"},
},
}
return https.request("https://api.telegram.org/bot"..token..'/editMessageText?chat_id='..Chat_id..'&text='..URL.escape(Text)..'&message_id='..msg_idd..'&parse_mode=markdown&disable_web_page_preview=true&reply_markup='..JSON.encode(keyboard))  
end
if Text == '/lockanmen' then
if not Mod(data) then
local notText = '✘ عذرا الاوامر هذه لا تخصك'
https.request("https://api.telegram.org/bot"..token.."/answerCallbackQuery?callback_query_id="..data.id_.."&text="..URL.escape(notText).."&show_alert=true")
return false
end
local Text = '• تم تفعيل انا مين '
bot_data:set(ban_id.."my_anamen:status"..Chat_id,true)  
keyboard = {} 
keyboard.inline_keyboard = {
{
{text = 'رجوع 🔙', callback_data="/help8"},
},
}
return https.request("https://api.telegram.org/bot"..token..'/editMessageText?chat_id='..Chat_id..'&text='..URL.escape(Text)..'&message_id='..msg_idd..'&parse_mode=markdown&disable_web_page_preview=true&reply_markup='..JSON.encode(keyboard))  
end
if Text == '/oppganmen' then
if not Mod(data) then
local notText = '✘ عذرا الاوامر هذه لا تخصك'
https.request("https://api.telegram.org/bot"..token.."/answerCallbackQuery?callback_query_id="..data.id_.."&text="..URL.escape(notText).."&show_alert=true")
return false
end
local Text = '• تم تعطيل انا مين '
bot_data:del(ban_id.."my_anamen:status"..Chat_id)  
keyboard = {} 
keyboard.inline_keyboard = {
{
{text = 'رجوع 🔙', callback_data="/help8"},
},
}
return https.request("https://api.telegram.org/bot"..token..'/editMessageText?chat_id='..Chat_id..'&text='..URL.escape(Text)..'&message_id='..msg_idd..'&parse_mode=markdown&disable_web_page_preview=true&reply_markup='..JSON.encode(keyboard))  
end
if Text == '/Lokzal' then
if not Mod(data) then
local notText = '✘ عذرا الاوامر هذه لا تخصك'
https.request("https://api.telegram.org/bot"..token.."/answerCallbackQuery?callback_query_id="..data.id_.."&text="..URL.escape(notText).."&show_alert=true")
return false
end
local Text = '• تم تفعيل الزخرفه '
bot_data:set(ban_id.." ban:zhrf_Bots"..msg.chat_id_,"open")
keyboard = {} 
keyboard.inline_keyboard = {
{
{text = 'رجوع 🔙', callback_data="/help8"},
},
}
return https.request("https://api.telegram.org/bot"..token..'/editMessageText?chat_id='..Chat_id..'&text='..URL.escape(Text)..'&message_id='..msg_idd..'&parse_mode=markdown&disable_web_page_preview=true&reply_markup='..JSON.encode(keyboard))  
end
if Text == '/opeza' then
if not Mod(data) then
local notText = '✘ عذرا الاوامر هذه لا تخصك'
https.request("https://api.telegram.org/bot"..token.."/answerCallbackQuery?callback_query_id="..data.id_.."&text="..URL.escape(notText).."&show_alert=true")
return false
end
local Text = '• تم تعطيل الزخرفه '
bot_data:del(ban_id.." ban:zhrf_Bots"..Chat_id)  
keyboard = {} 
keyboard.inline_keyboard = {
{
{text = 'رجوع 🔙', callback_data="/help8"},
},
}
return https.request("https://api.telegram.org/bot"..token..'/editMessageText?chat_id='..Chat_id..'&text='..URL.escape(Text)..'&message_id='..msg_idd..'&parse_mode=markdown&disable_web_page_preview=true&reply_markup='..JSON.encode(keyboard))  
end
if Text == '/lookpohi' then
if not Mod(data) then
local notText = '✘ عذرا الاوامر هذه لا تخصك'
https.request("https://api.telegram.org/bot"..token.."/answerCallbackQuery?callback_query_id="..data.id_.."&text="..URL.escape(notText).."&show_alert=true")
return false
end
local Text = '• تم تفعيل صورتي '
bot_data:set(ban_id.."my_photo:status"..Chat_id,true)  
keyboard = {} 
keyboard.inline_keyboard = {
{
{text = 'رجوع 🔙', callback_data="/help8"},
},
}
return https.request("https://api.telegram.org/bot"..token..'/editMessageText?chat_id='..Chat_id..'&text='..URL.escape(Text)..'&message_id='..msg_idd..'&parse_mode=markdown&disable_web_page_preview=true&reply_markup='..JSON.encode(keyboard))  
end


if Text == '/opphotop' then
if not Mod(data) then
local notText = '✘ عذرا الاوامر هذه لا تخصك'
https.request("https://api.telegram.org/bot"..token.."/answerCallbackQuery?callback_query_id="..data.id_.."&text="..URL.escape(notText).."&show_alert=true")
return false
end
local Text = '• تم تعطيل صورتي '
bot_data:del(ban_id.."my_photo:status"..Chat_id)  
keyboard = {} 
keyboard.inline_keyboard = {
{
{text = 'رجوع 🔙', callback_data="/help8"},
},
}
return https.request("https://api.telegram.org/bot"..token..'/editMessageText?chat_id='..Chat_id..'&text='..URL.escape(Text)..'&message_id='..msg_idd..'&parse_mode=markdown&disable_web_page_preview=true&reply_markup='..JSON.encode(keyboard))  
end



if Text == '/Loumarem' then
if not Mod(data) then
local notText = '✘ عذرا الاوامر هذه لا تخصك'
https.request("https://api.telegram.org/bot"..token.."/answerCallbackQuery?callback_query_id="..data.id_.."&text="..URL.escape(notText).."&show_alert=true")
return false
end
local Text = '• تم تفعيل مريم '
bot_data:set(ban_id.."my_maryam:status"..Chat_id,true)  
keyboard = {} 
keyboard.inline_keyboard = {
{
{text = 'رجوع 🔙', callback_data="/help8"},
},
}
return https.request("https://api.telegram.org/bot"..token..'/editMessageText?chat_id='..Chat_id..'&text='..URL.escape(Text)..'&message_id='..msg_idd..'&parse_mode=markdown&disable_web_page_preview=true&reply_markup='..JSON.encode(keyboard))  
end
if Text == '/thomarem' then
if not Mod(data) then
local notText = '✘ عذرا الاوامر هذه لا تخصك'
https.request("https://api.telegram.org/bot"..token.."/answerCallbackQuery?callback_query_id="..data.id_.."&text="..URL.escape(notText).."&show_alert=true")
return false
end
local Text = '• تم تعطيل مريم '
bot_data:del(ban_id.."my_maryam:status"..Chat_id)  
keyboard = {} 
keyboard.inline_keyboard = {
{
{text = 'رجوع 🔙', callback_data="/help8"},
},
}
return https.request("https://api.telegram.org/bot"..token..'/editMessageText?chat_id='..Chat_id..'&text='..URL.escape(Text)..'&message_id='..msg_idd..'&parse_mode=markdown&disable_web_page_preview=true&reply_markup='..JSON.encode(keyboard))  
end
if Text == '/locklinka' then
if not Mod(data) then
local notText = '✘ عذرا الاوامر هذه لا تخصك'
https.request("https://api.telegram.org/bot"..token.."/answerCallbackQuery?callback_query_id="..data.id_.."&text="..URL.escape(notText).."&show_alert=true")
return false
end
local Text = '• تم تفعيل الرابط '
bot_data:set(ban_id.."Link_Group:status"..Chat_id,true)  
keyboard = {} 
keyboard.inline_keyboard = {
{
{text = 'رجوع 🔙', callback_data="/help8"},
},
}
return https.request("https://api.telegram.org/bot"..token..'/editMessageText?chat_id='..Chat_id..'&text='..URL.escape(Text)..'&message_id='..msg_idd..'&parse_mode=markdown&disable_web_page_preview=true&reply_markup='..JSON.encode(keyboard))  
end
if Text == '/opalinka' then
if not Mod(data) then
local notText = '✘ عذرا الاوامر هذه لا تخصك'
https.request("https://api.telegram.org/bot"..token.."/answerCallbackQuery?callback_query_id="..data.id_.."&text="..URL.escape(notText).."&show_alert=true")
return false
end
local Text = '• تم تعطيل الرابط '
bot_data:del(ban_id.."Link_Group:status"..Chat_id)  
keyboard = {} 
keyboard.inline_keyboard = {
{
{text = 'رجوع 🔙', callback_data="/help8"},
},
}
return https.request("https://api.telegram.org/bot"..token..'/editMessageText?chat_id='..Chat_id..'&text='..URL.escape(Text)..'&message_id='..msg_idd..'&parse_mode=markdown&disable_web_page_preview=true&reply_markup='..JSON.encode(keyboard))  
end
if Text == '/lockCick' then
if not Mod(data) then
local notText = '✘ عذرا الاوامر هذه لا تخصك'
https.request("https://api.telegram.org/bot"..token.."/answerCallbackQuery?callback_query_id="..data.id_.."&text="..URL.escape(notText).."&show_alert=true")
return false
end
local Text = '• تم تعطيل اطردني '
bot_data:set(ban_id.."Cick:Me"..Chat_id,true)  
keyboard = {} 
keyboard.inline_keyboard = {
{
{text = 'رجوع 🔙', callback_data="/help8"},
},
}
return https.request("https://api.telegram.org/bot"..token..'/editMessageText?chat_id='..Chat_id..'&text='..URL.escape(Text)..'&message_id='..msg_idd..'&parse_mode=markdown&disable_web_page_preview=true&reply_markup='..JSON.encode(keyboard))  
end
if Text == '/opCick' then
if not Mod(data) then
local notText = '✘ عذرا الاوامر هذه لا تخصك'
https.request("https://api.telegram.org/bot"..token.."/answerCallbackQuery?callback_query_id="..data.id_.."&text="..URL.escape(notText).."&show_alert=true")
return false
end
local Text = '• تم تفعيل اطردني '
bot_data:del(ban_id.."Cick:Me"..Chat_id)  
keyboard = {} 
keyboard.inline_keyboard = {
{
{text = 'رجوع 🔙', callback_data="/help8"},
},
}
return https.request("https://api.telegram.org/bot"..token..'/editMessageText?chat_id='..Chat_id..'&text='..URL.escape(Text)..'&message_id='..msg_idd..'&parse_mode=markdown&disable_web_page_preview=true&reply_markup='..JSON.encode(keyboard))  
end

if Text == '/lockdul' then
if not Mod(data) then
local notText = '✘ عذرا الاوامر هذه لا تخصك'
https.request("https://api.telegram.org/bot"..token.."/answerCallbackQuery?callback_query_id="..data.id_.."&text="..URL.escape(notText).."&show_alert=true")
return false
end
local Text = '• تم قفل الاباحي '
bot_data:set(ban_id.."lock:Lock:Sexy"..msg.chat_id_,'del')  
keyboard = {} 
keyboard.inline_keyboard = {
{
{text = 'رجوع 🔙', callback_data="/help8"},
},
}
return https.request("https://api.telegram.org/bot"..token..'/editMessageText?chat_id='..Chat_id..'&text='..URL.escape(Text)..'&message_id='..msg_idd..'&parse_mode=markdown&disable_web_page_preview=true&reply_markup='..JSON.encode(keyboard))  
end
if Text == '/oppor' then
if not Mod(data) then
local notText = '✘ عذرا الاوامر هذه لا تخصك'
https.request("https://api.telegram.org/bot"..token.."/answerCallbackQuery?callback_query_id="..data.id_.."&text="..URL.escape(notText).."&show_alert=true")
return false
end
local Text = '• تم فتح الاباحي '
bot_data:del(ban_id.."lock:Lock:Sexy"..msg.chat_id_)  
keyboard = {} 
keyboard.inline_keyboard = {
{
{text = 'رجوع 🔙', callback_data="/help8"},
},
}
return https.request("https://api.telegram.org/bot"..token..'/editMessageText?chat_id='..Chat_id..'&text='..URL.escape(Text)..'&message_id='..msg_idd..'&parse_mode=markdown&disable_web_page_preview=true&reply_markup='..JSON.encode(keyboard))  
end
if Text == '/Louis' then
if not Mod(data) then
local notText = '✘ عذرا الاوامر هذه لا تخصك'
https.request("https://api.telegram.org/bot"..token.."/answerCallbackQuery?callback_query_id="..data.id_.."&text="..URL.escape(notText).."&show_alert=true")
return false
end
local Text = '• تم قفل السب '
bot_data:set(ban_id.."lock:Fshar"..msg.chat_id_,'del')  
keyboard = {} 
keyboard.inline_keyboard = {
{
{text = 'رجوع 🔙', callback_data="/help8"},
},
}
return https.request("https://api.telegram.org/bot"..token..'/editMessageText?chat_id='..Chat_id..'&text='..URL.escape(Text)..'&message_id='..msg_idd..'&parse_mode=markdown&disable_web_page_preview=true&reply_markup='..JSON.encode(keyboard))  
end
if Text == '/tho' then
if not Mod(data) then
local notText = '✘ عذرا الاوامر هذه لا تخصك'
https.request("https://api.telegram.org/bot"..token.."/answerCallbackQuery?callback_query_id="..data.id_.."&text="..URL.escape(notText).."&show_alert=true")
return false
end
local Text = '• تم فتح السب '
bot_data:del(ban_id.."lock:Fshar"..msg.chat_id_)  
keyboard = {} 
keyboard.inline_keyboard = {
{
{text = 'رجوع 🔙', callback_data="/help8"},
},
}
return https.request("https://api.telegram.org/bot"..token..'/editMessageText?chat_id='..Chat_id..'&text='..URL.escape(Text)..'&message_id='..msg_idd..'&parse_mode=markdown&disable_web_page_preview=true&reply_markup='..JSON.encode(keyboard))  
end
if Text == '/ayq79' then
if not Mod(data) then
local notText = '✘ عذرا الاوامر هذه لا تخصك'
https.request("https://api.telegram.org/bot"..token.."/answerCallbackQuery?callback_query_id="..data.id_.."&text="..URL.escape(notText).."&show_alert=true")
return false
end
local Text = '• تم قفل الازعاج '
bot_data:set(ban_id.."lock:Azag"..msg.chat_id_,'del')  
keyboard = {} 
keyboard.inline_keyboard = {
{
{text = 'رجوع 🔙', callback_data="/help8"},
},
}
return https.request("https://api.telegram.org/bot"..token..'/editMessageText?chat_id='..Chat_id..'&text='..URL.escape(Text)..'&message_id='..msg_idd..'&parse_mode=markdown&disable_web_page_preview=true&reply_markup='..JSON.encode(keyboard))  
end
if Text == '/Andrew' then
if not Mod(data) then
local notText = '✘ عذرا الاوامر هذه لا تخصك'
https.request("https://api.telegram.org/bot"..token.."/answerCallbackQuery?callback_query_id="..data.id_.."&text="..URL.escape(notText).."&show_alert=true")
return false
end
local Text = '• تم فتح الازعاج '
bot_data:del(ban_id.."lock:Azag"..msg.chat_id_)  
keyboard = {} 
keyboard.inline_keyboard = {
{
{text = 'رجوع 🔙', callback_data="/help8"},
},
}
return https.request("https://api.telegram.org/bot"..token..'/editMessageText?chat_id='..Chat_id..'&text='..URL.escape(Text)..'&message_id='..msg_idd..'&parse_mode=markdown&disable_web_page_preview=true&reply_markup='..JSON.encode(keyboard))  
end
if Text == '/Gogh' then
if not Mod(data) then
local notText = '✘ عذرا الاوامر هذه لا تخصك'
https.request("https://api.telegram.org/bot"..token.."/answerCallbackQuery?callback_query_id="..data.id_.."&text="..URL.escape(notText).."&show_alert=true")
return false
end
local Text = '• تم قفل المحن '
bot_data:set(ban_id.."lock:mahn"..msg.chat_id_,'del')  
keyboard = {} 
keyboard.inline_keyboard = {
{
{text = 'رجوع 🔙', callback_data="/help8"},
},
}
return https.request("https://api.telegram.org/bot"..token..'/editMessageText?chat_id='..Chat_id..'&text='..URL.escape(Text)..'&message_id='..msg_idd..'&parse_mode=markdown&disable_web_page_preview=true&reply_markup='..JSON.encode(keyboard))  
end
if Text == '/Omni' then
if not Mod(data) then
local notText = '✘ عذرا الاوامر هذه لا تخصك'
https.request("https://api.telegram.org/bot"..token.."/answerCallbackQuery?callback_query_id="..data.id_.."&text="..URL.escape(notText).."&show_alert=true")
return false
end
local Text = '• تم فتح المحن '
bot_data:del(ban_id.."lock:mahn"..msg.chat_id_)  
keyboard = {} 
keyboard.inline_keyboard = {
{
{text = 'رجوع 🔙', callback_data="/help8"},
},
}
return https.request("https://api.telegram.org/bot"..token..'/editMessageText?chat_id='..Chat_id..'&text='..URL.escape(Text)..'&message_id='..msg_idd..'&parse_mode=markdown&disable_web_page_preview=true&reply_markup='..JSON.encode(keyboard))  
end
if Text == '/Lokll' then
if not Mod(data) then
local notText = '✘ عذرا الاوامر هذه لا تخصك'
https.request("https://api.telegram.org/bot"..token.."/answerCallbackQuery?callback_query_id="..data.id_.."&text="..URL.escape(notText).."&show_alert=true")
return false
end
local Text = '• تم قفل الدردشه '
bot_data:set(ban_id.."lock:text"..msg.chat_id_,'del')  
keyboard = {} 
keyboard.inline_keyboard = {
{
{text = 'رجوع 🔙', callback_data="/help8"},
},
}
return https.request("https://api.telegram.org/bot"..token..'/editMessageText?chat_id='..Chat_id..'&text='..URL.escape(Text)..'&message_id='..msg_idd..'&parse_mode=markdown&disable_web_page_preview=true&reply_markup='..JSON.encode(keyboard))  
end
if Text == '/openqg' then
if not Mod(data) then
local notText = '✘ عذرا الاوامر هذه لا تخصك'
https.request("https://api.telegram.org/bot"..token.."/answerCallbackQuery?callback_query_id="..data.id_.."&text="..URL.escape(notText).."&show_alert=true")
return false
end
local Text = '• تم فتح الدردشه '
bot_data:del(ban_id.."lock:text"..msg.chat_id_)  
keyboard = {} 
keyboard.inline_keyboard = {
{
{text = 'رجوع 🔙', callback_data="/help8"},
},
}
return https.request("https://api.telegram.org/bot"..token..'/editMessageText?chat_id='..Chat_id..'&text='..URL.escape(Text)..'&message_id='..msg_idd..'&parse_mode=markdown&disable_web_page_preview=true&reply_markup='..JSON.encode(keyboard))  
end
if Text == '/lockgwg' then
if not Mod(data) then
local notText = '✘ عذرا الاوامر هذه لا تخصك'
https.request("https://api.telegram.org/bot"..token.."/answerCallbackQuery?callback_query_id="..data.id_.."&text="..URL.escape(notText).."&show_alert=true")
return false
end
local Text = '• تم قفل الاضافه '
bot_data:set(ban_id.."lock:AddMempar"..msg.chat_id_,'del')  
keyboard = {} 
keyboard.inline_keyboard = {
{
{text = 'رجوع 🔙', callback_data="/help8"},
},
}
return https.request("https://api.telegram.org/bot"..token..'/editMessageText?chat_id='..Chat_id..'&text='..URL.escape(Text)..'&message_id='..msg_idd..'&parse_mode=markdown&disable_web_page_preview=true&reply_markup='..JSON.encode(keyboard))  
end
if Text == '/opengwg' then
if not Mod(data) then
local notText = '✘ عذرا الاوامر هذه لا تخصك'
https.request("https://api.telegram.org/bot"..token.."/answerCallbackQuery?callback_query_id="..data.id_.."&text="..URL.escape(notText).."&show_alert=true")
return false
end
local Text = '• تم فتح الاضافه '
bot_data:del(ban_id.."lock:AddMempar"..msg.chat_id_)  
keyboard = {} 
keyboard.inline_keyboard = {
{
{text = 'رجوع 🔙', callback_data="/help8"},
},
}
return https.request("https://api.telegram.org/bot"..token..'/editMessageText?chat_id='..Chat_id..'&text='..URL.escape(Text)..'&message_id='..msg_idd..'&parse_mode=markdown&disable_web_page_preview=true&reply_markup='..JSON.encode(keyboard))  
end
if Text == '/lockaghv' then
if not Mod(data) then
local notText = '✘ عذرا الاوامر هذه لا تخصك'
https.request("https://api.telegram.org/bot"..token.."/answerCallbackQuery?callback_query_id="..data.id_.."&text="..URL.escape(notText).."&show_alert=true")
return false
end
local Text = '• تم قفل الدخول '
bot_data:set(ban_id.."lock:Join"..msg.chat_id_,'del')  
keyboard = {} 
keyboard.inline_keyboard = {
{
{text = 'رجوع 🔙', callback_data="/help8"},
},
}
return https.request("https://api.telegram.org/bot"..token..'/editMessageText?chat_id='..Chat_id..'&text='..URL.escape(Text)..'&message_id='..msg_idd..'&parse_mode=markdown&disable_web_page_preview=true&reply_markup='..JSON.encode(keyboard))  
end
if Text == '/oppgagf' then
if not Mod(data) then
local notText = '✘ عذرا الاوامر هذه لا تخصك'
https.request("https://api.telegram.org/bot"..token.."/answerCallbackQuery?callback_query_id="..data.id_.."&text="..URL.escape(notText).."&show_alert=true")
return false
end
local Text = '• تم فتح الدخول '
bot_data:del(ban_id.."lock:Join"..msg.chat_id_)  
keyboard = {} 
keyboard.inline_keyboard = {
{
{text = 'رجوع 🔙', callback_data="/help8"},
},
}
return https.request("https://api.telegram.org/bot"..token..'/editMessageText?chat_id='..Chat_id..'&text='..URL.escape(Text)..'&message_id='..msg_idd..'&parse_mode=markdown&disable_web_page_preview=true&reply_markup='..JSON.encode(keyboard))  
end
if Text == '/lockbot' then
if not Mod(data) then
local notText = '✘ عذرا الاوامر هذه لا تخصك'
https.request("https://api.telegram.org/bot"..token.."/answerCallbackQuery?callback_query_id="..data.id_.."&text="..URL.escape(notText).."&show_alert=true")
return false
end
local Text = '• تم قفل البوتات '
bot_data:set(ban_id.."lock:Bot:kick"..msg.chat_id_,'del')  
keyboard = {} 
keyboard.inline_keyboard = {
{
{text = 'رجوع 🔙', callback_data="/help8"},
},
}
return https.request("https://api.telegram.org/bot"..token..'/editMessageText?chat_id='..Chat_id..'&text='..URL.escape(Text)..'&message_id='..msg_idd..'&parse_mode=markdown&disable_web_page_preview=true&reply_markup='..JSON.encode(keyboard))  
end
if Text == '/opabot' then
if not Mod(data) then
local notText = '✘ عذرا الاوامر هذه لا تخصك'
https.request("https://api.telegram.org/bot"..token.."/answerCallbackQuery?callback_query_id="..data.id_.."&text="..URL.escape(notText).."&show_alert=true")
return false
end
local Text = '• تم فتح البوتات '
bot_data:del(ban_id.."lock:Bot:kick"..msg.chat_id_)  
keyboard = {} 
keyboard.inline_keyboard = {
{
{text = 'رجوع 🔙', callback_data="/help8"},
},
}
return https.request("https://api.telegram.org/bot"..token..'/editMessageText?chat_id='..Chat_id..'&text='..URL.escape(Text)..'&message_id='..msg_idd..'&parse_mode=markdown&disable_web_page_preview=true&reply_markup='..JSON.encode(keyboard))  
end
if Text == '/lockash' then
if not Mod(data) then
local notText = '✘ عذرا الاوامر هذه لا تخصك'
https.request("https://api.telegram.org/bot"..token.."/answerCallbackQuery?callback_query_id="..data.id_.."&text="..URL.escape(notText).."&show_alert=true")
return false
end
local Text = '• تم قفل الاشعارات '
bot_data:set(ban_id.."lock:tagservr"..msg.chat_id_,'del')  
keyboard = {} 
keyboard.inline_keyboard = {
{
{text = 'رجوع 🔙', callback_data="/help8"},
},
}
return https.request("https://api.telegram.org/bot"..token..'/editMessageText?chat_id='..Chat_id..'&text='..URL.escape(Text)..'&message_id='..msg_idd..'&parse_mode=markdown&disable_web_page_preview=true&reply_markup='..JSON.encode(keyboard))  
end
if Text == '/opaash' then
if not Mod(data) then
local notText = '✘ عذرا الاوامر هذه لا تخصك'
https.request("https://api.telegram.org/bot"..token.."/answerCallbackQuery?callback_query_id="..data.id_.."&text="..URL.escape(notText).."&show_alert=true")
return false
end
local Text = '• تم فتح الاشعارات '
bot_data:del(ban_id.."lock:tagservr"..msg.chat_id_)  
keyboard = {} 
keyboard.inline_keyboard = {
{
{text = 'رجوع 🔙', callback_data="/help8"},
},
}
return https.request("https://api.telegram.org/bot"..token..'/editMessageText?chat_id='..Chat_id..'&text='..URL.escape(Text)..'&message_id='..msg_idd..'&parse_mode=markdown&disable_web_page_preview=true&reply_markup='..JSON.encode(keyboard))  
end
if Text == '/locklink' then
if not Mod(data) then
local notText = '✘ عذرا الاوامر هذه لا تخصك'
https.request("https://api.telegram.org/bot"..token.."/answerCallbackQuery?callback_query_id="..data.id_.."&text="..URL.escape(notText).."&show_alert=true")
return false
end
local Text = '• تم قفل الروابط '
bot_data:set(ban_id.."lock:Link"..msg.chat_id_,'del')  
keyboard = {} 
keyboard.inline_keyboard = {
{
{text = 'رجوع 🔙', callback_data="/help8"},
},
}
return https.request("https://api.telegram.org/bot"..token..'/editMessageText?chat_id='..Chat_id..'&text='..URL.escape(Text)..'&message_id='..msg_idd..'&parse_mode=markdown&disable_web_page_preview=true&reply_markup='..JSON.encode(keyboard))  
end
if Text == '/opalink' then
if not Mod(data) then
local notText = '✘ عذرا الاوامر هذه لا تخصك'
https.request("https://api.telegram.org/bot"..token.."/answerCallbackQuery?callback_query_id="..data.id_.."&text="..URL.escape(notText).."&show_alert=true")
return false
end
local Text = '• تم فتح الروابط '
bot_data:del(ban_id.."lock:Link"..msg.chat_id_)  
keyboard = {} 
keyboard.inline_keyboard = {
{
{text = 'رجوع 🔙', callback_data="/help8"},
},
}
return https.request("https://api.telegram.org/bot"..token..'/editMessageText?chat_id='..Chat_id..'&text='..URL.escape(Text)..'&message_id='..msg_idd..'&parse_mode=markdown&disable_web_page_preview=true&reply_markup='..JSON.encode(keyboard))  
end
if Text == '/lockpin' then
if not Mod(data) then
local notText = '✘ عذرا الاوامر هذه لا تخصك'
https.request("https://api.telegram.org/bot"..token.."/answerCallbackQuery?callback_query_id="..data.id_.."&text="..URL.escape(notText).."&show_alert=true")
return false
end
local Text = '• تم قفل التثبيت '
bot_data:set(ban_id.."lockpin"..msg.chat_id_,'del')  
keyboard = {} 
keyboard.inline_keyboard = {
{
{text = 'رجوع 🔙', callback_data="/help8"},
},
}
return https.request("https://api.telegram.org/bot"..token..'/editMessageText?chat_id='..Chat_id..'&text='..URL.escape(Text)..'&message_id='..msg_idd..'&parse_mode=markdown&disable_web_page_preview=true&reply_markup='..JSON.encode(keyboard))  
end
if Text == '/opapin' then
if not Mod(data) then
local notText = '✘ عذرا الاوامر هذه لا تخصك'
https.request("https://api.telegram.org/bot"..token.."/answerCallbackQuery?callback_query_id="..data.id_.."&text="..URL.escape(notText).."&show_alert=true")
return false
end
local Text = '• تم فتح التثبيت '
bot_data:del(ban_id.."lockpin"..msg.chat_id_)  
keyboard = {} 
keyboard.inline_keyboard = {
{
{text = 'رجوع 🔙', callback_data="/help8"},
},
}
return https.request("https://api.telegram.org/bot"..token..'/editMessageText?chat_id='..Chat_id..'&text='..URL.escape(Text)..'&message_id='..msg_idd..'&parse_mode=markdown&disable_web_page_preview=true&reply_markup='..JSON.encode(keyboard))  
end
if Text == '/lockedit' then
if not Mod(data) then
local notText = '✘ عذرا الاوامر هذه لا تخصك'
https.request("https://api.telegram.org/bot"..token.."/answerCallbackQuery?callback_query_id="..data.id_.."&text="..URL.escape(notText).."&show_alert=true")
return false
end
local Text = '• تم قفل التعديل '
bot_data:set(ban_id.."lock:edit"..msg.chat_id_,'del')  
keyboard = {} 
keyboard.inline_keyboard = {
{
{text = 'رجوع 🔙', callback_data="/help8"},
},
}
return https.request("https://api.telegram.org/bot"..token..'/editMessageText?chat_id='..Chat_id..'&text='..URL.escape(Text)..'&message_id='..msg_idd..'&parse_mode=markdown&disable_web_page_preview=true&reply_markup='..JSON.encode(keyboard))  
end
if Text == '/opaedit' then
if not Mod(data) then
local notText = '✘ عذرا الاوامر هذه لا تخصك'
https.request("https://api.telegram.org/bot"..token.."/answerCallbackQuery?callback_query_id="..data.id_.."&text="..URL.escape(notText).."&show_alert=true")
return false
end
local Text = '• تم فتح التعديل '
bot_data:del(ban_id.."lock:edit"..msg.chat_id_)  
keyboard = {} 
keyboard.inline_keyboard = {
{
{text = 'رجوع 🔙', callback_data="/help8"},
},
}
return https.request("https://api.telegram.org/bot"..token..'/editMessageText?chat_id='..Chat_id..'&text='..URL.escape(Text)..'&message_id='..msg_idd..'&parse_mode=markdown&disable_web_page_preview=true&reply_markup='..JSON.encode(keyboard))  
end
if Text == '/lockFars' then
if not Mod(data) then
local notText = '✘ عذرا الاوامر هذه لا تخصك'
https.request("https://api.telegram.org/bot"..token.."/answerCallbackQuery?callback_query_id="..data.id_.."&text="..URL.escape(notText).."&show_alert=true")
return false
end
local Text = '• تم قفل الفارسيه '
bot_data:set(ban_id.."lock:Fars"..msg.chat_id_,'del')  
keyboard = {} 
keyboard.inline_keyboard = {
{
{text = 'رجوع 🔙', callback_data="/help8"},
},
}
return https.request("https://api.telegram.org/bot"..token..'/editMessageText?chat_id='..Chat_id..'&text='..URL.escape(Text)..'&message_id='..msg_idd..'&parse_mode=markdown&disable_web_page_preview=true&reply_markup='..JSON.encode(keyboard))  
end
if Text == '/opaFars' then
if not Mod(data) then
local notText = '✘ عذرا الاوامر هذه لا تخصك'
https.request("https://api.telegram.org/bot"..token.."/answerCallbackQuery?callback_query_id="..data.id_.."&text="..URL.escape(notText).."&show_alert=true")
return false
end
local Text = '• تم فتح الفارسيه '
bot_data:del(ban_id.."lock:Fars"..msg.chat_id_)  
keyboard = {} 
keyboard.inline_keyboard = {
{
{text = 'رجوع 🔙', callback_data="/help8"},
},
}
return https.request("https://api.telegram.org/bot"..token..'/editMessageText?chat_id='..Chat_id..'&text='..URL.escape(Text)..'&message_id='..msg_idd..'&parse_mode=markdown&disable_web_page_preview=true&reply_markup='..JSON.encode(keyboard))  
end
if Text == '/lockEngilsh' then
if not Mod(data) then
local notText = '✘ عذرا الاوامر هذه لا تخصك'
https.request("https://api.telegram.org/bot"..token.."/answerCallbackQuery?callback_query_id="..data.id_.."&text="..URL.escape(notText).."&show_alert=true")
return false
end
local Text = '• تم قفل الانكليزيه '
bot_data:set(ban_id.."lock:Engilsh"..msg.chat_id_,'del')  
keyboard = {} 
keyboard.inline_keyboard = {
{
{text = 'رجوع 🔙', callback_data="/help8"},
},
}
return https.request("https://api.telegram.org/bot"..token..'/editMessageText?chat_id='..Chat_id..'&text='..URL.escape(Text)..'&message_id='..msg_idd..'&parse_mode=markdown&disable_web_page_preview=true&reply_markup='..JSON.encode(keyboard))  
end
if Text == '/opaEngilsh' then
if not Mod(data) then
local notText = '✘ عذرا الاوامر هذه لا تخصك'
https.request("https://api.telegram.org/bot"..token.."/answerCallbackQuery?callback_query_id="..data.id_.."&text="..URL.escape(notText).."&show_alert=true")
return false
end
local Text = '• تم فتح الانكليزيه '
bot_data:del(ban_id.."lock:Engilsh"..msg.chat_id_)  
keyboard = {} 
keyboard.inline_keyboard = {
{
{text = 'رجوع 🔙', callback_data="/help8"},
},
}
return https.request("https://api.telegram.org/bot"..token..'/editMessageText?chat_id='..Chat_id..'&text='..URL.escape(Text)..'&message_id='..msg_idd..'&parse_mode=markdown&disable_web_page_preview=true&reply_markup='..JSON.encode(keyboard))  
end
if Text == '/lockinline' then
if not Mod(data) then
local notText = '✘ عذرا الاوامر هذه لا تخصك'
https.request("https://api.telegram.org/bot"..token.."/answerCallbackQuery?callback_query_id="..data.id_.."&text="..URL.escape(notText).."&show_alert=true")
return false
end
local Text = '• تم قفل الانلاين '
bot_data:set(ban_id.."lock:inline"..msg.chat_id_,'del')  
keyboard = {} 
keyboard.inline_keyboard = {
{
{text = 'رجوع 🔙', callback_data="/help8"},
},
}
return https.request("https://api.telegram.org/bot"..token..'/editMessageText?chat_id='..Chat_id..'&text='..URL.escape(Text)..'&message_id='..msg_idd..'&parse_mode=markdown&disable_web_page_preview=true&reply_markup='..JSON.encode(keyboard))  
end
if Text == '/opainline' then
if not Mod(data) then
local notText = '✘ عذرا الاوامر هذه لا تخصك'
https.request("https://api.telegram.org/bot"..token.."/answerCallbackQuery?callback_query_id="..data.id_.."&text="..URL.escape(notText).."&show_alert=true")
return false
end
local Text = '• تم فتح الانلاين '
bot_data:del(ban_id.."lock:inline"..msg.chat_id_)  
keyboard = {} 
keyboard.inline_keyboard = {
{
{text = 'رجوع 🔙', callback_data="/help8"},
},
}
return https.request("https://api.telegram.org/bot"..token..'/editMessageText?chat_id='..Chat_id..'&text='..URL.escape(Text)..'&message_id='..msg_idd..'&parse_mode=markdown&disable_web_page_preview=true&reply_markup='..JSON.encode(keyboard))  
end
if Text == '/lockeditmed' then
if not Mod(data) then
local notText = '✘ عذرا الاوامر هذه لا تخصك'
https.request("https://api.telegram.org/bot"..token.."/answerCallbackQuery?callback_query_id="..data.id_.."&text="..URL.escape(notText).."&show_alert=true")
return false
end
local Text = '• تم قفل تعديل الميديا '
bot_data:set(ban_id.."lock_edit_med"..msg.chat_id_,'del')  
keyboard = {} 
keyboard.inline_keyboard = {
{
{text = 'رجوع 🔙', callback_data="/help8"},
},
}
return https.request("https://api.telegram.org/bot"..token..'/editMessageText?chat_id='..Chat_id..'&text='..URL.escape(Text)..'&message_id='..msg_idd..'&parse_mode=markdown&disable_web_page_preview=true&reply_markup='..JSON.encode(keyboard))  
end
if Text == '/opaeditmed' then
if not Mod(data) then
local notText = '✘ عذرا الاوامر هذه لا تخصك'
https.request("https://api.telegram.org/bot"..token.."/answerCallbackQuery?callback_query_id="..data.id_.."&text="..URL.escape(notText).."&show_alert=true")
return false
end
local Text = '• تم فتح تعديل الميديا '
bot_data:del(ban_id.."lock_edit_med"..msg.chat_id_)  
keyboard = {} 
keyboard.inline_keyboard = {
{
{text = 'رجوع 🔙', callback_data="/help8"},
},
}
return https.request("https://api.telegram.org/bot"..token..'/editMessageText?chat_id='..Chat_id..'&text='..URL.escape(Text)..'&message_id='..msg_idd..'&parse_mode=markdown&disable_web_page_preview=true&reply_markup='..JSON.encode(keyboard))  
end




if Text and Text:match('amr@(%d+)/user@(%d+)/setiinginfo') then
local users = {string.match(Text,"^amr@(%d+)/user@(%d+)/setiinginfo$")}
if tonumber(users[1]) == tonumber(data.sender_user_id_) then
sendin(Chat_id,msg_idd,data.sender_user_id_,users[2])
end
end
if Text and Text:match('amr@(%d+)/user@(%d+)/voicetrue') then
local users = {string.match(Text,"^amr@(%d+)/user@(%d+)/voicetrue$")}
if tonumber(users[1]) == tonumber(data.sender_user_id_) then
local Chek_Info = https.request('https://api.telegram.org/bot'..token..'/getChatMember?chat_id='.. data.chat_id_ ..'&user_id='.. users[2])
local Json_Info = JSON.decode(Chek_Info)
if Json_Info.result.can_change_info == true then
infoo = '&can_change_info=True' 
else 
infoo = '&can_change_info=false' 
end
if Json_Info.result.can_delete_messages == true then
deletee = '&can_delete_messages=True' 
else 
deletee = '&can_delete_messages=false' 
end
if Json_Info.result.can_invite_users == true then
invitee = '&can_invite_users=True' 
else 
invitee = '&can_invite_users=false' 
end
if Json_Info.result.can_pin_messages == true then
pinn = '&can_pin_messages=True' 
else 
pinn = '&can_pin_messages=false' 
end
if Json_Info.result.can_restrict_members == true then
restrictt = '&can_restrict_members=True' 
else 
restrictt = '&can_restrict_members=false' 
end
if Json_Info.result.can_promote_members == true then
promotee = '&can_promote_members=true' 
else 
promotee = '&can_promote_members=false' 
end 
if Json_Info.can_manage_voice_chats == true then
voice = '&can_manage_voice_chats=True' 
else 
voice = '&can_manage_voice_chats=false' 
end
if Json_Info.can_manage_chat == true then
manage = '&can_manage_chat=True' 
else 
manage = '&can_manage_chat=false' 
end
local ListGruoup = '&can_manage_voice_chats=True'..manage..infoo..deletee..invitee..restrictt..pinn..promotee
https.request("https://api.telegram.org/bot"..token.."/promoteChatMember?chat_id="..data.chat_id_ .."&user_id="..users[2]..ListGruoup)
sendin(Chat_id,msg_idd,data.sender_user_id_,users[2])
end
end
if Text and Text:match('amr@(%d+)/user@(%d+)/voicefalse') then
local users = {string.match(Text,"^amr@(%d+)/user@(%d+)/voicefalse$")}
if tonumber(users[1]) == tonumber(data.sender_user_id_) then
local Chek_Info = https.request('https://api.telegram.org/bot'..token..'/getChatMember?chat_id='.. data.chat_id_ ..'&user_id='.. users[2])
local Json_Info = JSON.decode(Chek_Info)
if Json_Info.result.can_change_info == true then
infoo = '&can_change_info=True' 
else 
infoo = '&can_change_info=false' 
end
if Json_Info.result.can_delete_messages == true then
deletee = '&can_delete_messages=True' 
else 
deletee = '&can_delete_messages=false' 
end
if Json_Info.result.can_invite_users == true then
invitee = '&can_invite_users=True' 
else 
invitee = '&can_invite_users=false' 
end
if Json_Info.result.can_pin_messages == true then
pinn = '&can_pin_messages=True' 
else 
pinn = '&can_pin_messages=false' 
end
if Json_Info.result.can_restrict_members == true then
restrictt = '&can_restrict_members=True' 
else 
restrictt = '&can_restrict_members=false' 
end
if Json_Info.result.can_promote_members == true then
promotee = '&can_promote_members=true' 
else 
promotee = '&can_promote_members=false' 
end 
if Json_Info.can_manage_voice_chats == true then
voice = '&can_manage_voice_chats=True' 
else 
voice = '&can_manage_voice_chats=false' 
end
if Json_Info.can_manage_chat == true then
manage = '&can_manage_chat=True' 
else 
manage = '&can_manage_chat=false' 
end
local ListGruoup = '&can_manage_voice_chats=false'..manage..infoo..deletee..invitee..restrictt..pinn..promotee
https.request("https://api.telegram.org/bot"..token.."/promoteChatMember?chat_id="..data.chat_id_ .."&user_id="..users[2]..ListGruoup)
sendin(Chat_id,msg_idd,data.sender_user_id_,users[2])
end
end
if Text and Text:match('amr@(%d+)/user@(%d+)/managetrue') then
local users = {string.match(Text,"^amr@(%d+)/user@(%d+)/managetrue$")}
if tonumber(users[1]) == tonumber(data.sender_user_id_) then
local Chek_Info = https.request('https://api.telegram.org/bot'..token..'/getChatMember?chat_id='.. data.chat_id_ ..'&user_id='.. users[2])
local Json_Info = JSON.decode(Chek_Info)
if Json_Info.result.can_change_info == true then
infoo = '&can_change_info=True' 
else 
infoo = '&can_change_info=false' 
end
if Json_Info.result.can_delete_messages == true then
deletee = '&can_delete_messages=True' 
else 
deletee = '&can_delete_messages=false' 
end
if Json_Info.result.can_invite_users == true then
invitee = '&can_invite_users=True' 
else 
invitee = '&can_invite_users=false' 
end
if Json_Info.result.can_pin_messages == true then
pinn = '&can_pin_messages=True' 
else 
pinn = '&can_pin_messages=false' 
end
if Json_Info.result.can_restrict_members == true then
restrictt = '&can_restrict_members=True' 
else 
restrictt = '&can_restrict_members=false' 
end
if Json_Info.result.can_promote_members == true then
promotee = '&can_promote_members=true' 
else 
promotee = '&can_promote_members=false' 
end 
if Json_Info.can_manage_voice_chats == true then
voice = '&can_manage_voice_chats=True' 
else 
voice = '&can_manage_voice_chats=false' 
end
if Json_Info.can_manage_chat == true then
manage = '&can_manage_chat=True' 
else 
manage = '&can_manage_chat=false' 
end
local ListGruoup = voice..'&can_manage_chat=True'..infoo..deletee..invitee..restrictt..pinn..promotee
https.request("https://api.telegram.org/bot"..token.."/promoteChatMember?chat_id="..data.chat_id_ .."&user_id="..users[2]..ListGruoup)
sendin(Chat_id,msg_idd,data.sender_user_id_,users[2])
end
end
if Text and Text:match('amr@(%d+)/user@(%d+)/managefalse') then
local users = {string.match(Text,"^amr@(%d+)/user@(%d+)/managefalse$")}
if tonumber(users[1]) == tonumber(data.sender_user_id_) then
local Chek_Info = https.request('https://api.telegram.org/bot'..token..'/getChatMember?chat_id='.. data.chat_id_ ..'&user_id='.. users[2])
local Json_Info = JSON.decode(Chek_Info)
if Json_Info.result.can_change_info == true then
infoo = '&can_change_info=True' 
else 
infoo = '&can_change_info=false' 
end
if Json_Info.result.can_delete_messages == true then
deletee = '&can_delete_messages=True' 
else 
deletee = '&can_delete_messages=false' 
end
if Json_Info.result.can_invite_users == true then
invitee = '&can_invite_users=True' 
else 
invitee = '&can_invite_users=false' 
end
if Json_Info.result.can_pin_messages == true then
pinn = '&can_pin_messages=True' 
else 
pinn = '&can_pin_messages=false' 
end
if Json_Info.result.can_restrict_members == true then
restrictt = '&can_restrict_members=True' 
else 
restrictt = '&can_restrict_members=false' 
end
if Json_Info.result.can_promote_members == true then
promotee = '&can_promote_members=true' 
else 
promotee = '&can_promote_members=false' 
end 
if Json_Info.can_manage_voice_chats == true then
voice = '&can_manage_voice_chats=True' 
else 
voice = '&can_manage_voice_chats=false' 
end
if Json_Info.can_manage_chat == true then
manage = '&can_manage_chat=True' 
else 
manage = '&can_manage_chat=false' 
end
local ListGruoup = voice..'&can_manage_chat=false'..infoo..deletee..invitee..restrictt..pinn..promotee
https.request("https://api.telegram.org/bot"..token.."/promoteChatMember?chat_id="..data.chat_id_ .."&user_id="..users[2]..ListGruoup)
sendin(Chat_id,msg_idd,data.sender_user_id_,users[2])
end
end
if Text and Text:match('amr@(%d+)/user@(%d+)/addadmintrue') then
local users = {string.match(Text,"^amr@(%d+)/user@(%d+)/addadmintrue$")}
if tonumber(users[1]) == tonumber(data.sender_user_id_) then
local Chek_Info = https.request('https://api.telegram.org/bot'..token..'/getChatMember?chat_id='.. data.chat_id_ ..'&user_id='.. users[2])
local Json_Info = JSON.decode(Chek_Info)
if Json_Info.result.can_change_info == true then
infoo = '&can_change_info=True' 
else 
infoo = '&can_change_info=false' 
end
if Json_Info.result.can_delete_messages == true then
deletee = '&can_delete_messages=True' 
else 
deletee = '&can_delete_messages=false' 
end
if Json_Info.result.can_invite_users == true then
invitee = '&can_invite_users=True' 
else 
invitee = '&can_invite_users=false' 
end
if Json_Info.result.can_pin_messages == true then
pinn = '&can_pin_messages=True' 
else 
pinn = '&can_pin_messages=false' 
end
if Json_Info.result.can_restrict_members == true then
restrictt = '&can_restrict_members=True' 
else 
restrictt = '&can_restrict_members=false' 
end
if Json_Info.result.can_promote_members == true then
promotee = '&can_promote_members=true' 
else 
promotee = '&can_promote_members=false' 
end 
if Json_Info.can_manage_voice_chats == true then
voice = '&can_manage_voice_chats=True' 
else 
voice = '&can_manage_voice_chats=false' 
end
if Json_Info.can_manage_chat == true then
manage = '&can_manage_chat=True' 
else 
manage = '&can_manage_chat=false' 
end
local ListGruoup = voice..manage..infoo..deletee..invitee..restrictt..pinn..'&can_promote_members=true' 
https.request("https://api.telegram.org/bot"..token.."/promoteChatMember?chat_id="..data.chat_id_ .."&user_id="..users[2]..ListGruoup)
sendin(Chat_id,msg_idd,data.sender_user_id_,users[2])
end
end
if Text and Text:match('amr@(%d+)/user@(%d+)/chenginfotrue') then
local users = {string.match(Text,"^amr@(%d+)/user@(%d+)/chenginfotrue$")}
if tonumber(users[1]) == tonumber(data.sender_user_id_) then
local Chek_Info = https.request('https://api.telegram.org/bot'..token..'/getChatMember?chat_id='.. data.chat_id_ ..'&user_id='.. users[2])
local Json_Info = JSON.decode(Chek_Info)
if Json_Info.result.can_change_info == true then
infoo = '&can_change_info=True' 
else 
infoo = '&can_change_info=false' 
end
if Json_Info.result.can_delete_messages == true then
deletee = '&can_delete_messages=True' 
else 
deletee = '&can_delete_messages=false' 
end
if Json_Info.result.can_invite_users == true then
invitee = '&can_invite_users=True' 
else 
invitee = '&can_invite_users=false' 
end
if Json_Info.result.can_pin_messages == true then
pinn = '&can_pin_messages=True' 
else 
pinn = '&can_pin_messages=false' 
end
if Json_Info.result.can_restrict_members == true then
restrictt = '&can_restrict_members=True' 
else 
restrictt = '&can_restrict_members=false' 
end
if Json_Info.result.can_promote_members == true then
promotee = '&can_promote_members=true' 
else 
promotee = '&can_promote_members=false' 
end 
if Json_Info.can_manage_voice_chats == true then
voice = '&can_manage_voice_chats=True' 
else 
voice = '&can_manage_voice_chats=false' 
end
if Json_Info.can_manage_chat == true then
manage = '&can_manage_chat=True' 
else 
manage = '&can_manage_chat=false' 
end
local ListGruoup = voice..manage..'&can_change_info=True' ..deletee..invitee..restrictt..pinn..promotee
https.request("https://api.telegram.org/bot"..token.."/promoteChatMember?chat_id="..data.chat_id_ .."&user_id="..users[2]..ListGruoup)
sendin(Chat_id,msg_idd,data.sender_user_id_,users[2])
end
end
if Text and Text:match('amr@(%d+)/user@(%d+)/delmsggtrue') then
local users = {string.match(Text,"^amr@(%d+)/user@(%d+)/delmsggtrue$")}
if tonumber(users[1]) == tonumber(data.sender_user_id_) then
local Chek_Info = https.request('https://api.telegram.org/bot'..token..'/getChatMember?chat_id='.. data.chat_id_ ..'&user_id='.. users[2])
local Json_Info = JSON.decode(Chek_Info)
if Json_Info.result.can_change_info == true then
infoo = '&can_change_info=True' 
else 
infoo = '&can_change_info=false' 
end
if Json_Info.result.can_delete_messages == true then
deletee = '&can_delete_messages=True' 
else 
deletee = '&can_delete_messages=false' 
end
if Json_Info.result.can_invite_users == true then
invitee = '&can_invite_users=True' 
else 
invitee = '&can_invite_users=false' 
end
if Json_Info.result.can_pin_messages == true then
pinn = '&can_pin_messages=True' 
else 
pinn = '&can_pin_messages=false' 
end
if Json_Info.result.can_restrict_members == true then
restrictt = '&can_restrict_members=True' 
else 
restrictt = '&can_restrict_members=false' 
end
if Json_Info.result.can_promote_members == true then
promotee = '&can_promote_members=true' 
else 
promotee = '&can_promote_members=false' 
end 
if Json_Info.can_manage_voice_chats == true then
voice = '&can_manage_voice_chats=True' 
else 
voice = '&can_manage_voice_chats=false' 
end
if Json_Info.can_manage_chat == true then
manage = '&can_manage_chat=True' 
else 
manage = '&can_manage_chat=false' 
end
local ListGruoup = voice..manage.. infoo..'&can_delete_messages=True' ..invitee..restrictt..pinn..promotee
https.request("https://api.telegram.org/bot"..token.."/promoteChatMember?chat_id="..data.chat_id_ .."&user_id="..users[2]..ListGruoup)
sendin(Chat_id,msg_idd,data.sender_user_id_,users[2])
end
end
if Text and Text:match('amr@(%d+)/user@(%d+)/banusertrue') then
local users = {string.match(Text,"^amr@(%d+)/user@(%d+)/banusertrue$")}
if tonumber(users[1]) == tonumber(data.sender_user_id_) then
local Chek_Info = https.request('https://api.telegram.org/bot'..token..'/getChatMember?chat_id='.. data.chat_id_ ..'&user_id='.. users[2])
local Json_Info = JSON.decode(Chek_Info)
if Json_Info.result.can_change_info == true then
infoo = '&can_change_info=True' 
else 
infoo = '&can_change_info=false' 
end
if Json_Info.result.can_delete_messages == true then
deletee = '&can_delete_messages=True' 
else 
deletee = '&can_delete_messages=false' 
end
if Json_Info.result.can_invite_users == true then
invitee = '&can_invite_users=True' 
else 
invitee = '&can_invite_users=false' 
end
if Json_Info.result.can_pin_messages == true then
pinn = '&can_pin_messages=True' 
else 
pinn = '&can_pin_messages=false' 
end
if Json_Info.result.can_restrict_members == true then
restrictt = '&can_restrict_members=True' 
else 
restrictt = '&can_restrict_members=false' 
end
if Json_Info.result.can_promote_members == true then
promotee = '&can_promote_members=true' 
else 
promotee = '&can_promote_members=false' 
end 
if Json_Info.can_manage_voice_chats == true then
voice = '&can_manage_voice_chats=True' 
else 
voice = '&can_manage_voice_chats=false' 
end
if Json_Info.can_manage_chat == true then
manage = '&can_manage_chat=True' 
else 
manage = '&can_manage_chat=false' 
end
local ListGruoup = voice..manage.. infoo..deletee..invitee..'&can_restrict_members=True' ..pinn..promotee
https.request("https://api.telegram.org/bot"..token.."/promoteChatMember?chat_id="..data.chat_id_ .."&user_id="..users[2]..ListGruoup)
sendin(Chat_id,msg_idd,data.sender_user_id_,users[2])
end
end
if Text and Text:match('amr@(%d+)/user@(%d+)/pinmsgtrue') then
local users = {string.match(Text,"^amr@(%d+)/user@(%d+)/pinmsgtrue$")}
if tonumber(users[1]) == tonumber(data.sender_user_id_) then
local Chek_Info = https.request('https://api.telegram.org/bot'..token..'/getChatMember?chat_id='.. data.chat_id_ ..'&user_id='.. users[2])
local Json_Info = JSON.decode(Chek_Info)
if Json_Info.result.can_change_info == true then
infoo = '&can_change_info=True' 
else 
infoo = '&can_change_info=false' 
end
if Json_Info.result.can_delete_messages == true then
deletee = '&can_delete_messages=True' 
else 
deletee = '&can_delete_messages=false' 
end
if Json_Info.result.can_invite_users == true then
invitee = '&can_invite_users=True' 
else 
invitee = '&can_invite_users=false' 
end
if Json_Info.result.can_pin_messages == true then
pinn = '&can_pin_messages=True' 
else 
pinn = '&can_pin_messages=false' 
end
if Json_Info.result.can_restrict_members == true then
restrictt = '&can_restrict_members=True' 
else 
restrictt = '&can_restrict_members=false' 
end
if Json_Info.result.can_promote_members == true then
promotee = '&can_promote_members=true' 
else 
promotee = '&can_promote_members=false' 
end 
if Json_Info.can_manage_voice_chats == true then
voice = '&can_manage_voice_chats=True' 
else 
voice = '&can_manage_voice_chats=false' 
end
if Json_Info.can_manage_chat == true then
manage = '&can_manage_chat=True' 
else 
manage = '&can_manage_chat=false' 
end
local ListGruoup = voice..manage.. infoo..deletee..invitee..restrictt..'&can_pin_messages=True' ..promotee
https.request("https://api.telegram.org/bot"..token.."/promoteChatMember?chat_id="..data.chat_id_ .."&user_id="..users[2]..ListGruoup)
sendin(Chat_id,msg_idd,data.sender_user_id_,users[2])
end
end
if Text and Text:match('amr@(%d+)/user@(%d+)/addlinktrue') then
local users = {string.match(Text,"^amr@(%d+)/user@(%d+)/addlinktrue$")}
if tonumber(users[1]) == tonumber(data.sender_user_id_) then
local Chek_Info = https.request('https://api.telegram.org/bot'..token..'/getChatMember?chat_id='.. data.chat_id_ ..'&user_id='.. users[2])
local Json_Info = JSON.decode(Chek_Info)
if Json_Info.result.can_change_info == true then
infoo = '&can_change_info=True' 
else 
infoo = '&can_change_info=false' 
end
if Json_Info.result.can_delete_messages == true then
deletee = '&can_delete_messages=True' 
else 
deletee = '&can_delete_messages=false' 
end
if Json_Info.result.can_invite_users == true then
invitee = '&can_invite_users=True' 
else 
invitee = '&can_invite_users=false' 
end
if Json_Info.result.can_pin_messages == true then
pinn = '&can_pin_messages=True' 
else 
pinn = '&can_pin_messages=false' 
end
if Json_Info.result.can_restrict_members == true then
restrictt = '&can_restrict_members=True' 
else 
restrictt = '&can_restrict_members=false' 
end
if Json_Info.result.can_promote_members == true then
promotee = '&can_promote_members=true' 
else 
promotee = '&can_promote_members=false' 
end 
if Json_Info.can_manage_voice_chats == true then
voice = '&can_manage_voice_chats=True' 
else 
voice = '&can_manage_voice_chats=false' 
end
if Json_Info.can_manage_chat == true then
manage = '&can_manage_chat=True' 
else 
manage = '&can_manage_chat=false' 
end
local ListGruoup = voice..manage.. infoo..deletee..'&can_invite_users=True' ..restrictt..pinn..promotee
https.request("https://api.telegram.org/bot"..token.."/promoteChatMember?chat_id="..data.chat_id_ .."&user_id="..users[2]..ListGruoup)
sendin(Chat_id,msg_idd,data.sender_user_id_,users[2])
end
end


if Text and Text:match('amr@(%d+)/user@(%d+)/addadminfalse') then
local users = {string.match(Text,"^amr@(%d+)/user@(%d+)/addadminfalse$")}
if tonumber(users[1]) == tonumber(data.sender_user_id_) then
local Chek_Info = https.request('https://api.telegram.org/bot'..token..'/getChatMember?chat_id='.. data.chat_id_ ..'&user_id='.. users[2])
local Json_Info = JSON.decode(Chek_Info)
if Json_Info.result.can_change_info == true then
infoo = '&can_change_info=True' 
else 
infoo = '&can_change_info=false' 
end
if Json_Info.result.can_delete_messages == true then
deletee = '&can_delete_messages=True' 
else 
deletee = '&can_delete_messages=false' 
end
if Json_Info.result.can_invite_users == true then
invitee = '&can_invite_users=True' 
else 
invitee = '&can_invite_users=false' 
end
if Json_Info.result.can_pin_messages == true then
pinn = '&can_pin_messages=True' 
else 
pinn = '&can_pin_messages=false' 
end
if Json_Info.result.can_restrict_members == true then
restrictt = '&can_restrict_members=True' 
else 
restrictt = '&can_restrict_members=false' 
end
if Json_Info.result.can_promote_members == true then
promotee = '&can_promote_members=true' 
else 
promotee = '&can_promote_members=false' 
end 
if Json_Info.can_manage_voice_chats == true then
voice = '&can_manage_voice_chats=True' 
else 
voice = '&can_manage_voice_chats=false' 
end
if Json_Info.can_manage_chat == true then
manage = '&can_manage_chat=True' 
else 
manage = '&can_manage_chat=false' 
end
if manage then
local ListGruoup = voice..manage.. infoo..deletee..invitee..restrictt..pinn..'&can_promote_members=false'
https.request("https://api.telegram.org/bot"..token.."/promoteChatMember?chat_id="..data.chat_id_ .."&user_id="..users[2]..ListGruoup)
end
sendin(Chat_id,msg_idd,data.sender_user_id_,users[2])
end
end
if Text and Text:match('amr@(%d+)/user@(%d+)/chenginfofalse') then
local users = {string.match(Text,"^amr@(%d+)/user@(%d+)/chenginfofalse$")}
if tonumber(users[1]) == tonumber(data.sender_user_id_) then
local Chek_Info = https.request('https://api.telegram.org/bot'..token..'/getChatMember?chat_id='.. data.chat_id_ ..'&user_id='.. users[2])
local Json_Info = JSON.decode(Chek_Info)
if Json_Info.result.can_change_info == true then
infoo = '&can_change_info=True' 
else 
infoo = '&can_change_info=false' 
end
if Json_Info.result.can_delete_messages == true then
deletee = '&can_delete_messages=True' 
else 
deletee = '&can_delete_messages=false' 
end
if Json_Info.result.can_invite_users == true then
invitee = '&can_invite_users=True' 
else 
invitee = '&can_invite_users=false' 
end
if Json_Info.result.can_pin_messages == true then
pinn = '&can_pin_messages=True' 
else 
pinn = '&can_pin_messages=false' 
end
if Json_Info.result.can_restrict_members == true then
restrictt = '&can_restrict_members=True' 
else 
restrictt = '&can_restrict_members=false' 
end
if Json_Info.result.can_promote_members == true then
promotee = '&can_promote_members=true' 
else 
promotee = '&can_promote_members=false' 
end 
if Json_Info.can_manage_voice_chats == true then
voice = '&can_manage_voice_chats=True' 
else 
voice = '&can_manage_voice_chats=false' 
end
if Json_Info.can_manage_chat == true then
manage = '&can_manage_chat=True' 
else 
manage = '&can_manage_chat=false' 
end
local ListGruoup = voice..manage.. '&can_change_info=false' ..deletee..invitee..restrictt..pinn..promotee
https.request("https://api.telegram.org/bot"..token.."/promoteChatMember?chat_id="..data.chat_id_ .."&user_id="..users[2]..ListGruoup)
sendin(Chat_id,msg_idd,data.sender_user_id_,users[2])
end
end
if Text and Text:match('amr@(%d+)/user@(%d+)/delmsggfalse') then
local users = {string.match(Text,"^amr@(%d+)/user@(%d+)/delmsggfalse$")}
if tonumber(users[1]) == tonumber(data.sender_user_id_) then
local Chek_Info = https.request('https://api.telegram.org/bot'..token..'/getChatMember?chat_id='.. data.chat_id_ ..'&user_id='.. users[2])
local Json_Info = JSON.decode(Chek_Info)
if Json_Info.result.can_change_info == true then
infoo = '&can_change_info=True' 
else 
infoo = '&can_change_info=false' 
end
if Json_Info.result.can_delete_messages == true then
deletee = '&can_delete_messages=True' 
else 
deletee = '&can_delete_messages=false' 
end
if Json_Info.result.can_invite_users == true then
invitee = '&can_invite_users=True' 
else 
invitee = '&can_invite_users=false' 
end
if Json_Info.result.can_pin_messages == true then
pinn = '&can_pin_messages=True' 
else 
pinn = '&can_pin_messages=false' 
end
if Json_Info.result.can_restrict_members == true then
restrictt = '&can_restrict_members=True' 
else 
restrictt = '&can_restrict_members=false' 
end
if Json_Info.result.can_promote_members == true then
promotee = '&can_promote_members=true' 
else 
promotee = '&can_promote_members=false' 
end 
if Json_Info.can_manage_voice_chats == true then
voice = '&can_manage_voice_chats=True' 
else 
voice = '&can_manage_voice_chats=false' 
end
if Json_Info.can_manage_chat == true then
manage = '&can_manage_chat=True' 
else 
manage = '&can_manage_chat=false' 
end
local ListGruoup = voice..manage.. infoo..'&can_delete_messages=false'..invitee..restrictt..pinn..promotee
https.request("https://api.telegram.org/bot"..token.."/promoteChatMember?chat_id="..data.chat_id_ .."&user_id="..users[2]..ListGruoup)
sendin(Chat_id,msg_idd,data.sender_user_id_,users[2])
end
end
if Text and Text:match('amr@(%d+)/user@(%d+)/banuserfalse') then
local users = {string.match(Text,"^amr@(%d+)/user@(%d+)/banuserfalse$")}
if tonumber(users[1]) == tonumber(data.sender_user_id_) then
local Chek_Info = https.request('https://api.telegram.org/bot'..token..'/getChatMember?chat_id='.. data.chat_id_ ..'&user_id='.. users[2])
local Json_Info = JSON.decode(Chek_Info)
if Json_Info.result.can_change_info == true then
infoo = '&can_change_info=True' 
else 
infoo = '&can_change_info=false' 
end
if Json_Info.result.can_delete_messages == true then
deletee = '&can_delete_messages=True' 
else 
deletee = '&can_delete_messages=false' 
end
if Json_Info.result.can_invite_users == true then
invitee = '&can_invite_users=True' 
else 
invitee = '&can_invite_users=false' 
end
if Json_Info.result.can_pin_messages == true then
pinn = '&can_pin_messages=True' 
else 
pinn = '&can_pin_messages=false' 
end
if Json_Info.result.can_restrict_members == true then
restrictt = '&can_restrict_members=True' 
else 
restrictt = '&can_restrict_members=false' 
end
if Json_Info.result.can_promote_members == true then
promotee = '&can_promote_members=true' 
else 
promotee = '&can_promote_members=false' 
end 
if Json_Info.can_manage_voice_chats == true then
voice = '&can_manage_voice_chats=True' 
else 
voice = '&can_manage_voice_chats=false' 
end
if Json_Info.can_manage_chat == true then
manage = '&can_manage_chat=True' 
else 
manage = '&can_manage_chat=false' 
end
local ListGruoup = voice..manage.. infoo..deletee..invitee..'&can_restrict_members=false' ..pinn..promotee
https.request("https://api.telegram.org/bot"..token.."/promoteChatMember?chat_id="..data.chat_id_ .."&user_id="..users[2]..ListGruoup)
sendin(Chat_id,msg_idd,data.sender_user_id_,users[2])
end
end
if Text and Text:match('amr@(%d+)/user@(%d+)/pinmsgfalse') then
local users = {string.match(Text,"^amr@(%d+)/user@(%d+)/pinmsgfalse$")}
if tonumber(users[1]) == tonumber(data.sender_user_id_) then
local Chek_Info = https.request('https://api.telegram.org/bot'..token..'/getChatMember?chat_id='.. data.chat_id_ ..'&user_id='.. users[2])
local Json_Info = JSON.decode(Chek_Info)
if Json_Info.result.can_change_info == true then
infoo = '&can_change_info=True' 
else 
infoo = '&can_change_info=false' 
end
if Json_Info.result.can_delete_messages == true then
deletee = '&can_delete_messages=True' 
else 
deletee = '&can_delete_messages=false' 
end
if Json_Info.result.can_invite_users == true then
invitee = '&can_invite_users=True' 
else 
invitee = '&can_invite_users=false' 
end
if Json_Info.result.can_pin_messages == true then
pinn = '&can_pin_messages=True' 
else 
pinn = '&can_pin_messages=false' 
end
if Json_Info.result.can_restrict_members == true then
restrictt = '&can_restrict_members=True' 
else 
restrictt = '&can_restrict_members=false' 
end
if Json_Info.result.can_promote_members == true then
promotee = '&can_promote_members=true' 
else 
promotee = '&can_promote_members=false' 
end 
if Json_Info.can_manage_voice_chats == true then
voice = '&can_manage_voice_chats=True' 
else 
voice = '&can_manage_voice_chats=false' 
end
if Json_Info.can_manage_chat == true then
manage = '&can_manage_chat=True' 
else 
manage = '&can_manage_chat=false' 
end
local ListGruoup = voice..manage.. infoo..deletee..invitee..restrictt..'&can_pin_messages=false' ..promotee
https.request("https://api.telegram.org/bot"..token.."/promoteChatMember?chat_id="..data.chat_id_ .."&user_id="..users[2]..ListGruoup)
sendin(Chat_id,msg_idd,data.sender_user_id_,users[2])
end
end
if Text and Text:match('amr@(%d+)/user@(%d+)/addlinkfalse') then
local users = {string.match(Text,"^amr@(%d+)/user@(%d+)/addlinkfalse$")}
if tonumber(users[1]) == tonumber(data.sender_user_id_) then
local Chek_Info = https.request('https://api.telegram.org/bot'..token..'/getChatMember?chat_id='.. data.chat_id_ ..'&user_id='.. users[2])
local Json_Info = JSON.decode(Chek_Info)
if Json_Info.result.can_change_info == true then
infoo = '&can_change_info=True' 
else 
infoo = '&can_change_info=false' 
end
if Json_Info.result.can_delete_messages == true then
deletee = '&can_delete_messages=True' 
else 
deletee = '&can_delete_messages=false' 
end
if Json_Info.result.can_invite_users == true then
invitee = '&can_invite_users=True' 
else 
invitee = '&can_invite_users=false' 
end
if Json_Info.result.can_pin_messages == true then
pinn = '&can_pin_messages=True' 
else 
pinn = '&can_pin_messages=false' 
end
if Json_Info.result.can_restrict_members == true then
restrictt = '&can_restrict_members=True' 
else 
restrictt = '&can_restrict_members=false' 
end
if Json_Info.result.can_promote_members == true then
promotee = '&can_promote_members=true' 
else 
promotee = '&can_promote_members=false' 
end 
if Json_Info.can_manage_voice_chats == true then
voice = '&can_manage_voice_chats=True' 
else 
voice = '&can_manage_voice_chats=false' 
end
if Json_Info.can_manage_chat == true then
manage = '&can_manage_chat=True' 
else 
manage = '&can_manage_chat=false' 
end
local ListGruoup = voice..manage.. infoo..deletee..'&can_invite_users=false'  ..restrictt..pinn..promotee
https.request("https://api.telegram.org/bot"..token.."/promoteChatMember?chat_id="..data.chat_id_ .."&user_id="..users[2]..ListGruoup)
sendin(Chat_id,msg_idd,data.sender_user_id_,users[2])
end
end
if Text == '/@jjjx33' then
local Teext =[[
@jjjx33
]]
return https.request("https://api.telegram.org/bot"..token..'/editMessageText?chat_id='..Chat_id..'&text='..URL.escape(Teext)..'&message_id='..msg_idd..'&parse_mode=markdown&disable_web_page_preview=true') 
end
if Text == '/Xccp' then
local Teext =[[
@Xccp
]]
return https.request("https://api.telegram.org/bot"..token..'/editMessageText?chat_id='..Chat_id..'&text='..URL.escape(Teext)..'&message_id='..msg_idd..'&parse_mode=markdown&disable_web_page_preview=true') 
end
if Text == '/Lj_llIll' then
local Teext =[[
@Lj_llIll
]]
return https.request("https://api.telegram.org/bot"..token..'/editMessageText?chat_id='..Chat_id..'&text='..URL.escape(Teext)..'&message_id='..msg_idd..'&parse_mode=markdown&disable_web_page_preview=true') 
end
if Text == '/pivsn' then
local Teext =[[
@pivsn
]]
return https.request("https://api.telegram.org/bot"..token..'/editMessageText?chat_id='..Chat_id..'&text='..URL.escape(Teext)..'&message_id='..msg_idd..'&parse_mode=markdown&disable_web_page_preview=true') 
end

if Text == '/k1op' then
local Teext =[[
@k1op
]]
return https.request("https://api.telegram.org/bot"..token..'/editMessageText?chat_id='..Chat_id..'&text='..URL.escape(Teext)..'&message_id='..msg_idd..'&parse_mode=markdown&disable_web_page_preview=true') 
end
if Text == '/Q10d' then
local Teext =[[
@Q10d
return https.request("https://api.telegram.org/bot"..token..'/editMessageText?chat_id='..Chat_id..'&text='..URL.escape(Teext)..'&message_id='..msg_idd..'&parse_mode=markdown&disable_web_page_preview=true') 
end

if Text == '/whoop' then
local Teext =[[
@llll_iiij
]]
return https.request("https://api.telegram.org/bot"..token..'/editMessageText?chat_id='..Chat_id..'&text='..URL.escape(Teext)..'&message_id='..msg_idd..'&parse_mode=markdown&disable_web_page_preview=true') 
end

if Text == '/Xjljlj' then
local Teext =[[
@Xjljlj
]]
return https.request("https://api.telegram.org/bot"..token..'/editMessageText?chat_id='..Chat_id..'&text='..URL.escape(Teext)..'&message_id='..msg_idd..'&parse_mode=markdown&disable_web_page_preview=true') 
end
if Text == '/Xjak' then
local Teext =[[
@Xjak
]]
return https.request("https://api.telegram.org/bot"..token..'/editMessageText?chat_id='..Chat_id..'&text='..URL.escape(Teext)..'&message_id='..msg_idd..'&parse_mode=markdown&disable_web_page_preview=true') 
end
if Text == '/jk1bn' then
local Teext =[[
@jk1bn
]]
return https.request("https://api.telegram.org/bot"..token..'/editMessageText?chat_id='..Chat_id..'&text='..URL.escape(Teext)..'&message_id='..msg_idd..'&parse_mode=markdown&disable_web_page_preview=true') 
end
if Text == '/A0op' then
local Teext =[[
@A0op
]]
return https.request("https://api.telegram.org/bot"..token..'/editMessageText?chat_id='..Chat_id..'&text='..URL.escape(Teext)..'&message_id='..msg_idd..'&parse_mode=markdown&disable_web_page_preview=true') 
end
if Text == '/vip_iij' then
local Teext =[[
@vip_iij
]]
return https.request("https://api.telegram.org/bot"..token..'/editMessageText?chat_id='..Chat_id..'&text='..URL.escape(Teext)..'&message_id='..msg_idd..'&parse_mode=markdown&disable_web_page_preview=true') 
end
if Text == '/YtIIIl' then
local Teext =[[
@YtIIIl
]]
return https.request("https://api.telegram.org/bot"..token..'/editMessageText?chat_id='..Chat_id..'&text='..URL.escape(Teext)..'&message_id='..msg_idd..'&parse_mode=markdown&disable_web_page_preview=true') 
end
if Text == '/iii_llij' then
local Teext =[[
@iii_llij
]]
return https.request("https://api.telegram.org/bot"..token..'/editMessageText?chat_id='..Chat_id..'&text='..URL.escape(Teext)..'&message_id='..msg_idd..'&parse_mode=markdown&disable_web_page_preview=true') 
end
if Text == '/vbvy' then
local Teext =[[
@vbvy
]]
return https.request("https://api.telegram.org/bot"..token..'/editMessageText?chat_id='..Chat_id..'&text='..URL.escape(Teext)..'&message_id='..msg_idd..'&parse_mode=markdown&disable_web_page_preview=true') 
end
if Text == '/hjljilj' then
local Teext =[[
@hjljilj
]]
return https.request("https://api.telegram.org/bot"..token..'/editMessageText?chat_id='..Chat_id..'&text='..URL.escape(Teext)..'&message_id='..msg_idd..'&parse_mode=markdown&disable_web_page_preview=true') 
end
if Text == '/Diiolk' then
local Teext =[[
@Diiolk
]]
return https.request("https://api.telegram.org/bot"..token..'/editMessageText?chat_id='..Chat_id..'&text='..URL.escape(Teext)..'&message_id='..msg_idd..'&parse_mode=markdown&disable_web_page_preview=true') 
end
if Text == '/Bi01j' then
local Teext =[[
@Bi01j
]]
return https.request("https://api.telegram.org/bot"..token..'/editMessageText?chat_id='..Chat_id..'&text='..URL.escape(Teext)..'&message_id='..msg_idd..'&parse_mode=markdown&disable_web_page_preview=true') 
end
if Text == '/frrili' then
local Teext =[[
@frrili
]]
return https.request("https://api.telegram.org/bot"..token..'/editMessageText?chat_id='..Chat_id..'&text='..URL.escape(Teext)..'&message_id='..msg_idd..'&parse_mode=markdown&disable_web_page_preview=true') 
end
if Text == '/Xcvb' then
local Teext =[[
@Xcvb
]]
return https.request("https://api.telegram.org/bot"..token..'/editMessageText?chat_id='..Chat_id..'&text='..URL.escape(Teext)..'&message_id='..msg_idd..'&parse_mode=markdown&disable_web_page_preview=true') 
end

if Text == '/Dlik' then
local Teext =[[
@Dlik
]]
return https.request("https://api.telegram.org/bot"..token..'/editMessageText?chat_id='..Chat_id..'&text='..URL.escape(Teext)..'&message_id='..msg_idd..'&parse_mode=markdown&disable_web_page_preview=true') 
end
if Text == 'nzllne'..data.sender_user_id_ then if bot_data:sismember(ban_id.."Sudo:User",data.sender_user_id_) then dev = "المطور ،" else dev = "" end
if bot_data:sismember(ban_id..'CoSu'..msg.chat_id_, data.sender_user_id_) then cu = 'مالك ،' else cu = "" end
if bot_data:sismember(ban_id.."Basic:Constructor"..msg.chat_id_, data.sender_user_id_) then crr = "منشئ اساسي ،" else crr = "" end
if bot_data:sismember(ban_id..'Constructor'..msg.chat_id_, data.sender_user_id_) then cr = "منشئ ،" else cr = "" end
if bot_data:sismember(ban_id..'Manager'..msg.chat_id_, data.sender_user_id_) then own = "مدير ،" else own = "" end
if bot_data:sismember(ban_id..'S00F4:MN:TF'..msg.chat_id_, data.sender_user_id_) then mn = 'منظف ،' else mn = '' end
if bot_data:sismember(ban_id..'Mod:User'..msg.chat_id_, data.sender_user_id_) then mod = "ادمن ،" else mod = "" end
if bot_data:sismember(ban_id..'Special:User'..msg.chat_id_, data.sender_user_id_) then vip = "مميز ،" else vip = "" end
if Can_or_NotCan(data.sender_user_id_,msg.chat_id_) ~= false then local text = "\n ⦁ تم تنزيلك من الرتب التاليه \n ⦁  { "..dev..""..crr..""..cr..""..own..""..mod..""..mn..""..vip.." } \n"
else
local text = "\n ⦁ انت لاتمتلك رتبه \n"
end
bot_data:srem(ban_id.."Sudo:User", data.sender_user_id_)
bot_data:srem(ban_id.."CoSu"..msg.chat_id_,data.sender_user_id_)
bot_data:srem(ban_id.."Basic:Constructor"..msg.chat_id_,data.sender_user_id_)
bot_data:srem(ban_id..'Constructor'..msg.chat_id_, data.sender_user_id_)
bot_data:srem(ban_id..'Manager'..msg.chat_id_, data.sender_user_id_)
bot_data:srem(ban_id..'Mod:User'..msg.chat_id_, data.sender_user_id_)
bot_data:srem(ban_id..'S00F4:MN:TF'..msg.chat_id_, data.sender_user_id_)
bot_data:srem(ban_id..'Special:User'..msg.chat_id_, data.sender_user_id_)
keyboard = {} 
keyboard.inline_keyboard = {
{{text = '𝐓𝐞𝐚𝐦 𝐆𝐨𝐥𝐝',url='http://t.me/g_00_l_d'}},
}
return https.request("https://api.telegram.org/bot"..token..'/editMessageText?chat_id='..Chat_id..'&text='..URL.escape(" ⌯︙ تم تنزيلك من جميع الرتب")..'&message_id='..msg_idd..'&parse_mode=markdown&disable_web_page_preview=true&reply_markup='..JSON.encode(keyboard)) 
end


if Text == 'EndAddarray'..data.sender_user_id_ then  
if bot_data:get(ban_id..'Set:array'..data.sender_user_id_..':'..Chat_id) == 'true1' then
bot_data:del(ban_id..'Set:array'..data.sender_user_id_..':'..Chat_id)
keyboard = {} 
keyboard.inline_keyboard = {
{{text = '𝐓𝐞𝐚𝐦 𝐆𝐨𝐥𝐝',url='http://t.me/g_00_l_d'}},
}
return https.request("https://api.telegram.org/bot"..token..'/editMessageText?chat_id='..Chat_id..'&text='..URL.escape(" ⌯︙︙تم حفظ الردود بنجاح*")..'&message_id='..msg_idd..'&parse_mode=markdown&disable_web_page_preview=true&reply_markup='..JSON.encode(keyboard)) 
else
keyboard = {} 
keyboard.inline_keyboard = {
{{text = '𝐓𝐞𝐚𝐦 𝐆𝐨𝐥𝐝',url='http://t.me/g_00_l_d'}},
}
return https.request("https://api.telegram.org/bot"..token..'/editMessageText?chat_id='..Chat_id..'&text='..URL.escape(" ⌯︙︙تم تنفيذ الامر سابقا*")..'&message_id='..msg_idd..'&parse_mode=markdown&disable_web_page_preview=true&reply_markup='..JSON.encode(keyboard)) 
end
end
if Text == 'OkKikedMe'..data.sender_user_id_ then  
tdcli_function({ID="ChangeChatMemberStatus",chat_id_=Chat_id,user_id_=data.sender_user_id_,status_={ID="ChatMemberStatusKicked"},},function(arg,data) 
if (data and data.code_ and data.code_ == 400 and data.message_ == "CHAT_ADMIN_REQUIRED") then 
keyboard = {} 
keyboard.inline_keyboard = {
{{text = '𝐓𝐞𝐚𝐦 𝐆𝐨𝐥𝐝',url='http://t.me/g_00_l_d'}},
}
return https.request("https://api.telegram.org/bot"..token..'/editMessageText?chat_id='..Chat_id..'&text='..URL.escape(" ⌯︙︙ليس لدي صلاحية حظر المستخدمين يرجى تفعيلها !*")..'&message_id='..msg_idd..'&parse_mode=markdown&disable_web_page_preview=true&reply_markup='..JSON.encode(keyboard)) 
end
if (data and data.code_ and data.code_ == 3) then 
keyboard = {} 
keyboard.inline_keyboard = {
{{text = '𝐓𝐞𝐚𝐦 𝐆𝐨𝐥𝐝',url='http://t.me/g_00_l_d'}},
}
return https.request("https://api.telegram.org/bot"..token..'/editMessageText?chat_id='..Chat_id..'&text='..URL.escape(" ⌯︙︙البوت ليس ادمن يرجى ترقيتي !*")..'&message_id='..msg_idd..'&parse_mode=markdown&disable_web_page_preview=true&reply_markup='..JSON.encode(keyboard)) 
end
if data and data.code_ and data.code_ == 400 and data.message_ == "USER_ADMIN_INVALID" then 
keyboard = {} 
keyboard.inline_keyboard = {
{{text = '𝐓𝐞𝐚𝐦 𝐆𝐨𝐥𝐝',url='http://t.me/g_00_l_d'}},
}
return https.request("https://api.telegram.org/bot"..token..'/editMessageText?chat_id='..Chat_id..'&text='..URL.escape(" ⌯︙︙عذرا لا استطيع طرد ادمنية الجروب*")..'&message_id='..msg_idd..'&parse_mode=markdown&disable_web_page_preview=true&reply_markup='..JSON.encode(keyboard)) 
end
if data and data.ID and data.ID == 'Ok' then
keyboard = {} 
keyboard.inline_keyboard = {
{{text = '𝐓𝐞𝐚𝐦 𝐆𝐨𝐥𝐝',url='http://t.me/g_00_l_d'}},
}
return https.request("https://api.telegram.org/bot"..token..'/editMessageText?chat_id='..Chat_id..'&text='..URL.escape(" ⌯︙︙تم الطرد بنجاح*")..'&message_id='..msg_idd..'&parse_mode=markdown&disable_web_page_preview=true&reply_markup='..JSON.encode(keyboard)) 
end
end,nil)   
end
if Text == 'noKikedMe'..data.sender_user_id_ then  
local Text ="⌯︙ تم الغاء الأمر بنجاح "
keyboard = {} 
keyboard.inline_keyboard = {
{{text = '𝐓𝐞𝐚𝐦 𝐆𝐨𝐥𝐝',url='http://t.me/g_00_l_d'}},
}
return https.request("https://api.telegram.org/bot"..token..'/editMessageText?chat_id='..Chat_id..'&text='..URL.escape(Text)..'&message_id='..msg_idd..'&parse_mode=markdown&disable_web_page_preview=true&reply_markup='..JSON.encode(keyboard)) 
end
if Text == 'YYYBD_aza3h1'..data.sender_user_id_ and msa3d(data) then  
bot_data:setex(ban_id.."Ss:Cs" .. Chat_id .. ":" .. data.sender_user_id_, 600, true) 
local Text ="⌯︙ ارسل الاذاعة لارسلها الي الجروبات "
keyboard = {} 
keyboard.inline_keyboard = {
{{text = '𝐓𝐞𝐚𝐦 𝐆𝐨𝐥𝐝',url='http://t.me/g_00_l_d'}},
}
return https.request("https://api.telegram.org/bot"..token..'/editMessageText?chat_id='..Chat_id..'&text='..URL.escape(Text)..'&message_id='..msg_idd..'&parse_mode=markdown&disable_web_page_preview=true&reply_markup='..JSON.encode(keyboard)) 
end
if Text == 'YYYBD_aza3h2'..data.sender_user_id_ and msa3d(data) then  
bot_data:setex(ban_id.."Send:Bc:Pv" .. Chat_id .. ":" .. data.sender_user_id_, 600, true) 
local Text ="⌯︙ ارسل الاذاعة لارسلها الي الجروبات "
keyboard = {} 
keyboard.inline_keyboard = {
{{text = '𝐓𝐞𝐚𝐦 𝐆𝐨𝐥𝐝',url='http://t.me/g_00_l_d'}},
}
return https.request("https://api.telegram.org/bot"..token..'/editMessageText?chat_id='..Chat_id..'&text='..URL.escape(Text)..'&message_id='..msg_idd..'&parse_mode=markdown&disable_web_page_preview=true&reply_markup='..JSON.encode(keyboard)) 
end
if Text == 'YYYBD_aza3h3'..data.sender_user_id_ and msa3d(data) then  
bot_data:setex(ban_id.."YYYBD_aza3h3" .. Chat_id .. ":" .. data.sender_user_id_, 600, true) 
local Text ="⌯︙ ارسل الاذاعة لارسلها الي المطور الاساسي و الانتيمي "
keyboard = {} 
keyboard.inline_keyboard = {
{{text = '𝐓𝐞𝐚𝐦 𝐆𝐨𝐥𝐝',url='http://t.me/g_00_l_d'}},
}
return https.request("https://api.telegram.org/bot"..token..'/editMessageText?chat_id='..Chat_id..'&text='..URL.escape(Text)..'&message_id='..msg_idd..'&parse_mode=markdown&disable_web_page_preview=true&reply_markup='..JSON.encode(keyboard)) 
end
if Text == 'kahuna'..data.sender_user_id_ then 
bot_data:sadd(ban_id..'Sudo:User', result.sender_user_id_)
local Text ="⌯︙ تم الغاء الأمر بنجاح "
keyboard = {} 
keyboard.inline_keyboard = {
{{text = '𝐓𝐞𝐚𝐦 𝐆𝐨𝐥𝐝',url='http://t.me/g_00_l_d'}},
}
return https.request("https://api.telegram.org/bot"..token..'/editMessageText?chat_id='..Chat_id..'&text='..URL.escape(Text)..'&message_id='..msg_idd..'&parse_mode=markdown&disable_web_page_preview=true&reply_markup='..JSON.encode(keyboard)) 
end
if Text == '/lp8qy' then
Text = '✨🌻'
ban = math.random(3,49); 
keyboard = {}
keyboard.inline_keyboard = {
{
{text = 'كتبات أخري', callback_data="/lp8qy"},
},
}
DeleteMessage(Chat_id,{[0] = Msg_id})  
https.request("https://api.telegram.org/bot"..token..'/sendPhoto?chat_id=' .. Chat_id .. '&photo=https://t.me/dfk9apa/'..ban..'&caption=' .. URL.escape(Text).."&reply_to_message_id=0&parse_mode=markdown&disable_web_page_preview=true&reply_markup="..JSON.encode(keyboard))
end
if Text == '/asr4' then
Text = 'مرحبا اليك لو خيروك بالصوره🍁🌝'
ban = math.random(1,24); 
keyboard = {}
keyboard.inline_keyboard = {
{
{text = 'لوخيروك أخري', callback_data="/asr4"},
},
}
DeleteMessage(Chat_id,{[0] = Msg_id})  
https.request("https://api.telegram.org/bot"..token..'/sendPhoto?chat_id=' .. Chat_id .. '&photo=https://t.me/ahmed_1asd/'..ban..'&caption=' .. URL.escape(Text).."&reply_to_message_id=0&parse_mode=markdown&disable_web_page_preview=true&reply_markup="..JSON.encode(keyboard))
end
if Text == '/ljljkj' then
Text = 'مرحبا إليك تويت بالصوره✨🌚'
ban = math.random(1,28); 
keyboard = {}
keyboard.inline_keyboard = {
{
{text = 'تويت أخري', callback_data="/ljljkj"},
},
}
DeleteMessage(Chat_id,{[0] = Msg_id})  
https.request("https://api.telegram.org/bot"..token..'/sendPhoto?chat_id=' .. Chat_id .. '&photo=https://t.me/a7a_00_1/'..ban..'&caption=' .. URL.escape(Text).."&reply_to_message_id=0&parse_mode=markdown&disable_web_page_preview=true&reply_markup="..JSON.encode(keyboard))
end

if Text == '/allstate' then
Text = 'تم بحث عن اغنيه لك'
ban = math.random(3,42); 
keyboard = {}
keyboard.inline_keyboard = {
{
{text = 'اغنيه اخري', callback_data="/allstate"},
},
}
DeleteMessage(Chat_id,{[0] = Msg_id})  
https.request("https://api.telegram.org/bot"..token..'/sendVoice?chat_id=' .. Chat_id .. '&voice=https://t.me/efwhgsdjg/'..ban..'&caption=' .. URL.escape(Text).."&reply_to_message_id=0&parse_mode=markdown&disable_web_page_preview=true&reply_markup="..JSON.encode(keyboard))
end
if Text == '/lklpo' then
Text = 'لاختيار استوري اخر اضغط ع زر'
ban = math.random(4,74); 
keyboard = {}
keyboard.inline_keyboard = {
{
{text = 'استوري أخري', callback_data="/lklpo"},
},
}
DeleteMessage(Chat_id,{[0] = Msg_id})  
https.request("https://api.telegram.org/bot"..token..'/sendvideo?chat_id=' .. Chat_id .. '&video=https://t.me/sijebehdhd/'..ban..'&caption=' .. URL.escape(Text).."&reply_to_message_id=0&parse_mode=markdown&disable_web_page_preview=true&reply_markup="..JSON.encode(keyboard))
end
if Text == '/chair' then
Text = 'اضغط علي الزر لاختيار ثيم اخر' 
ban = math.random(1,57); 
keyboard = {}
keyboard.inline_keyboard = {
{
{text = 'ثيم أخري', callback_data="/chair"},
},
}
DeleteMessage(Chat_id,{[0] = Msg_id})  
https.request("https://api.telegram.org/bot"..token..'/senddocument?chat_id=' .. Chat_id .. '&document=https://t.me/agklpoj/'..ban..'&caption=' .. URL.escape(Text).."&reply_to_message_id=0&parse_mode=markdown&disable_web_page_preview=true&reply_markup="..JSON.encode(keyboard))
end
end
if data.ID == "UpdateNewMessage" then  -- new msg
msg = data.message_
text = msg.content_.text_
--------------------------------------------------------------------------------------------------------------
if text and not bot_data:sismember(ban_id..'Spam:Texting'..msg.sender_user_id_,text) then
bot_data:del(ban_id..'Spam:Texting'..msg.sender_user_id_) 
end
--------------------------------------------------------------------------------------------------------------
if text and bot_data:get(ban_id.."Del:Cmd:Group"..msg.chat_id_..':'..msg.sender_user_id_) == 'true' then
local NewCmmd = bot_data:get(ban_id.."Set:Cmd:Group:New1"..msg.chat_id_..':'..text)
if NewCmmd then
bot_data:del(ban_id.."Set:Cmd:Group:New1"..msg.chat_id_..':'..text)
bot_data:del(ban_id.."Set:Cmd:Group:New"..msg.chat_id_)
bot_data:srem(ban_id.."List:Cmd:Group:New"..msg.chat_id_,text)
send(msg.chat_id_, msg.id_,' ⌯︙ تم مسح الامر')  
else
send(msg.chat_id_, msg.id_,' ⌯︙ لا يوجد امر بهاذا الاسم')  
end
bot_data:del(ban_id.."Del:Cmd:Group"..msg.chat_id_..':'..msg.sender_user_id_)
return false
end 
-------------------------------------------------------------------------------------------------------------- 
if data.message_.content_.text_ then
local NewCmmd = bot_data:get(ban_id.."Set:Cmd:Group:New1"..msg.chat_id_..':'..data.message_.content_.text_)
if NewCmmd then
data.message_.content_.text_ = (NewCmmd or data.message_.content_.text_)
end
end
if (text and text == "تعطيل اوامر التسليه") then 
send(msg.chat_id_, msg.id_, ' ⌯︙ تم تعطيل اوامر التسليه')
bot_data:set(ban_id.."Fun_Bots:"..msg.chat_id_,"true")
end
if (text and text == "تفعيل اوامر التسليه") then 
send(msg.chat_id_, msg.id_, ' ⌯︙  تم تفعيل اوامر التسليه')
bot_data:del(ban_id.."Fun_Bots:"..msg.chat_id_)
end
local Name_Bot = (bot_data:get(ban_id..'Name:Bot') or 'جولد')
if not bot_data:get(ban_id.."Fun_Bots:"..msg.chat_id_) then
if text ==  ""..Name_Bot..' شنو رئيك بهاذا' and tonumber(msg.reply_to_message_id_) > 0 then     
function FunBot(extra, result, success) 
local Fun = {'لوكي وزاحف من ساع زحفلي وحضرته 😒','خوش ولد و ورده مال الله 💋🙄','يلعب ع البنات 🙄', 'ولد زايعته الكاع 😶🙊','صاك يخبل ومعضل ','محلو وشواربه جنها مكناسه 😂🤷🏼‍♀️','اموت عليه 🌝','هوه غير ا��حب مال اني 🤓❤️','مو خوش ولد صراحه ☹️','ادبسز وميحترم البنات  ', 'فد واحد قذر 🙄😒','ماطيقه كل ما اكمشه ريحته جنها بخاخ بف باف مال حشرات 😂🤷‍♀️','مو خوش ولد 🤓' } 
send(msg.chat_id_, result.id_,''..Fun[math.random(#Fun)]..'')   
end   
tdcli_function ({ID = "GetMessage",chat_id_ = msg.chat_id_,message_id_ = tonumber(msg.reply_to_message_id_)}, FunBot, nil)
return false
end  
if text == ""..Name_Bot..' تحب هذا' and tonumber(msg.reply_to_message_id_) > 0 then    
function FunBot(extra, result, success) 
local Fun = {'الكبد مال اني ','يولي ماحبه ',' لٱ ايع ','بس لو الكفها اله اعضها 💔','ماخب مطايه اسف','اكلك ۿذﭑ يكلي احبكك لولا ﭑݩٺ شتكول  ','ئووووووووف اموت ع ربه ','ايععععععععع','بلعباس اعشكك','ماحب مخابيل','احبب ميدو وبس','لٱ ماحبه','بله هاي جهره تكلي تحبهه ؟ ','بربك ئنته والله فارغ وبطران وماعدك شي تسوي جاي تسئلني احبهم لولا','افبس حبيبي هذا' } 
send(msg.chat_id_,result.id_,''..Fun[math.random(#Fun)]..'') 
end  
tdcli_function ({ID = "GetMessage",chat_id_ = msg.chat_id_,message_id_ = tonumber(msg.reply_to_message_id_)}, FunBot, nil)
return false
end    
end
if text and text:match('^'..Name_Bot..' ') then
data.message_.content_.text_ = data.message_.content_.text_:gsub('^'..Name_Bot..' ','')
end
if text and text:match('^'..Name_Bot..' ') then
data.message_.content_.text_ = data.message_.content_.text_:gsub('^'..Name_Bot..' ','')
end
if text == "نسبه الحب" or text == "نسبه حب" and msg.reply_to_message_id_ ~= 0 and Addictive(msg) then
if not bot_data:get(ban_id..'Cick:lov'..msg.chat_id_) then
bot_data:set(ban_id..":"..msg.sender_user_id_..":lov_Bots"..msg.chat_id_,"sendlove")
Text = 'ارسل اسمك واسم الشخص الثاني،  \n مثال روظي و وروان'
send(msg.chat_id_, msg.id_,Text) 
end
end
if text and text ~="نسبه الحب" and bot_data:get(ban_id..":"..msg.sender_user_id_..":lov_Bots"..msg.chat_id_) == "sendlove" then
num = {"10","20","30","35","75","34","66","82","23","19","55","8","63","32","27","89","99","98","3","80","49","100","6","0",};
sendnum = num[math.random(#num)]
sl = 'نسبه حب '..text..' هي : '..sendnum..'%'
send(msg.chat_id_, msg.id_,sl) 
bot_data:del(ban_id..":"..msg.sender_user_id_..":lov_Bots"..msg.chat_id_)
end
if text == "نسبه الكره" or text == "نسبه كره" and msg.reply_to_message_id_ ~= 0 and Addictive(msg) then
if not bot_data:get(ban_id..'Cick:krh'..msg.chat_id_) then
bot_data:set(ban_id..":"..msg.sender_user_id_..":krh_Bots"..msg.chat_id_,"sendkrhe")
Text = 'ارسل اسمك واسم الشخص الثاني،  \n مثال اسد و لبوى'
send(msg.chat_id_, msg.id_,Text) 
end
end
if text and text ~="نسبه الكره" and bot_data:get(ban_id..":"..msg.sender_user_id_..":krh_Bots"..msg.chat_id_) == "sendkrhe" then
num = {"10","20","30","35","75","34","66","82","23","19","55","8","63","32","27","89","99","98","3","80","8","100","6","0",};
sendnum = num[math.random(#num)]
sl = 'نسبه كره '..text..' هي : '..sendnum..'%'
send(msg.chat_id_, msg.id_,sl) 
bot_data:del(ban_id..":"..msg.sender_user_id_..":krh_Bots"..msg.chat_id_)
end
if text == "نسبه رجوله" or text == "نسبه الرجوله" and msg.reply_to_message_id_ ~= 0 and Addictive(msg) then
if not bot_data:get(ban_id..'Cick:rjo'..msg.chat_id_) then
bot_data:set(ban_id..":"..msg.sender_user_id_..":rjo_Bots"..msg.chat_id_,"sendrjoe")
Text = 'ارسل اسم الشخص الذي تريد قياس نسبه رجولته \n مثال مصطفئ'
send(msg.chat_id_, msg.id_,Text) 
end
end
if text and text ~="نسبه رجوله" and bot_data:get(ban_id..":"..msg.sender_user_id_..":rjo_Bots"..msg.chat_id_) == "sendrjoe" then
numj = {"10","20","30","35","75","34","66","82","23","19","55","80","63","32","27","89","99","98","79","100","8","3","6","0",};
sendnuj = numj[math.random(#numj)]
xl = 'نسبه رجوله '..text..' هي : \n '..sendnuj..'%'
send(msg.chat_id_, msg.id_,xl) 
bot_data:del(ban_id..":"..msg.sender_user_id_..":rjo_Bots"..msg.chat_id_)
end
if text == "صراحه" or text == "الصراحه" and msg.reply_to_message_id_ ~= 0 and Addictive(msg) then
if not bot_data:get(ban_id..'Cick:rkko'..msg.chat_id_) then
bot_data:set(ban_id..":"..msg.sender_user_id_..":rkko_Bots"..msg.chat_id_,"sendrkkoe")
local LEADER_Msg = {
"صراحه  |  صوتك حلوة؟",
"صراحه  |  التقيت الناس مع وجوهين؟",
"صراحه  |  شيء وكنت تحقق اللسان؟",
"صراحه  |  أنا شخص ضعيف عندما؟",
"صراحه  |  هل ترغب في إظهار حبك ومرفق لشخص أو رؤية هذا الضعف؟",
"صراحه  |  يدل على أن الكذب مرات تكون ضرورية شي؟",
"صراحه  |  أشعر بالوحدة على الرغم من أنني تحيط بك كثيرا؟",
"صراحه  |  كيفية الكشف عن من يكمن عليك؟",
"‏صراحه  | هل حياتك سعيدة أم حزينة؟",
"صراحه  |  ما هي أجمل سنة عشتها بحياتك؟",
"‏صراحه  |  ما هو عمرك الحقيقي؟",
"‏صراحه  |  ما اكثر شي ندمن عليه؟",
"صراحه  |  ما هي أمنياتك المُستقبلية؟‏",
"صراحه  | هل قبلت فتاه؟"
}
send(msg.chat_id_, msg.id_,'['..LEADER_Msg[math.random(#LEADER_Msg)]..']') 
return false
end
end
if text and text ~="صراحه" and bot_data:get(ban_id..":"..msg.sender_user_id_..":rkko_Bots"..msg.chat_id_) == "sendrkkoe" then
numj = {"اما قله ادب صحيح كلو كدب فى كدب💔😔"," ده مظبوط🙂😹"," اقلك الكلام ده كدب واللى قالولك كداب وانت كداب واللى بيتفرج كمان كداب??😂"," ده برجوله وموثق كمان❤️😁","فعلا بتتكلم صح🤗","يجدع قول كلام غير دا😹","احس هل شي كذب🌚💕","طب عيني ف عينك كدا ??","انت صح",};
sendnuj = numj[math.random(#numj)]
xl = ' ⟨  '..text..'  ⟩ \n '..sendnuj..'.'
send(msg.chat_id_, msg.id_,xl) 
bot_data:del(ban_id..":"..msg.sender_user_id_..":rkko_Bots"..msg.chat_id_)
end
if text and text ~="نسبه رجوله" and bot_data:get(ban_id..":"..msg.sender_user_id_..":rjo_Bots"..msg.chat_id_) == "sendrjoe" then
numj = {"10","20","30","35","75","34","66","82","23","19","55","80","63","32","27","89","99","98","79","100","8","3","6","0",};
sendnuj = numj[math.random(#numj)]
xl = 'نسبه رجوله '..text..' هي : \n '..sendnuj..'%'
send(msg.chat_id_, msg.id_,xl) 
bot_data:del(ban_id..":"..msg.sender_user_id_..":rjo_Bots"..msg.chat_id_)
end
if text == "كشف الكذب" or text == "كشف الكدب" and msg.reply_to_message_id_ ~= 0 and Addictive(msg) then
if not bot_data:get(ban_id..'Cick:rkko'..msg.chat_id_) then
bot_data:set(ban_id..":"..msg.sender_user_id_..":rkko_Bots"..msg.chat_id_,"sendrkkoe")
local LEADER_Msg = {
"ارسل لى الجمله لتعرف صدق ام كذب🌚✨"
}
send(msg.chat_id_, msg.id_,'['..LEADER_Msg[math.random(#LEADER_Msg)]..']') 
return false
end
end


if text == "نسبه الانوثه" or text == "نسبه انوثه" and msg.reply_to_message_id_ ~= 0 and Addictive(msg) then
if not bot_data:get(ban_id..'Cick:ano'..msg.chat_id_) then
bot_data:set(ban_id..":"..msg.sender_user_id_..":ano_Bots"..msg.chat_id_,"sendanoe")
Text = 'ارسل اسم الشخص الذي تريد قياس نسبه انوثتها \n مثال روان'
send(msg.chat_id_, msg.id_,Text) 
end
end
if text and text ~="نسبه الانوثه" and bot_data:get(ban_id..":"..msg.sender_user_id_..":ano_Bots"..msg.chat_id_) == "sendanoe" then
numj = {"10","20","30","35","75","34","66","82","23","19","55","80","63","32","27","89","99","98","79","100","8","3","6","0",};
sendnuj = numj[math.random(#numj)]
xl = 'نسبه الانوثه '..text..' هي : \n '..sendnuj..'%'
send(msg.chat_id_, msg.id_,xl) 
bot_data:del(ban_id..":"..msg.sender_user_id_..":ano_Bots"..msg.chat_id_)
end
--------------------------------------------------------------------------------------------------------------
if msg.sender_user_id_ and Muted_User(msg.chat_id_,msg.sender_user_id_) then 
DeleteMessage(msg.chat_id_, {[0] = msg.id_})  
return false  
end
--------------------------------------------------------------------------------------------------------------
if msg.sender_user_id_ and DRG_User(msg.chat_id_,msg.sender_user_id_) then 
chat_kick(msg.chat_id_,msg.sender_user_id_) 
DeleteMessage(msg.chat_id_, {[0] = msg.id_}) 
return false  
end
--------------------------------------------------------------------------------------------------------------
if msg.content_ and msg.content_.members_ and msg.content_.members_[0] and msg.content_.members_[0].id_ and DRG_User(msg.chat_id_,msg.content_.members_[0].id_) then 
chat_kick(msg.chat_id_,msg.content_.members_[0].id_) 
DeleteMessage(msg.chat_id_, {[0] = msg.id_}) 
return false
end
--------------------------------------------------------------------------------------------------------------
if msg.sender_user_id_ and GDRG_User(msg.sender_user_id_) then 
chat_kick(msg.chat_id_,msg.sender_user_id_) 
DeleteMessage(msg.chat_id_, {[0] = msg.id_}) 
return false 
end
--------------------------------------------------------------------------------------------------------------
if msg.sender_user_id_ and Gmute_User(msg.sender_user_id_) then 
DeleteMessage(msg.chat_id_, {[0] = msg.id_}) 
return false 
end
--------------------------------------------------------------------------------------------------------------
if msg.content_ and msg.content_.members_ and msg.content_.members_[0] and msg.content_.members_[0].id_ and GDRG_User(msg.content_.members_[0].id_) then 
chat_kick(msg.chat_id_,msg.content_.members_[0].id_) 
DeleteMessage(msg.chat_id_, {[0] = msg.id_})  
end 
--------------------------------------------------------------------------------------------------------------
if msg.content_.ID == "MessageChatAddMembers" then  
bot_data:set(ban_id.."Who:Added:Me"..msg.chat_id_..':'..msg.content_.members_[0].id_,msg.sender_user_id_)
local mem_id = msg.content_.members_  
local Bots = bot_data:get(ban_id.."lock:Bot:kick"..msg.chat_id_) 
for i=0,#mem_id do  
if msg.content_.members_[i].type_.ID == "UserTypeBot" and not Mod(msg) and Bots == "kick" then   
https.request("https://api.telegram.org/bot"..token.."/kickChatMember?chat_id="..msg.chat_id_.."&user_id="..msg.sender_user_id_)
KLAER = https.request("https://api.telegram.org/bot"..token.."/kickChatMember?chat_id="..msg.chat_id_.."&user_id="..mem_id[i].id_)
local Json_Info = JSON.decode(KLAER)
if Json_Info.ok == true and #mem_id == i then
local Msgs = {}
Msgs[0] = msg.id_
msgs_id = msg.id_-1048576
for i=1 ,(150) do 
msgs_id = msgs_id+1048576
table.insert(Msgs,msgs_id)
end
tdcli_function ({ID = "GetMessages",chat_id_ = msg.chat_id_,message_ids_ = Msgs},function(arg,data);MsgsDel = {};for i=0 ,data.total_count_ do;if not data.messages_[i] then;if not MsgsDel[0] then;MsgsDel[0] = Msgs[i];end;table.insert(MsgsDel,Msgs[i]);end;end;if MsgsDel[0] then;tdcli_function({ID="DeleteMessages",chat_id_ = arg.chat_id_,message_ids_=MsgsDel},function(arg,data)end,nil);end;end,{chat_id_=msg.chat_id_})
tdcli_function({ID = "GetChannelMembers",channel_id_ = getChatId(msg.chat_id_).ID,filter_ = {ID = "ChannelMembersBots"},offset_ = 0,limit_ = 100 },function(arg,tah) local admins = tah.members_ for i=0 , #admins do if tah.members_[i].status_.ID ~= "ChatMemberStatusEditor" and not is_mod(msg) then tdcli_function ({ID = "ChangeChatMemberStatus",chat_id_ = msg.chat_id_,user_id_ = admins[i].user_id_,status_ = {ID = "ChatMemberStatusKicked"},}, function(arg,f) end, nil) end end end,nil)  
end
end     
end
end
--------------------------------------------------------------------------------------------------------------
if msg.content_.ID == "MessageChatAddMembers" then  
local mem_id = msg.content_.members_  
local Bots = bot_data:get(ban_id.."lock:Bot:kick"..msg.chat_id_) 
for i=0,#mem_id do  
if msg.content_.members_[i].type_.ID == "UserTypeBot" and not Mod(msg) and Bots == "del" then   
KLAER = https.request("https://api.telegram.org/bot"..token.."/kickChatMember?chat_id="..msg.chat_id_.."&user_id="..mem_id[i].id_)
local Json_Info = JSON.decode(KLAER)
if Json_Info.ok == true and #mem_id == i then
local Msgs = {}
Msgs[0] = msg.id_
msgs_id = msg.id_-1048576
for i=1 ,(150) do 
msgs_id = msgs_id+1048576
table.insert(Msgs,msgs_id)
end
tdcli_function ({ID = "GetMessages",chat_id_ = msg.chat_id_,message_ids_ = Msgs},function(arg,data);MsgsDel = {};for i=0 ,data.total_count_ do;if not data.messages_[i] then;if not MsgsDel[0] then;MsgsDel[0] = Msgs[i];end;table.insert(MsgsDel,Msgs[i]);end;end;if MsgsDel[0] then;tdcli_function({ID="DeleteMessages",chat_id_ = arg.chat_id_,message_ids_=MsgsDel},function(arg,data)end,nil);end;end,{chat_id_=msg.chat_id_})
tdcli_function({ID = "GetChannelMembers",channel_id_ = getChatId(msg.chat_id_).ID,filter_ = {ID = "ChannelMembersBots"},offset_ = 0,limit_ = 100 },function(arg,tah) local admins = tah.members_ for i=0 , #admins do if tah.members_[i].status_.ID ~= "ChatMemberStatusEditor" and not is_mod(msg) then tdcli_function ({ID = "ChangeChatMemberStatus",chat_id_ = msg.chat_id_,user_id_ = admins[i].user_id_,status_ = {ID = "ChatMemberStatusKicked"},}, function(arg,f) end, nil) end end end,nil)  
end
end     
end
end
if msg.content_.ID == 'MessagePinMessage' then
if Constructor(msg) then 
bot_data:set(ban_id..'Pin:Id:Msg'..msg.chat_id_,msg.content_.message_id_)
else
local Msg_Pin = bot_data:get(ban_id..'Pin:Id:Msg'..msg.chat_id_)
if Msg_Pin and bot_data:get(ban_id.."lockpin"..msg.chat_id_) then
PinMessage(msg.chat_id_,Msg_Pin)
end
end
end
--------------------------------------------------------------------------------------------------------------
if msg.content_.ID == "MessageChatDeletePhoto" or msg.content_.ID == "MessageChatChangePhoto" or msg.content_.ID == 'MessagePinMessage' or msg.content_.ID == "MessageChatJoinByLink" or msg.content_.ID == "MessageChatAddMembers" or msg.content_.ID == 'MessageChatChangeTitle' or msg.content_.ID == "MessageChatDeleteMember" then   
if bot_data:get(ban_id..'lock:tagservr'..msg.chat_id_) then  
DeleteMessage(msg.chat_id_,{[0] = msg.id_})       
return false
end    
end   
--------------------------------------------------------------------------------------------------------------
g_00_l_d(data.message_,data)
plugin_KLAER(data.message_)
--------------------------------------------------------------------------------------------------------------
if Chat_Type == 'GroupBot' and ChekAdd(msg.chat_id_) == true then
tdcli_function ({ID = "GetUser",user_id_ = msg.sender_user_id_},function(arg,data) 
if data.username_ then
bot_data:set(ban_id..'user:Name'..msg.sender_user_id_,(data.username_))
end
--------------------------------------------------------------------------------------------------------------
if tonumber(data.id_) == tonumber(ban_id) then
return false
end
end,nil)   
end
elseif (data.ID == "UpdateMessageEdited") then
local msg = data
tdcli_function ({ID = "GetMessage",chat_id_ = msg.chat_id_,message_id_ = tonumber(msg.message_id_)},function(extra, result, success)
bot_data:incr(ban_id..'edits'..result.chat_id_..result.sender_user_id_)
local Text = result.content_.text_
if bot_data:get(ban_id.."lock_edit_med"..msg.chat_id_) and not Text and not BasicConstructor(result) then
tdcli_function ({ID = "GetUser",user_id_ = result.sender_user_id_},function(arg,data) 
local username = data.username_
local name = data.first_name_
local iduser = data.id_
local users = ('[@'..data.username_..']' or iduser)
local list = bot_data:smembers(ban_id..'Constructor'..msg.chat_id_)
t = "\n ⌯︙ شخص ما يحاول تعديل الميديا \n"
for k,v in pairs(list) do
local username = bot_data:get(ban_id.."user:Name" .. v)
if username then
t = t..""..k.."- ([@"..username.."])\n"
else
t = t..""..k.."- (`"..v.."`)\n"
end
end
if #list == 0 then
t = " ⌯︙ لا يوجد ادمن"
end
send(msg.chat_id_,0,''..t..'\n •━═━═━═「ɢᴏʟᴅ」═━═━═━•\n ⌯︙ تم التعديل على الميديا\n ⌯︙ الشخص الي قام بالتعديل\n ⌯︙ ايدي الشخص ◂ '..result.sender_user_id_..'\n ⌯︙ معرف الشخص ⋖{ '..users..' }') 
end,nil)
DeleteMessage(msg.chat_id_,{[0] = msg.message_id_}) 
end
local text = result.content_.text_
if not Mod(result) then
------------------------------------------------------------------------

------------------------------------------------------------------------
if text and text:match("[Tt][Ee][Ll][Ee][Gg][Rr][Aa][Mm].[Mm][Ee]") or text and text:match("[Tt].[Mm][Ee]") or text and text:match("[Tt][Ll][Gg][Rr][Mm].[Mm][Ee]") or text and text:match("[Tt][Ee][Ll][Ee][Ss][Cc][Oo].[Pp][Ee]") then
if bot_data:get(ban_id.."lock:Link"..msg.chat_id_) then
DeleteMessage(msg.chat_id_,{[0] = data.message_id_}) 
return false
end 
end
------------------------------------------------------------------------
if text and text:match("[Tt][Ee][Ll][Ee][Gg][Rr][Aa][Mm].[Mm][Ee]") or text and text:match("[Tt].[Mm][Ee]") or text and text:match("[Tt][Ll][Gg][Rr][Mm].[Mm][Ee]") or text and text:match("[Tt][Ee][Ll][Ee][Ss][Cc][Oo].[Pp][Ee]") then
if bot_data:get(ban_id.."lock:Link"..msg.chat_id_) then
DeleteMessage(msg.chat_id_,{[0] = data.message_id_}) 
return false
end  
end
------------------------------------------------------------------------
if text and text:match("[Tt][Ee][Ll][Ee][Gg][Rr][Aa][Mm].[Mm][Ee]") or text and text:match("[Tt].[Mm][Ee]") or text and text:match("[Tt][Ll][Gg][Rr][Mm].[Mm][Ee]") or text and text:match("[Tt][Ee][Ll][Ee][Ss][Cc][Oo].[Pp][Ee]") then
if bot_data:get(ban_id.."lock:Link"..msg.chat_id_) then
DeleteMessage(msg.chat_id_,{[0] = data.message_id_}) 
return false
end  
end 
------------------------------------------------------------------------
if text and text:match("[hH][tT][tT][pP][sT]") or text and text:match("[tT][eE][lL][eE][gG][rR][aA].[Pp][Hh]") or text and text:match("[Tt][Ee][Ll][Ee][Gg][Rr][Aa].[Pp][Hh]") then
if bot_data:get(ban_id.."lock:Link"..msg.chat_id_) then
DeleteMessage(msg.chat_id_,{[0] = data.message_id_}) 
return false
end  
end 
------------------------------------------------------------------------
if text and text:match("(.*)(@)(.*)") then
if bot_data:get(ban_id.."lock:user:name"..msg.chat_id_) then
DeleteMessage(msg.chat_id_,{[0] = data.message_id_}) 
return false
end  
end
------------------------------------------------------------------------
if text and text:match("@") then
if bot_data:get(ban_id.."lock:user:name"..msg.chat_id_) then
DeleteMessage(msg.chat_id_,{[0] = data.message_id_}) 
return false
end  
end 
------------------------------------------------------------------------
if text and text:match("(.*)(#)(.*)") then
if bot_data:get(ban_id.."lock:hashtak"..msg.chat_id_) then
DeleteMessage(msg.chat_id_,{[0] = data.message_id_}) 
return false
end  
end 
------------------------------------------------------------------------
if text and text:match("#") then
if bot_data:get(ban_id.."lock:user:name"..msg.chat_id_) then
DeleteMessage(msg.chat_id_,{[0] = data.message_id_}) 
return false
end  
end 
------------------------------------------------------------------------
local KLAERAbot = bot_data:get(ban_id.."KLAER1:Add:Filter:Rp2"..text..result.chat_id_)   
if KLAERAbot then    
tdcli_function ({ID = "GetUser",user_id_ = result.sender_user_id_},function(arg,data) 
if data.username_ ~= false then
send(msg.chat_id_,0," ⌯︙ الـعـضو  : {["..data.first_name_.."](T.ME/"..data.username_..")}\n ⌯︙ ["..KLAERAbot.."] \n") 
else
send(msg.chat_id_,0," ⌯︙ الـعـضو  : {["..data.first_name_.."](T.ME/g_00_l_d)}\n ⌯︙ ["..KLAERAbot.."] \n") 
end
end,nil)   
DeleteMessage(msg.chat_id_,{[0] = data.message_id_}) 
return false
end
------------------------------------------------------------------------
if text and text:match("/") then
if bot_data:get(ban_id.."lock:Cmd"..msg.chat_id_) then
DeleteMessage(msg.chat_id_,{[0] = data.message_id_}) 
return false
end 
end 
if text and text:match("(.*)(/)(.*)") then
if bot_data:get(ban_id.."lock:Cmd"..msg.chat_id_) then
DeleteMessage(msg.chat_id_,{[0] = data.message_id_}) 
return false
end 
end
------------------------------------------------------------------------
if text then
local KLAER1_Msg = bot_data:get(ban_id.."KLAER1:Add:Filter:Rp2"..text..result.chat_id_)   
if KLAER1_Msg then    
send(msg.chat_id_, msg.id_," ⌯︙ "..KLAER1_Msg)
DeleteMessage(result.chat_id_, {[0] = data.message_id_})     
return false
end
end
end
end,nil)
------------------------------------------------------------------------
elseif (data.ID == "UpdateOption" and data.name_ == "my_id") then 
local list = bot_data:smembers(ban_id.."User_Bot") 
for k,v in pairs(list) do 
tdcli_function({ID='GetChat',chat_id_ = v},function(arg,data) end,nil) 
end         
local list = bot_data:smembers(ban_id..'Chek:Groups') 
for k,v in pairs(list) do 
tdcli_function({ID='GetChat',chat_id_ = v
},function(arg,data)
if data and data.type_ and data.type_.channel_ and data.type_.channel_.status_ and data.type_.channel_.status_.ID == "ChatMemberStatusMember" then
bot_data:srem(ban_id..'Chek:Groups',v)  
tdcli_function ({ID = "ChangeChatMemberStatus",chat_id_=v,user_id_=ban_id,status_={ID = "ChatMemberStatusLeft"},},function(e,g) end, nil) 
end
if data and data.type_ and data.type_.channel_ and data.type_.channel_.status_ and data.type_.channel_.status_.ID == "ChatMemberStatusLeft" then
bot_data:srem(ban_id..'Chek:Groups',v)  
end
if data and data.type_ and data.type_.channel_ and data.type_.channel_.status_ and data.type_.channel_.status_.ID == "ChatMemberStatusKicked" then
bot_data:srem(ban_id..'Chek:Groups',v)  
end
if data and data.code_ and data.code_ == 400 then
bot_data:srem(ban_id..'Chek:Groups',v)  
end
if data and data.type_ and data.type_.channel_ and data.type_.channel_.status_ and data.type_.channel_.status_.ID == "ChatMemberStatusEditor" then
bot_data:sadd(ban_id..'Chek:Groups',v)  
end 
end,nil)
end

elseif (data.ID == "UpdateMessageSendSucceeded") then
local msg = data.message_
local text = msg.content_.text_
local Get_Msg_Pin = bot_data:get(ban_id..'Msg:Pin:Chat'..msg.chat_id_)
if Get_Msg_Pin ~= nil then
if text == Get_Msg_Pin then
tdcli_function ({ID = "PinChannelMessage",channel_id_ = msg.chat_id_:gsub('-100',''),message_id_ = msg.id_,disable_notification_ = 0},function(arg,d) if d.ID == 'Ok' then;bot_data:del(ban_id..'Msg:Pin:Chat'..msg.chat_id_);end;end,nil)   
elseif (msg.content_.sticker_) then 
if Get_Msg_Pin == msg.content_.sticker_.sticker_.persistent_id_ then
tdcli_function ({ID = "PinChannelMessage",channel_id_ = msg.chat_id_:gsub('-100',''),message_id_ = msg.id_,disable_notification_ = 0},function(arg,d) bot_data:del(ban_id..'Msg:Pin:Chat'..msg.chat_id_) end,nil)   
end
end
if (msg.content_.animation_) then 
if msg.content_.animation_.animation_.persistent_id_ == Get_Msg_Pin then
tdcli_function ({ID = "PinChannelMessage",channel_id_ = msg.chat_id_:gsub('-100',''),message_id_ = msg.id_,disable_notification_ = 0},function(arg,d) bot_data:del(ban_id..'Msg:Pin:Chat'..msg.chat_id_) end,nil)   
end
end
if (msg.content_.photo_) then
if msg.content_.photo_.sizes_[0] then
id_photo = msg.content_.photo_.sizes_[0].photo_.persistent_id_
end
if msg.content_.photo_.sizes_[1] then
id_photo = msg.content_.photo_.sizes_[1].photo_.persistent_id_
end
if msg.content_.photo_.sizes_[2] then
id_photo = msg.content_.photo_.sizes_[2].photo_.persistent_id_
end	
if msg.content_.photo_.sizes_[3] then
id_photo = msg.content_.photo_.sizes_[3].photo_.persistent_id_
end
if id_photo == Get_Msg_Pin then
tdcli_function ({ID = "PinChannelMessage",channel_id_ = msg.chat_id_:gsub('-100',''),message_id_ = msg.id_,disable_notification_ = 0},function(arg,d) bot_data:del(ban_id..'Msg:Pin:Chat'..msg.chat_id_) end,nil)   
end
end
end


end -- end new msg dev.mr ban 
end -- end callback dev.mr ban
















