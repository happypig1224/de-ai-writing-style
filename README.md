# de-ai-writing-style

> 消除文档与方案撰写中的“AI味”。基于实证语言学统计与大厂文档规范，让 AI 生成的文字重获严谨、自然与说服力。

[![License: MIT](https://img.shields.io/badge/License-MIT-blue.svg)](LICENSE)
[![Antigravity Compatible](https://img.shields.io/badge/Antigravity-Skill-orange.svg)](https://github.com)
[![Cursor Compatible](https://img.shields.io/badge/Cursor-Rules-green.svg)](adapters/cursor/)
[![Claude Code](https://img.shields.io/badge/Claude-Code-purple.svg)](adapters/claude/)

---

## 为什么需要这个项目？

大语言模型（LLM）写出来的技术方案、PRD 或复盘文档，常常充满典型的“机器八股感”：
- **满屏 Emoji 与加粗**：每行行首必带 🚀、💡、📌，满目加粗 `**`，视觉噪音极高；
- **翻案腔泛滥**：“真正的核心不是 A，而是 B”，反复立靶子再推翻，读者早已审美疲劳；
- **提示语冒号宣告**：“一句话总结：”、“核心原因在于：”，生硬替作者报幕；
- **同义重命名死循环**：段落内同一实体反复换词（优化/提升/深化/赋能），缺乏术语确定性；
- **无脑切碎列表**：缺乏连续段落推理能力，滥用无序列表（Bullet Points）。

**本项目不搞拍脑袋的“禁用词表”，而是基于 520 万字真实对照语料与大厂评审标准，建立一套可定位、可验证、不误伤的去 AI 味工程化规则。**

---

## 核心治理矩阵（红黑对比）

| 机器特征 (❌ 严禁) | 人类专家表达 (✅ 推荐) | 治理机制 |
| :--- | :--- | :--- |
| “真正的壁垒**不是**算法，**而是**认知。” | “当前系统的核心壁垒在于业务认知。” | **翻案腔治理**：直接正面下断言，删除多余对举。 |
| “**一句话总结：** 成本超出预算。” | “该方案跨云部署的网络专线成本超出预算。” | **提示语冒号**：删掉提示语，直接陈述业务判断。 |
| “**说白了**，我们做的是连接。” | “本期目标是打通交易与风控的实时数据链路。” | **起手式治理**：删除口头垫字，提升信息密度。 |
| “极度复杂的**前置修饰长定语**名词。” | 拆分为动宾短句，按逻辑顺序陈述。 | **翻译腔长定语**：修饰语超 15 字或连续套“的”强制拆句。 |
| 一段内轮换“优化/提升/增强/深化”。 | 全文始终使用统一的**标准专名**。 | **同义重命名治理**：避免专有名词漂移。 |
| 标题滥用 Emoji（🚀、📌、🔥）。 | 使用标准 Markdown 标题层级，正文零 Emoji。 | **视觉排版治理**：保证文档严肃性与专业度。 |

---

## X 级保护清单（坚决不改的正常表达）

实测证实以下特征属于人类优秀写法的正常习惯，严禁反向劣化：
- **序数词小标题（1. 2. 3. / 首先、其次）**：人类使用率高于 AI，必须保留清晰编号；
- **正文设问句**：人类在技术剖析中引导读者思考的频率是 AI 的 17 倍，予以保留；
- **“这意味着 / 这表明” 必要的因果解释**：有实质因果推导的不删；
- **不制造机械长短句参差**：不刻意折腾句长与断句。

---

## 适配场景

- **互联网大厂技术设计方案 (Technical Design)**
- **产品需求文档 (PRD)**
- **年终述职 / 晋升报告 (Promo Deck)**
- **SRE 故障复盘报告 (RCA 1-5-10 范式)**
- **业务周报 / 月报与公文立项**

---

## 快速安装与使用

### 1. Antigravity 用户（推荐）
将本项目 `skills/de-ai-writing-style` 目录复制到本地技能目录：
```bash
# Windows PowerShell
Copy-Item -Recurse -Force skills\de-ai-writing-style "$HOME\.gemini\config\skills\"

# macOS / Linux
cp -r skills/de-ai-writing-style "$HOME/.gemini/config/skills/"
```
或直接运行内置安装脚本：
```bash
powershell -ExecutionPolicy Bypass -File scripts/install.ps1
```

### 2. Cursor 用户
直接复制 `adapters/cursor/.cursorrules` 内容至您项目的 `.cursorrules` 文件中。

### 3. Claude Code / Windsurf 用户
将 `adapters/claude/CLAUDE.md` 放置在项目根目录即可。

---

## 开源协议

本项目采用 [MIT 许可证](LICENSE)。
