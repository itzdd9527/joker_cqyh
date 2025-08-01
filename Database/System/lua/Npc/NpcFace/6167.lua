function 盟重省_玲音_主对话(玩家, 对话守卫, 选项编号, 界面层数)
  if 玩家.对话页面 == 0 then
    return "我知道如何去往魔虫窟，那是个凶险无比的地方，只有依靠团队的力量才能存活，所以你必须组队前往。另外你的等级要达到25级，我就能给你指点道路。（每天免费进入一次。）<#SO:1>进入魔虫窟<#SO/><#SO:2>取消<#SO/>"
  end

  if 玩家.对话页面 == 1 then
    if 玩家.所属队伍 == nil then
      return "<#P0:0><#P1:0><#T:50603>" --你不在队伍当中。
    elseif 玩家.所属队伍.队长编号 ~= 玩家.地图编号 then
      return "<#P0:0><#P1:0><#T:990109>" --你不是队长，请等待队长操作！
    else
      local 玩家列表 = 获取在线队友(玩家)
      for key, value in pairs(玩家列表) do
        local 队员 = value
        -- local 物品1 = 队员:根据编号获取背包物品(91194)
        -- local 物品2 = 队员:根据编号获取背包物品(91195)
        if 队员.当前等级 < 25 then
          return "<#P0:0><#P1:0><#T:50606>" --不好意思，您的等级不足，请到达25级以后再来。<#SO:1>确定<#SO/>
        -- elseif 物品1 == nil and 物品2 == nil then
          -- return "<#P0:0><#P1:0><#T:700393>" --传入魔虫窟需扣除每位队伍成员1张“魔虫窟入场券”或“副本入场券”，似乎有人准备不足啊。
        elseif 队员.角色数据.脚本变量[数字_魔虫窟每日进入次数] == tonumber(os.date("%j")) then
          return "玩家：[".. 队员.对象名字 .."]今天已经去过魔虫窟了。<#SO:999999>确定<#SO/>"
        end
      end

      local 魔虫窟 = 创建副本(72)
      if 魔虫窟 ~= nil then
        -- 魔虫窟.关闭时间 = 主程.当前时间:AddHours(3.0)
        -- 魔虫窟.副本主人 = 玩家.地图编号
        魔虫窟:初始化副本怪物(180)
        魔虫窟:初始化副本守卫()
        魔虫窟.节点计时 = 主程.当前时间:AddSeconds(10.0)
        local 玩家列表 = 获取在线队友(玩家)
        for key, value in pairs(玩家列表) do
          local 队员 = value
          -- local 物品1 = 队员:根据编号获取背包物品(91194)
          -- local 物品2 = 队员:根据编号获取背包物品(91195)
          -- if 物品1 ~= nil then
            -- 队员:消耗背包物品(1, 物品1)
          -- else
            -- 队员:消耗背包物品(1, 物品2)
          -- end
          队员.角色数据.脚本变量[数字_魔虫窟每日进入次数] = tonumber(os.date("%j"))
          -- 队员:修改角色变量(数字_魔虫窟每日进入次数, 计算类.时间转换(主程.当前时间.Date))
          队员:玩家切换地图(魔虫窟, 地图区域类型.传送区域)
          队员:添加Buff时处理(2554, nil)
        end
      end
    end
  end
end
return 盟重省_玲音_主对话