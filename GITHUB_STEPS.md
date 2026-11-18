# GitHub-қа жүктеу — Бекзат

1. GitHub-та `english-quest-mobile` атты бос Public репозиторий аш (README қоспа). Description: `Gamified mobile application for learning English`. Topics: `android`, `english-learning`, `uml`, `education`, `mobile-app`.
2. ZIP ішіндегі `bekzat-english-quest` папкасын `C:/Users/bekza/` ішіне шығар.
3. Git Bash-та **әр жолды жеке орында**:

```bash
cd ~/bekzat-english-quest
git init
git branch -M main
git config user.name "Bekzat Suyimkhan"
git add README.md
git commit -m "Add English Quest project README"
git switch -c behavior-diagrams
git add docs/analysis/activity-answer-quiz.drawio docs/analysis/activity-answer-quiz.png
git commit -m "Add activity diagram for quiz answering"
git add docs/analysis/sequence-answer-quiz.drawio docs/analysis/sequence-answer-quiz.png
git commit -m "Add sequence diagram for quiz answering"
git add .gitignore GITHUB_STEPS.md
git commit -m "Add repository guidance and ignore rules"
git switch main
git remote add origin https://github.com/bekzat0317/english-quest-mobile.git
git push -u origin main
git switch behavior-diagrams
git push -u origin behavior-diagrams
```

4. GitHub-та `Compare & pull request` → `base: main`, `compare: behavior-diagrams` → `Create pull request` → `Merge pull request` → `Confirm merge`.
5. Соңғы тексеру:

```bash
git switch main
git pull origin main
git log --oneline --graph --all
git status
```

6. README ішіндегі екі PNG сілтемесін тексер. Репозиторий сілтемесін мұғалімге жібер.

Ескерту: GitHub-тағы аккаунт `bekzat0317` болып кіргенін тексер. Егер папка басқа жерде болса, `cd` жолын өзгерту қажет.
