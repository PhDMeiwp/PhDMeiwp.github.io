@echo off
del /a /f /s /q "F:\Blog\PhDMeiwp.github.io\.git\*.*" & git init & git add -A & git commit -m "Blog source files" & git branch hexo & git remote add origin git@github.com:PhDMeiwp/PhDMeiwp.github.io.git & git push origin hexo -f
