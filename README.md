## コントラクトアドレス

0x4a05Ca3143a957101B2f7bc9BB2e63c86D2E0659

## オーナーアドレス

0x74be1A269A8fBcD32CC015ba3Ca35FfAccC0Ac4F

## thirdweb該当ページ

https://thirdweb.com/astar/0x4a05Ca3143a957101B2f7bc9BB2e63c86D2E0659/explorer


## 送付方法

事前に、このコントラクトアドレスにAstarを入れます。

なお、solidity上、単位として、「Ether」が使われますが、以降、「Astar」のことだと考えてください。

「Explorer」の「write」から「distributeEther」に行きます。

「Recipients」に下の例のように、アドレスを貼り付けます。
["0xC282d652fBd470D066e0C3f377FD4a2E81AEEBF1","0x049E8641964cf92f38c50397e34CCE9C3f24dB5E"]

「Amount In Hundredth Ether」に送りたいEtherの量を入れます。

なお、単位を「0.01 Ether」にしているのでご注意ください。

そのため、仮に、「0.1 Ether」を送付したい場合は、「10」を入力します。

「Native Token Value」には何も入れません。

できらたら、「Execute」を押します。


## エラーケース

「Recipients」に値を入れた時、下のようなエラーが出ることがあります。

これは、どこかのウォレットアドレスが誤っていることを示しています。

仮に、「0x」で始まり、文字数を満たしていたとしても、誤ったウォレットアドレスの場合にはエラーになります。

Invalid input. Input should be passed in JSON format with valid values.



