# GoFuro  
hot furo from outside.  

Raspのスクリプト更新  
<pre>
cd /home/pi/GoFuro
git pull
</pre>


自動起動⇒設定済み
crontab -e  
最後の行に、下記のものを追加する。  
*/1 * * * * /home/pi/GoFuro/GoFuro.sh >>/home/pi/GoFuro/GoFuro.log  

新しいドングルに変更した場合。  
<pre>
hcitool scan  
Scanning ...  
        00:09:DD:42:8C:8F       TAKASAKAMOT-8  
        5C:93:A2:FA:C6:71       DKEOKI-WIN8  
</pre>
MACアドレスをコピーし、下記のファイルにのMacアドレスを書き換える  
<pre>
  /home/pi/GoFuro/bind.bt
  rfcomm connect 10 00:1B:DC:0A:34:BE
</pre>

自宅のDNS確認  
<pre>
cat /etc/resolv.conf
</pre>
