function 盟重省_神秘天师官_主对话(玩家, 对话守卫, 选项编号, 界面层数)
  if 玩家.对话页面 == 0 then
    if 当前星期 == 6 and 当前时间 > 17 and 当前时间 < 21  then
      return "当前时间段无法进行捐献，请等待沙巴克结束后再来！<#SO:1999>知道了<#SO/>"
    else
      return "第  一  名：[爆率+100%][对怪增伤+100%][鞭尸概率+10%]<br>第  二  名：[爆率+60%][对怪增伤+60%][鞭尸概率+6%]<br>第  三  名：[爆率+30%][对怪增伤+30%][鞭尸概率+3%]<br>捐献属性：[爆率+10%][对怪增伤+10%][鞭尸概率+1%]<#SO:1>　　　　　我要捐献[500]元宝<#SO/><#SO:2>　　　　   我要捐献[5000]元宝<#SO/><#SO:3>　　　　   我要捐满[38]万元宝<#SO/><#SO:1600>--------------------------------------------------<#SO/><#SO:1600>第一名：[".. 系统数据.数据.脚本字符[1500] .."]   捐献金额：[".. 系统数据.数据.脚本数字[1500] .."]元宝<#SO/><#SO:1600>第二名：[".. 系统数据.数据.脚本字符[1501] .."]   捐献金额：[".. 系统数据.数据.脚本数字[1501] .."]元宝<#SO/><#SO:1600>第三名：[".. 系统数据.数据.脚本字符[1502] .."]   捐献金额：[".. 系统数据.数据.脚本数字[1502] .."]元宝<#SO/><#SO:1600>--------------------------------------------------<#SO/><#SO:1600>自己捐献总金额：[".. 玩家.角色数据.脚本数字[1500] .."]元宝<#SO/><#SO:1600>--------------------------------------------------<#SO/><#SO:1600>温馨提示：捐献金额每周六[18:00]清零<#SO/><#SO:1600>本周六拿沙奖励：[".. 系统数据.数据.脚本数字[1505] .."]元宝<#SO/>"
    end
  end

  if 玩家.对话页面 == 1 then
    if 玩家.元宝数量 < (500 * 100) then
      return "很遗憾，捐献金额最低[500]元宝！<#SO:1999>知道了<#SO/>"
    elseif 玩家.角色数据.脚本数字[1500] >= 380000 then
      return "本周捐献已达到最高点，无需继续捐献！<#SO:1999>知道了<#SO/>"
    else
      玩家.元宝数量 = 玩家.元宝数量 - (500 * 100)
      玩家:发送系统消息("您失去了500元宝")
      玩家.角色数据.脚本数字[1500] = 玩家.角色数据.脚本数字[1500] + 500
      系统数据.数据.脚本数字[1505] = 系统数据.数据.脚本数字[1505] + 250

      if 玩家.角色数据.脚本数字[1500] > 系统数据.数据.脚本数字[1500] then  -- 检测自己的捐献金额 >  第一名捐献金额
        if 系统数据.数据.脚本字符[1500] == 玩家.对象名字 then --检测 第一名名字是不是自己
          系统数据.数据.脚本数字[1500] = 玩家.角色数据.脚本数字[1500] -- 是自己 第一名捐献 = 自己的捐献金额 
        elseif 系统数据.数据.脚本字符[1500] == "暂无" then  -- 如果不是自己 检测 第一名是不是没人
          系统数据.数据.脚本字符[1500] = 玩家.对象名字 --没人将自己 ==  第一名
          系统数据.数据.脚本数字[15000] = 玩家.角色数据.角色编号 -- 将角色编号 == 第一名  后台给与第一名的称号
          系统数据.数据.脚本数字[1500] = 玩家.角色数据.脚本数字[1500] -- 将第一名捐献 = 自己的捐献
        elseif 系统数据.数据.脚本字符[1501] == 玩家.对象名字 then -- 如果有人检测 第二名 是自己
          系统数据.数据.脚本字符[1501] = 系统数据.数据.脚本字符[1500] --  第一名的名字 = 第二名
          系统数据.数据.脚本数字[15001] = 系统数据.数据.脚本数字[15000] -- 将第一名的角色编号 == 第二名
          系统数据.数据.脚本数字[1501] = 系统数据.数据.脚本数字[1500] -- 将第一名的捐献 == 第二名
          系统数据.数据.脚本字符[1500] = 玩家.对象名字 -- 将第一名等于自己
          系统数据.数据.脚本数字[15000] = 玩家.角色数据.角色编号 -- 将第一名的角色编号 == 自己
          系统数据.数据.脚本数字[1500] = 玩家.角色数据.脚本数字[1500] -- 第一名的捐献 == 自己
        elseif 系统数据.数据.脚本字符[1502] == 玩家.对象名字 then -- 如果第三名是自己
          系统数据.数据.脚本字符[1502] = 系统数据.数据.脚本字符[1501] -- 将第第二名的名字 = 第三名
          系统数据.数据.脚本数字[15002] = 系统数据.数据.脚本数字[15001] --将第二名编号 = 第三名
          系统数据.数据.脚本数字[1502] = 系统数据.数据.脚本数字[1501] --第二名的捐献 == 第三名
          系统数据.数据.脚本字符[1501] = 系统数据.数据.脚本字符[1500] -- 第一名 =第二名
          系统数据.数据.脚本数字[15001] = 系统数据.数据.脚本数字[15000] -- 第一名 = 第二名
          系统数据.数据.脚本数字[1501] = 系统数据.数据.脚本数字[1500] -- 第一名捐献 = 第二名
          系统数据.数据.脚本字符[1500] = 玩家.对象名字
          系统数据.数据.脚本数字[15000] = 玩家.角色数据.角色编号
          系统数据.数据.脚本数字[1500] = 玩家.角色数据.脚本数字[1500]
        else
          系统数据.数据.脚本字符[1502] = 系统数据.数据.脚本字符[1501]
          系统数据.数据.脚本数字[15002] = 系统数据.数据.脚本数字[15001]
          系统数据.数据.脚本数字[1502] = 系统数据.数据.脚本数字[1501]
          系统数据.数据.脚本字符[1501] = 系统数据.数据.脚本字符[1500]
          系统数据.数据.脚本数字[15001] = 系统数据.数据.脚本数字[15000]
          系统数据.数据.脚本数字[1501] = 系统数据.数据.脚本数字[1500]
          系统数据.数据.脚本字符[1500] = 玩家.对象名字
          系统数据.数据.脚本数字[15000] = 玩家.角色数据.角色编号
          系统数据.数据.脚本数字[1500] = 玩家.角色数据.脚本数字[1500]
        end
      elseif 玩家.角色数据.脚本数字[1500] > 系统数据.数据.脚本数字[1501] then
        if 系统数据.数据.脚本字符[1501] == 玩家.对象名字 then
          系统数据.数据.脚本数字[1501] = 玩家.角色数据.脚本数字[1500]
        elseif 系统数据.数据.脚本字符[1501] == "暂无" then
          系统数据.数据.脚本字符[1501] = 玩家.对象名字
          系统数据.数据.脚本数字[15001] = 玩家.角色数据.角色编号
          系统数据.数据.脚本数字[1501] = 玩家.角色数据.脚本数字[1500]
        elseif 系统数据.数据.脚本字符[1502] == 玩家.对象名字 then
          系统数据.数据.脚本字符[1502] = 系统数据.数据.脚本字符[1501]
          系统数据.数据.脚本数字[15002] = 系统数据.数据.脚本数字[15001]
          系统数据.数据.脚本数字[1502] = 系统数据.数据.脚本数字[1501]
          系统数据.数据.脚本字符[1501] = 玩家.对象名字
          系统数据.数据.脚本数字[15001] = 玩家.角色数据.角色编号
          系统数据.数据.脚本数字[1501] = 玩家.角色数据.脚本数字[1500]
        else
          系统数据.数据.脚本字符[1502] = 系统数据.数据.脚本字符[1501]
          系统数据.数据.脚本数字[15002] = 系统数据.数据.脚本数字[15001]
          系统数据.数据.脚本数字[1502] = 系统数据.数据.脚本数字[1501]
          系统数据.数据.脚本字符[1501] = 玩家.对象名字
          系统数据.数据.脚本数字[15001] = 玩家.角色数据.角色编号
          系统数据.数据.脚本数字[1501] = 玩家.角色数据.脚本数字[1500]
        end
      elseif 玩家.角色数据.脚本数字[1500] > 系统数据.数据.脚本数字[1502] then
        if 系统数据.数据.脚本字符[1502] == 玩家.对象名字 then
          系统数据.数据.脚本数字[1502] = 玩家.角色数据.脚本数字[1500]
        elseif 系统数据.数据.脚本字符[1502] == "暂无" then
          系统数据.数据.脚本字符[1502] = 玩家.对象名字
          系统数据.数据.脚本数字[15002] = 玩家.角色数据.角色编号
          系统数据.数据.脚本数字[1502] = 玩家.角色数据.脚本数字[1500]
        else
          系统数据.数据.脚本字符[1502] = 玩家.对象名字
          系统数据.数据.脚本数字[15002] = 玩家.角色数据.角色编号
          系统数据.数据.脚本数字[1502] = 玩家.角色数据.脚本数字[1500]
        end
      else
        if 玩家.称号列表:ContainsKey(4) then
          
        else
          玩家:玩家获得称号(4)
        end 
      end
      玩家.对话页面 = 0
      return 盟重省_神秘天师官_主对话(玩家)
    end
  end

  if 玩家.对话页面 == 2 then
    if 玩家.元宝数量 < (5000 * 100) then
      return "很遗憾，身上不足[5000]元宝，无法进行捐献！<#SO:1999>知道了<#SO/>"
    elseif 玩家.角色数据.脚本数字[1500] >= 380000 then
      return "本周捐献已达到最高点，无需继续捐献！<#SO:1999>知道了<#SO/>"
    else
      玩家.元宝数量 = 玩家.元宝数量 - (5000 * 100)
      玩家:发送系统消息("您失去了5000元宝")
      玩家.角色数据.脚本数字[1500] = 玩家.角色数据.脚本数字[1500] + 5000
      系统数据.数据.脚本数字[1505] = 系统数据.数据.脚本数字[1505] + 2500

      if 玩家.角色数据.脚本数字[1500] > 系统数据.数据.脚本数字[1500] then  -- 检测自己的捐献金额 >  第一名捐献金额
        if 系统数据.数据.脚本字符[1500] == 玩家.对象名字 then --检测 第一名名字是不是自己
          系统数据.数据.脚本数字[1500] = 玩家.角色数据.脚本数字[1500] -- 是自己 第一名捐献 = 自己的捐献金额 
        elseif 系统数据.数据.脚本字符[1500] == "暂无" then  -- 如果不是自己 检测 第一名是不是没人
          系统数据.数据.脚本字符[1500] = 玩家.对象名字 --没人将自己 ==  第一名
          系统数据.数据.脚本数字[15000] = 玩家.角色数据.角色编号 -- 将角色编号 == 第一名  后台给与第一名的称号
          系统数据.数据.脚本数字[1500] = 玩家.角色数据.脚本数字[1500] -- 将第一名捐献 = 自己的捐献
        elseif 系统数据.数据.脚本字符[1501] == 玩家.对象名字 then -- 如果有人检测 第二名 是自己
          系统数据.数据.脚本字符[1501] = 系统数据.数据.脚本字符[1500] --  第一名的名字 = 第二名
          系统数据.数据.脚本数字[15001] = 系统数据.数据.脚本数字[15000] -- 将第一名的角色编号 == 第二名
          系统数据.数据.脚本数字[1501] = 系统数据.数据.脚本数字[1500] -- 将第一名的捐献 == 第二名
          系统数据.数据.脚本字符[1500] = 玩家.对象名字 -- 将第一名等于自己
          系统数据.数据.脚本数字[15000] = 玩家.角色数据.角色编号 -- 将第一名的角色编号 == 自己
          系统数据.数据.脚本数字[1500] = 玩家.角色数据.脚本数字[1500] -- 第一名的捐献 == 自己
        elseif 系统数据.数据.脚本字符[1502] == 玩家.对象名字 then -- 如果第三名是自己
          系统数据.数据.脚本字符[1502] = 系统数据.数据.脚本字符[1501] -- 将第第二名的名字 = 第三名
          系统数据.数据.脚本数字[15002] = 系统数据.数据.脚本数字[15001] --将第二名编号 = 第三名
          系统数据.数据.脚本数字[1502] = 系统数据.数据.脚本数字[1501] --第二名的捐献 == 第三名
          系统数据.数据.脚本字符[1501] = 系统数据.数据.脚本字符[1500] -- 第一名 =第二名
          系统数据.数据.脚本数字[15001] = 系统数据.数据.脚本数字[15000] -- 第一名 = 第二名
          系统数据.数据.脚本数字[1501] = 系统数据.数据.脚本数字[1500] -- 第一名捐献 = 第二名
          系统数据.数据.脚本字符[1500] = 玩家.对象名字
          系统数据.数据.脚本数字[15000] = 玩家.角色数据.角色编号
          系统数据.数据.脚本数字[1500] = 玩家.角色数据.脚本数字[1500]
        else
          系统数据.数据.脚本字符[1502] = 系统数据.数据.脚本字符[1501]
          系统数据.数据.脚本数字[15002] = 系统数据.数据.脚本数字[15001]
          系统数据.数据.脚本数字[1502] = 系统数据.数据.脚本数字[1501]
          系统数据.数据.脚本字符[1501] = 系统数据.数据.脚本字符[1500]
          系统数据.数据.脚本数字[15001] = 系统数据.数据.脚本数字[15000]
          系统数据.数据.脚本数字[1501] = 系统数据.数据.脚本数字[1500]
          系统数据.数据.脚本字符[1500] = 玩家.对象名字
          系统数据.数据.脚本数字[15000] = 玩家.角色数据.角色编号
          系统数据.数据.脚本数字[1500] = 玩家.角色数据.脚本数字[1500]
        end
      elseif 玩家.角色数据.脚本数字[1500] > 系统数据.数据.脚本数字[1501] then
        if 系统数据.数据.脚本字符[1501] == 玩家.对象名字 then
          系统数据.数据.脚本数字[1501] = 玩家.角色数据.脚本数字[1500]
        elseif 系统数据.数据.脚本字符[1501] == "暂无" then
          系统数据.数据.脚本字符[1501] = 玩家.对象名字
          系统数据.数据.脚本数字[15001] = 玩家.角色数据.角色编号
          系统数据.数据.脚本数字[1501] = 玩家.角色数据.脚本数字[1500]
        elseif 系统数据.数据.脚本字符[1502] == 玩家.对象名字 then
          系统数据.数据.脚本字符[1502] = 系统数据.数据.脚本字符[1501]
          系统数据.数据.脚本数字[15002] = 系统数据.数据.脚本数字[15001]
          系统数据.数据.脚本数字[1502] = 系统数据.数据.脚本数字[1501]
          系统数据.数据.脚本字符[1501] = 玩家.对象名字
          系统数据.数据.脚本数字[15001] = 玩家.角色数据.角色编号
          系统数据.数据.脚本数字[1501] = 玩家.角色数据.脚本数字[1500]
        else
          系统数据.数据.脚本字符[1502] = 系统数据.数据.脚本字符[1501]
          系统数据.数据.脚本数字[15002] = 系统数据.数据.脚本数字[15001]
          系统数据.数据.脚本数字[1502] = 系统数据.数据.脚本数字[1501]
          系统数据.数据.脚本字符[1501] = 玩家.对象名字
          系统数据.数据.脚本数字[15001] = 玩家.角色数据.角色编号
          系统数据.数据.脚本数字[1501] = 玩家.角色数据.脚本数字[1500]
        end
      elseif 玩家.角色数据.脚本数字[1500] > 系统数据.数据.脚本数字[1502] then
        if 系统数据.数据.脚本字符[1502] == 玩家.对象名字 then
          系统数据.数据.脚本数字[1502] = 玩家.角色数据.脚本数字[1500]
        elseif 系统数据.数据.脚本字符[1502] == "暂无" then
          系统数据.数据.脚本字符[1502] = 玩家.对象名字
          系统数据.数据.脚本数字[15002] = 玩家.角色数据.角色编号
          系统数据.数据.脚本数字[1502] = 玩家.角色数据.脚本数字[1500]
        else
          系统数据.数据.脚本字符[1502] = 玩家.对象名字
          系统数据.数据.脚本数字[15002] = 玩家.角色数据.角色编号
          系统数据.数据.脚本数字[1502] = 玩家.角色数据.脚本数字[1500]
        end
      else
        if 玩家.称号列表:ContainsKey(4) then
          
        else
          玩家:玩家获得称号(4)
        end 
      end
      玩家.对话页面 = 0
      return 盟重省_神秘天师官_主对话(玩家)
    end
  end

  if 玩家.对话页面 == 3 then
    if 玩家.元宝数量 < (380000 * 100) then
      return "很遗憾，你身上不足[38]万元宝，无法进行捐献！<#SO:1999>知道了<#SO/>"
    elseif 玩家.角色数据.脚本数字[1500] >= 380000 then
      return "本周捐献已达到最高点，无需继续捐献！<#SO:1999>知道了<#SO/>"
    else
      玩家.元宝数量 = 玩家.元宝数量 - (380000 * 100)
      玩家:发送系统消息("您失去了380000元宝")
      玩家.角色数据.脚本数字[1500] = 玩家.角色数据.脚本数字[1500] + 380000
      系统数据.数据.脚本数字[1505] = 系统数据.数据.脚本数字[1505] + 190000
    end
  end
  if 玩家.对话页面 == 1600 then
    玩家.对话页面 = 0
    return 盟重省_神秘天师官_主对话(玩家)
  end
end
return 盟重省_神秘天师官_主对话