use core::option::OptionTrait;
use core::traits::TryInto;

#[cfg(test)]
mod tests {
    use super::*;
    use core::option::OptionTrait;
    use core::traits::TryInto;

    #[test]
    fn test_casting_into_bigger_type() {
        let a: u8 = 10;
        assert!(a.try_into().unwrap() == 10_u16);
    }

    #[test]
    fn test_casting_to_smaller_type() {
        let a: u16 = 10;
        assert!(a.try_into().unwrap() == 10_u8);
    }

    #[test]  
    fn test_casting_to_smaller_type_that_overflows_1() {
        let a: u16 = 1000;
        let b: Option<u8> = a.try_into();
        assert!(b.is_none());
    }
     
      #[test]  
    fn test_casting_to_smaller_type_that_overflows_2() {
        let a: u16 = 1000;
        let b: Option<u8> = a.try_into();
        let c:u8=b.unwrap_or(50);
        assert!(c==50);
    }

    
}