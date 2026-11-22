# Auto Science · Progress

团队计划工作区，包含 2026-11-23 至 2027-03-23 四个阶段、97 项任务。

## 功能

- 任务总览，国内、投资、技术、学术、用户与商业分类。
- 任务勾选与「负责人 — 进度」评论，服务器持久保存，每 6 秒同步。
- 月度进度、搜索、状态筛选及加密备份导出。
- 服务端共享密码校验、HttpOnly 会话与加密计划数据。

## 访问

完整工作区：https://boston-autoscience-progress.authenticcheetah16.chatgpt.site

GitHub Pages 根目录与 `pages/` 均提供跳转入口，跳转至支持共享数据库的完整工作区。请在仓库 **Settings → Pages → Source** 选择 **GitHub Actions**，再运行 `Publish workspace entry`。

目前托管站点保持私有。站点所有者可在 Sites 的访问设置中调整为公开；公开入口后仍需工作区密码才能读取共享数据。公开访问设置由所有者自行处理。

共享密码和会话签名密钥保存在托管服务的加密环境变量中。不要把实际密钥加入仓库。计划数据使用密码派生密钥加密；共享密码适用于小团队，不提供个人身份验证。

## 开发与部署

Node.js 24+，无第三方运行依赖。

```
npm test
npm run build
```

`worker/api.mjs` 为接口；`scripts/build.mjs` 将页面和静态资源打包为 Worker；`drizzle/` 包含数据库迁移。
`.openai/hosting.json` 保留已配置的站点 ID 和 D1 绑定。

GitHub Pages 无法运行服务端接口，根目录 index.html 是跳转入口；workspace.html 是 Worker 打包时使用的完整应用页面。

## 数据

任务有稳定 ID。勾选按任务更新；评论独立追加并使用请求 ID 避免重复写入。首次上线的数据库为空，本地测试数据不上传。
