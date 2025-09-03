fn unsigned_integers() {
    let _a: u8 = 255;  
    let _b = 12345_u16;
    let _c = 41334_u32;
}

fn signed_integers() {
    let _a: i8 = -25;  
    let _b: i16 = -12344;
}

#[cfg(test)]
mod tests {
    use super::*;
    use alexandria_math::fast_power::fast_power;
   

    #[test]
    fn test_arithmetic() {
        let a: u8 = 3;
        let b: u8 = 5;
        assert(a + b == 8, 'addition failed');
        assert(a * b == 15, 'multiplication failed');
        assert(b - a == 2, 'subtraction failed');
        assert(a / b == 0, 'division failed');
        assert(a % b == 3, 'modulo failed');
        assert(b / a == 1, 'division failed');
        assert(b % a == 2, 'modulo failed');
    }

    #[test]
    #[should_panic]
    fn test_overflow() {
        let a: u8 = 255;
        let b: u8 = 7;
        let _result = a + b; 
    }

    #[test]
    #[should_panic]
    fn test_underflow() {
        let a: u8 = 1;
        let b: u8 = 2;
        let _result = a - b;  
    }

    #[test]
    fn mixing_types() {
        let a: u8 = 90;
        let b: i8 = 78;
        assert(a + b.try_into().unwrap() == 168, 'type mixing failed');
    }

    #[test]
    fn test_advanced_math() {
        let a: u32 = 9;
        assert(fast_power(a, 3) == 729, 'fast_power failed');
        assert!(a==3*3);
    }
}