#[cfg(test)]

mod tests{   

    #[derive(Drop)]

    struct Person{

        height:u32,
        age:u32,

    }

    fn get_age(person:Person)->u32{

        person.age
    }

    fn get_height(person:Person)->u32{

        person.height
    }

    #[test]

    fn test_get_age(){

        let person=Person{

            height:170,

            age:23,

        };

        assert!(get_age(person)==23_u32);
    }

  fn get_age_return_ownership(person:Person)->(u32,Person){

        (person.age,person)

  }

  #[test]

        fn test_get_age_return_ownership(){


            let person=Person{
                height:170,
                age:23,

            };

            let (_age,_person)=get_age_return_ownership(person);

            assert!(_age==23);
            assert!(_person.age==23);

        }

        fn get_age_with_snapshot(person:@Person) ->u32{

            *person.age
        }

        #[test]

        fn test_get_age_with_snapshot(){

            let person=Person{

                height:170,
                age:23,

            };

            let age=get_age_with_snapshot(@person);
            assert!(age==23);
            assert!(person.age==23);
            
        }





}