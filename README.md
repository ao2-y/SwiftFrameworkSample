# SwiftFrameworkSample

### Tips
* Swift FrameworkをObjCで使用するには以下の設定が必要

> ``` [Build Options]-[Embeedded Content Contains Swift Code] = true ```

### Other Sample
* 素数計算
https://swiftlang.ng.bluemix.net/#/repl/b8400baf15d595384f82400ee7e0603fe060a9096cfca64163821fb6e5126091
* ソート
http://swiftlang.ng.bluemix.net/#/repl/46c479102b2902d11a7282cc7dfbf3067ac7a16762b49fde8a4c0efe6d4e1566


### SwiftMock使ってみた
* Mockクラスとモック化させたいクラスを継承させて、モックを手製で作成するイメージ。
> verify条件は作成したクラス側に自分で記述する必要がある。（スタブ化させたいメソッドをoverrideさせて、acceptで条件を記述する）

* Mockクラスを作成するのは少し面倒だけど、振る舞い(返値のコントロールやoverride)

* できることはManualMockingと変わらないが、使い回しができるのでテストコード量は減らせそう？ 
> ただ、テストの為のファイルが増えるので見通しは悪いかも。。。？ 少しなれる必要があるかもかも。。。。（どんなものでも一緒か。。。）

結論、Sinonほど簡単にMock化できなさそう。
ManualMockingの手法に合わせて拡張してくれているイメージ。
