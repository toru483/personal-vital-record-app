開発作業前に、gitでbranchを作成する手順

ステップ1：GitHubの最新コードを手元に取り込む
	bash
	git pull origin main

ステップ2：新しい機能開発用のブランチを作る
	bash
	git checkout -b ブランチ名


🛠️ 安全なマージとGitHubへの送信手順

ステップ1：現在の作業（dev/vital）をすべてコミットして綺麗にする
	まずは、ブランチに残っている変更（READMEやログの修正など）をすべて保存します。

	bash
	git add .
	git commit -m "変更内容を記入する"

	(※もし「nothing to commit, working tree clean」と出た場合は、すでにすべて保存されているのでそのまま次に進んで大丈夫です)

ステップ2：本番用の main ブランチに切り替える
	合流先である main ブランチへ移動します。

	bash
	git checkout main

	(※切り替えると、画面の左下のブランチ表示が (main) に変わります)

ステップ3：ブランチ側の成果を main に合流（マージ）させる
	ここが本番です。main ブランチにいる状態で、dev/vital の中身を吸い込みます。

	bash
	git merge ブランチ名

	(※画面に Updating... や Fast-forward と文字が流れれば、一瞬でマージが成功します！)

ステップ4：合流した最新の main をGitHubに送信する
	最後に、手元で合流させた最新の main の状態を、クラウド（GitHub）へ安全にアップロードします。

	bash
	git push origin main

ステップ5：🧹 （おまけ）役目を終えたブランチの削除
	無事にGitHubへの送信まで完了したら、使用していたブランチを削除して、手元をすっきり綺麗にしておきましょう。

	bash
	git branch -d ブランチ名

これでブランチ管理を使った一連の開発サイクルが美しく完結します！