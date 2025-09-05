#[cfg(test)]




mod tests{

    #[derive(Drop)]



    struct Human{

        health:u32,
        strength:u32,

    }

    
    #[derive(Drop)]
    


    struct Orc{

        health:u32,
        strength:u32,

    }

    trait Action<T>{

        fn new()->T;
        fn get_health(self: @T)->u32;
        fn get_strength(self: @T)->u32;
        fn is_alive(self:@T)->bool;
        fn train (ref self:T);
        fn heal (ref self:T);
        fn hurt (ref self:T);
    }

    impl HumanImpl of Action<Human>{


        fn new()->Human{

            Human{

                health:100,
                strength:20,
            }
        }

        fn get_health(self :@Human)->u32{

            *self.health
        }

         fn get_strength(self:@Human)->u32{

            *self.strength
        }

        fn is_alive(self:@Human)->bool{

            *self.health>0
        }

        fn train(ref self:Human){

            if self.is_alive(){

                 self.strength+=5;


            }

           
        }
        fn heal(ref self:Human){

            if self.is_alive(){

                self.health+=10;


            }

            
        }
        fn hurt(ref self :Human){

            if self.health>10{

                self.health-=10;


            }

            else{

                self.health=0;
            }
        }
    }

     impl OrcImpl of Action<Orc>{


        fn new()->Orc{

            Orc{

                health:100,
                strength:50,
            }
        }

        fn get_health(self :@Orc)->u32{

            *self.health
        }

         fn get_strength(self:@Orc)->u32{

            *self.strength
        }

        fn is_alive(self:@Orc)->bool{

            *self.health>0
        }

        fn train(ref self:Orc){

            if self.is_alive(){

                 self.strength+=10;


            }

           
        }
        fn heal(ref self:Orc){

            if self.is_alive(){

                self.health+=5;


            }

            
        }
        fn hurt(ref self :Orc){

            if self.health>10{

                self.health-=10;


            }

            else{

                self.health=0;
            }
        }
    }

   

    fn human_vs_human_fight(ref human1:Human, ref human2:Human) ->Result<(),ByteArray>{

        if !human1.is_alive() || !human2.is_alive(){

            return Result::Err("One of the human is already dead");

        }

        if human1.get_strength()==human2.get_strength(){

            human1.hurt();
            human2.hurt();

        }

       else if human1.get_strength()>human2.get_strength(){

            human2.hurt();
        }

        else{

            human1.hurt();
        }

        return Result::Ok(());





    }

    #[test]

    fn test_human_vs_human_fight(){


        let mut human1:Human=HumanImpl::new();
        let mut human2:Human=HumanImpl::new();

       match  human_vs_human_fight(ref human1, ref human2){


        Result::Ok(())=>{

            assert!(human1.get_health()==90);
            assert!(human2.get_health()==90);
            assert!(human1.is_alive());
            assert!(human2.is_alive());

        },

        Result::Err(_err)=>{

            assert!(false);
        },

            
       }

    }


   
     fn fight<T1, T2, +Action<T1>, +Action<T2>, +Drop<T1>, +Drop<T2>>(ref opponent_1: T1, ref opponent_2: T2) -> Result<(), ByteArray> {
    if !opponent_1.is_alive() || !opponent_2.is_alive() {
        return Result::Err("One of the opponents is already dead");
    }

    if opponent_1.get_strength() == opponent_2.get_strength() {
        opponent_1.hurt();
        opponent_2.hurt();
    } else if opponent_1.get_strength() > opponent_2.get_strength() {
        opponent_2.hurt();
    } else {
        opponent_1.hurt();
    }

    return Result::Ok(());
}

    #[test]

    fn test_fight(){


        let mut human:Human=HumanImpl::new();
        let mut orc:Orc=OrcImpl::new();
        match fight(ref human, ref orc){

            Result::Ok(())=>{

                assert!(human.get_health()==90);
                assert!(orc.get_health()==100);


            },
            Result::Err(_err)=>{

                assert!(false);
            },

        }
    }





}