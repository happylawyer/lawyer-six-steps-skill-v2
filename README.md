# lawyer-six-steps

六步法律师办案工具。

这是一个基于 `SKILL.md` 的律师办案 skill，适用于支持 AgentSkills / `SKILL.md` 目录约定的客户端，例如 Claude Code、Codex、OpenClaw，以及其他兼容客户端。

## 能做什么

通过六个阶段系统化分析案件，帮助中国律师高效办案：

1. **事实梳理**：三层事实梳理（当事人陈述 → 证据事实 → 要件事实），输出证据对照表
2. **法律分析**：三层法律检索（法律法规 → 司法解释 → 地方文件），自动搜索相关法条
3. **法理研究**：立法本意、法律漏洞、法律冲突分析
4. **案例检索**：指导案例 → 最高院案例 → 涉诉区域案例，自动检索类案
5. **裁判规则总结**：从案例中提炼共性要件和影响因素
6. **结果预判**：法官视角三维预测（基准判决 → 政策修正 → 个案调整）

六步分析完成后，还会强制收口生成一份可直接用于汇报、留档和团队讨论的**案件分析报告**。这不是“第七步”，而是六步法的最终产出。

## 快速安装

先把仓库 clone 下来，再用安装脚本把它链接到对应客户端的 skills 目录：

```bash
git clone https://github.com/happylawyer/lawyer-six-steps-skill-v2.git
cd lawyer-six-steps-skill-v2
bash scripts/install.sh all
```

`all` 会同时安装到这些目录：

- `~/.agents/skills/lawyer-six-steps`
- `~/.claude/skills/lawyer-six-steps`
- `~/.codex/skills/lawyer-six-steps`
- `~/.openclaw/skills/lawyer-six-steps`

如果你只想装到单个客户端：

```bash
bash scripts/install.sh claude
bash scripts/install.sh codex
bash scripts/install.sh openclaw
bash scripts/install.sh agents
```

## 各客户端安装方式

### Claude Code

如果你的环境支持 `npx skills add`，可以直接从 GitHub 安装：

```bash
npx skills add https://github.com/happylawyer/lawyer-six-steps-skill-v2 --yes --global
```

也可以用上面的 `bash scripts/install.sh claude`。

### Codex

Codex 用户可以直接安装到本地 skills 目录：

```bash
git clone https://github.com/happylawyer/lawyer-six-steps-skill-v2.git \
  ~/.codex/skills/lawyer-six-steps
```

或者在 clone 仓库后执行：

```bash
bash scripts/install.sh codex
```

安装后建议重启 Codex，确保新 skill 被扫描到。

### OpenClaw

OpenClaw 用户可以安装到 OpenClaw 自己的技能目录：

```bash
git clone https://github.com/happylawyer/lawyer-six-steps-skill-v2.git \
  ~/.openclaw/skills/lawyer-six-steps
```

或者使用：

```bash
bash scripts/install.sh openclaw
```

如果你的 OpenClaw 配置会扫描通用目录，也可以安装到：

```bash
git clone https://github.com/happylawyer/lawyer-six-steps-skill-v2.git \
  ~/.agents/skills/lawyer-six-steps
```

### 其他兼容客户端

只要客户端支持从某个目录读取 `SKILL.md`，把本仓库放到它的 skills 目录下即可。

## 使用

在支持 slash command 的客户端中输入：

```text
/lawyer-six-steps
```

或者直接说：

- `帮我分析一个案件`
- `案件预判`
- `办案分析`
- `/六步法`

## 工作流程

```text
案件录入 → 事实梳理 → 法律分析 → 法理研究 → 案例检索 → 裁判规则总结 → 结果预判 → 案件分析报告
```

每个阶段都是交互式的，会在关键节点停下来等待确认和补充。第六步完成后，skill 会继续整理并落地一份案件分析报告。

## 适用场景

- 接到新案件，需要系统梳理
- 开庭前准备，检查有无遗漏
- 案件研讨，团队协作分析
- 培训新人，建立办案思维框架

## 注意事项

- 所有法律检索结果需律师自行核实
- 分析结论仅供参考，不构成法律意见
- 不替代律师的专业判断

## 发布建议

如果你准备公开发布这个 skill，推荐：

1. 仓库名使用 `lawyer-six-steps-skill-v2`
2. 保持 `SKILL.md` 位于仓库根目录
3. 发布后把 README 里的仓库地址替换成你自己的 GitHub 用户名或组织名
4. 打一个版本 tag，方便别人锁定版本安装

## License

MIT
