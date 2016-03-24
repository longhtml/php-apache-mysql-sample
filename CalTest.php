<?php  
// CalTest.php

require_once("Cal.php");  
class CalTest extends PHPUnit_Framework_TestCase  
{
    public $cal;
    function setUp()
    {
        $this->cal = new Calculator();
    }
    function tearDown() {
        unset($this->cal);
    }
    function testadd1()
    {
        $result = $this->cal->add(1,1);
        $this->assertEquals($result,2);
    }
    function testadd2()
    {
        $result = $this->cal->add(100,-50);
        $this->assertTrue($result == 50);
    }
}