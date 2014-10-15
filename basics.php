<?php
/**
 * Created by JetBrains PhpStorm.
 * User: rixonmathew
 * Date: 28/09/14
 * Time: 4:30 PM
 * To change this template use File | Settings | File Templates.
 */
    $y=10;

    function doSomething() {
        $x = "100";
        echo "Here is from the function $x <br>";
        echo "Here is the global value {$GLOBALS['y']} <br>";
    }

    function testNumbers(){
        echo "<br>";
        $x=100;
        var_dump($x);
        echo "<br>";
        $x=-100;
        var_dump($x);
        echo "<br>";
        $x=0x8c;
        var_dump($x);
        echo "<br>";
        $x=13.443553;
        var_dump($x);
        echo"<br>";
        $cars = array("bmw","volvo","mercedez");
        var_dump($cars);
    }

    function testStrings(){
        $str = "This is a small string that needs to be tested";
        echo "<br>String is $str with length as ".strlen($str);
        echo "<br>Can some of this be changed now?";

        echo "<br>User agent is ".$_SERVER['HTTP_USER_AGENT'];
    }

    function testArrayOperators(){
        $x = array("1","2","3");
        $y = array("1","3","2","4");
        $z = $x + $y; // union of $x and $y
        var_dump($z);
        var_dump($x == $y);
        var_dump($x === $y);
        var_dump($x != $y);
        var_dump($x <> $y);
        var_dump($x !== $y);

        $t = date("H");
        if ($t<20) {
            echo "<br> Have a good day...$t".date("H:m:s");
        } else {
            echo "<br> its time you retire. $t";
        }

    }

    function testTypes() {
        $var = "String";
        echo "Value is $var and type is ".gettype($var)."<br>";
        $var = 123.45;
        echo "Value is $var and type is ".gettype($var)."<br>";
        $var = 110;
        echo "Value is $var and type is ".gettype($var)."<br>";
        $var = true;
        echo "Value is $var and type is ".gettype($var)."<br>";
    }

    function testFloat() {
        $a = 1.23456789;
        $b = 1.2345680;
        $epsilon = 0.00001;
        if (abs($a-$b)>$epsilon){
            echo "true";
        } else {
            echo "false ".abs($a-$b);
        }
    }

    function testHereDoc() {
        $value = 100;
        $var =<<<TEST123
        class Foo{
            \$var = $value;
            method() {
                echo "test method";
            }
        }
TEST123;
        echo "Value is $var";


    }

    class foo {
        public $bar ="Allan Colin";
        public $gog ="Dmitri Chenkov";
        public $friends = array("John","Job");
    }

    function testClass(){
        $f1 = new foo();
        $local_array = array("First","Second");
        echo "Here is the value of $f1->bar ".PHP_EOL;
        echo "Here is the value of {$f1->friends[1]}".PHP_EOL;
        echo "Here is the value of $local_array[0]".PHP_EOL;
    }

//    $x=10;
//    $z=$x+$y;
//    doSomething();
//    echo " The value of the variable is $z";
    //testNumbers();
    //testStrings();
    //testArrayOperators();
    //testTypes();
    //testHereDoc();
    testClass();

?>