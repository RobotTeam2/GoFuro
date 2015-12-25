require "date"
#p ARGV[0]
tn = DateTime.now;

$LastTrigger = 100000000;
$LastTriggerTimeStamp = 100000000;


open(ARGV[0]).each { |line|
  #p line;
  if line =~ /DO Button pressed on / then
    targetLine = line.gsub(/DO Button pressed on /, '');
    #p targetLine
    posEnd = targetLine.index(' at http://');
    targetTimeStr = targetLine[0,posEnd];
    #p targetTimeStr
    targetTime = DateTime.parse(targetTimeStr + "+09:00");
    #p tn;
    #p targetTime;
    diff_sec = tn.to_time.to_i - targetTime.to_time.to_i;
    #p diff_sec
    if $LastTrigger > diff_sec then
      $LastTrigger = diff_sec;
      $LastTriggerTimeStamp = targetTime
    end
  end
}

# 120 seconds.
if $LastTrigger > 1 then
  print $LastTriggerTimeStamp.to_s + "\n";
end


