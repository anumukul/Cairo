#[cfg(test)]
mod tests {

    #[test]
    fn test_implicit_vs_explicit(){

        let a: felt252=5;
        let b: felt252=5;
        assert!(a==b);

    }

    #[test]

    fn test_arithmetic(){

        let a:felt252=4;
        let b:felt252=2;

        assert!(a+b==6);
        assert!(a-b==2);
        assert!(a*b==8);
      
    }

    #[test]

    #[ignore]


    #[should_panic]

    fn test_overflow(){
             let p:felt252=2382828368313727463847203280274923820729820382032424245656123456;
        let p_div_by_ten:felt252=238282836831372746384720328027492382072982038203242424565612345;
        p_div_by_ten*10;

   

    }

    #[test]
    #[should_panic]

    fn test_overflow_u256(){

        let P:u256=115792089237316195423570985008687907853269984665640564039457584007913129639935;
        P*10;



    }

    #[test]
    fn test_short_string(){

        let short_string:felt252='a';
        assert!(short_string==97);

    }

    #[test]
    fn test_byte_array(){

        let byte_array:ByteArray="Anubhav Singh";
        assert!(byte_array.len()==13);
    }

}