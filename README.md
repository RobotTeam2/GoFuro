# GoFuro  
hot furo from outside.  


自動起動⇒設定済み
crontab -e  
最後の行に、下記のものを追加する。  
*/1 * * * * /home/pi/GoFuro/GoFuro.sh >>/home/pi/GoFuro/GoFuro.log  

新しいドングルをがあった場合。
hcitool scan
