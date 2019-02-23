<?php
   $input = 'ts76gabalan@gmail.com';
$key = 'idkK4556kkUkrkt5';
$iv = 'fuKJU6758gjrufdh';

$encrypted = mcrypt_encrypt(MCRYPT_RIJNDAEL_128, $key, $input, MCRYPT_MODE_CBC, $iv);
$dec=mcrypt_decrypt(MCRYPT_RIJNDAEL_128, $key, $encrypted, MCRYPT_MODE_CBC, $iv);
echo $dec."</br>";

?>
