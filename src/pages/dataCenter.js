import firebase from "firebase/app";

export default class DataTower{
    constructor(){        
        this.firebaseConfig = {
            apiKey: "AIzaSyBMe8TM-W8OCDGow_lrZpgsoWt4EJgwNpM",
            authDomain: "venture-1495b.firebaseapp.com",
            projectId: "venture-1495b",
            storageBucket: "venture-1495b.appspot.com",
            messagingSenderId: "798395571180",
            appId: "1:798395571180:web:07427bdf263ef77f71bec9"
        }

        firebase.initializeApp(this.firebaseConfig);   
        this.db = firebase.firestore();
        this.arr = [];
        this.jar = {
            user: "",
            id: 0,
            reason: "",
            status: "",
            date: "",
            set setUser(user){
                this.user = user;
            },
            set setId(id){
                this.id = id;
            },
            set setReason(reason){
                this.reason = reason;
            },
            set setStatus(status){
                this.status = status;
            },
            set setDate(date){
                this.date = date;
            }
        };   
        this.docRef = this.db.collection("Admin").doc("9KgD8ZBVUogwbvngTKqA");
    }    

    getData(){        

        this.docRef.get().then((doc)=>{    
            if(doc.exists){
              console.log("Renatals data: ", doc.get("Rentals"));
              this.arr.push(doc.get("Rentals")[0]);
              console.log("Rentals inside: ", this.arr[0]);
            }else{
        
              console.log("Rentals data: None");
            }
          });
    }

    setupData(){
        this.docRef.get().then((doc)=>{    
            if(doc.exists){
              this.jar.setUser = "User testing";
              console.log("Inside setup data method: ", this.jar['user']);
            }else{        
              console.log("Rentals data: None");
            }
          });
          console.log("outside setup data method: ", this.jar['user']);
    }

    testData(){
        this.jar.setUser = "Test";
    }

    get user(){
        return "testing";
    }
    
}

export const collections = [
    {
      id: 183,
      user: 'john Doe',
      date: '11-7-2014',
      status: 'approved',
      reason: 'Bacon ipsum dolor sit amet salami venison chicken flank fatback doner.'
    },
    {
      id: 133,
      user: 'Sendo kai',
      date: '02-4-2023',
      status: 'approved',
      reason: 'Bacon ipsum dolor sit amet salami venison chicken flank fatback doner.'
    },
    {
      id: 203,
      user: 'Gon freces',
      date: '01-4-2013',
      status: 'approved',
      reason: 'Bacon ipsum dolor sit amet salami venison chicken flank fatback doner.'
    },
    {
      id: 203,
      user: 'Gon freces',
      date: '01-4-2013',
      status: 'approved',
      reason: 'Bacon ipsum dolor sit amet salami venison chicken flank fatback doner.'
    },
    {
      id: 203,
      user: 'Gon freces',
      date: '01-4-2013',
      status: 'approved',
      reason: 'Bacon ipsum dolor sit amet salami venison chicken flank fatback doner.'
    },
    {
      id: 203,
      user: 'Gon freces',
      date: '01-4-2013',
      status: 'approved',
      reason: 'Bacon ipsum dolor sit amet salami venison chicken flank fatback doner.'
    },
    {
      id: 203,
      user: 'Gon freces',
      date: '01-4-2013',
      status: 'approved',
      reason: 'Bacon ipsum dolor sit amet salami venison chicken flank fatback doner.'
    },
    {
      id: 203,
      user: 'Gon freces',
      date: '01-4-2013',
      status: 'approved',
      reason: 'Bacon ipsum dolor sit amet salami venison chicken flank fatback doner.'
    },
    {
      id: 203,
      user: 'Gon freces',
      date: '01-4-2013',
      status: 'approved',
      reason: 'Bacon ipsum dolor sit amet salami venison chicken flank fatback doner.'
    },
    {
      id: 203,
      user: 'Gon freces',
      date: '01-4-2013',
      status: 'approved',
      reason: 'Bacon ipsum dolor sit amet salami venison chicken flank fatback doner.'
    },
    {
      id: 203,
      user: 'Gon freces',
      date: '01-4-2013',
      status: 'approved',
      reason: 'Bacon ipsum dolor sit amet salami venison chicken flank fatback doner.'
    },
    {
      id: 203,
      user: 'Gon freces',
      date: '01-4-2013',
      status: 'approved',
      reason: 'Bacon ipsum dolor sit amet salami venison chicken flank fatback doner.'
    },
    {
      id: 203,
      user: 'Gon freces',
      date: '01-4-2013',
      status: 'approved',
      reason: 'Bacon ipsum dolor sit amet salami venison chicken flank fatback doner.'
    },
    {
      id: 203,
      user: 'Gon freces',
      date: '01-4-2013',
      status: 'approved',
      reason: 'Bacon ipsum dolor sit amet salami venison chicken flank fatback doner.'
    },
    {
      id: 203,
      user: 'Gon freces',
      date: '01-4-2013',
      status: 'approved',
      reason: 'Bacon ipsum dolor sit amet salami venison chicken flank fatback doner.'
    },
    {
      id: 203,
      user: 'Gon freces',
      date: '01-4-2013',
      status: 'approved',
      reason: 'Bacon ipsum dolor sit amet salami venison chicken flank fatback doner.'
    },
    {
      id: 203,
      user: 'Gon freces',
      date: '01-4-2013',
      status: 'approved',
      reason: 'Bacon ipsum dolor sit amet salami venison chicken flank fatback doner.'
    },
    {
      id: 203,
      user: 'Gon freces',
      date: '01-4-2013',
      status: 'approved',
      reason: 'Bacon ipsum dolor sit amet salami venison chicken flank fatback doner.'
    },
    {
      id: 203,
      user: 'Gon freces',
      date: '01-4-2013',
      status: 'approved',
      reason: 'Bacon ipsum dolor sit amet salami venison chicken flank fatback doner.'
    },
    {
      id: 203,
      user: 'Gon freces',
      date: '01-4-2013',
      status: 'approved',
      reason: 'Bacon ipsum dolor sit amet salami venison chicken flank fatback doner.'
    },
    {
      id: 203,
      user: 'Gon freces',
      date: '01-4-2013',
      status: 'approved',
      reason: 'Bacon ipsum dolor sit amet salami venison chicken flank fatback doner.'
    },
    {
      id: 203,
      user: 'Gon freces',
      date: '01-4-2013',
      status: 'approved',
      reason: 'Bacon ipsum dolor sit amet salami venison chicken flank fatback doner.'
    },
    {
      id: 203,
      user: 'Gon freces',
      date: '01-4-2013',
      status: 'approved',
      reason: 'Bacon ipsum dolor sit amet salami venison chicken flank fatback doner.'
    },
    {
      id: 203,
      user: 'Gon freces',
      date: '01-4-2013',
      status: 'approved',
      reason: 'Bacon ipsum dolor sit amet salami venison chicken flank fatback doner.'
    },
    {
      id: 203,
      user: 'Gon freces',
      date: '01-4-2013',
      status: 'approved',
      reason: 'Bacon ipsum dolor sit amet salami venison chicken flank fatback doner.'
    },
    {
      id: 203,
      user: 'Gon freces',
      date: '01-4-2013',
      status: 'approved',
      reason: 'Bacon ipsum dolor sit amet salami venison chicken flank fatback doner.'
    },
    {
      id: 203,
      user: 'Gon freces',
      date: '01-4-2013',
      status: 'approved',
      reason: 'Bacon ipsum dolor sit amet salami venison chicken flank fatback doner.'
    },
    {
      id: 203,
      user: 'Gon freces',
      date: '01-4-2013',
      status: 'approved',
      reason: 'Bacon ipsum dolor sit amet salami venison chicken flank fatback doner.'
    },
    {
      id: 203,
      user: 'Gon freces',
      date: '01-4-2013',
      status: 'approved',
      reason: 'Bacon ipsum dolor sit amet salami venison chicken flank fatback doner.'
    },
    {
      id: 203,
      user: 'Gon freces',
      date: '01-4-2013',
      status: 'approved',
      reason: 'Bacon ipsum dolor sit amet salami venison chicken flank fatback doner.'
    },
    {
      id: 203,
      user: 'Gon freces',
      date: '01-4-2013',
      status: 'approved',
      reason: 'Bacon ipsum dolor sit amet salami venison chicken flank fatback doner.'
    },
    {
      id: 203,
      user: 'Gon freces',
      date: '01-4-2013',
      status: 'approved',
      reason: 'Bacon ipsum dolor sit amet salami venison chicken flank fatback doner.'
    },
    {
      id: 203,
      user: 'Gon freces',
      date: '01-4-2013',
      status: 'approved',
      reason: 'Bacon ipsum dolor sit amet salami venison chicken flank fatback doner.'
    },
    {
      id: 203,
      user: 'Gon freces',
      date: '01-4-2013',
      status: 'approved',
      reason: 'Bacon ipsum dolor sit amet salami venison chicken flank fatback doner.'
    },
    {
      id: 203,
      user: 'Gon freces',
      date: '01-4-2013',
      status: 'approved',
      reason: 'Bacon ipsum dolor sit amet salami venison chicken flank fatback doner.'
    },
    {
      id: 203,
      user: 'Gon freces',
      date: '01-4-2013',
      status: 'approved',
      reason: 'Bacon ipsum dolor sit amet salami venison chicken flank fatback doner.'
    },
    {
      id: 203,
      user: 'Gon freces',
      date: '01-4-2013',
      status: 'approved',
      reason: 'Bacon ipsum dolor sit amet salami venison chicken flank fatback doner.'
    },
    {
      id: 203,
      user: 'Gon freces',
      date: '01-4-2013',
      status: 'approved',
      reason: 'Bacon ipsum dolor sit amet salami venison chicken flank fatback doner.'
    },
    {
      id: 203,
      user: 'Gon freces',
      date: '01-4-2013',
      status: 'approved',
      reason: 'Bacon ipsum dolor sit amet salami venison chicken flank fatback doner.'
    },
    {
      id: 203,
      user: 'Gon freces',
      date: '01-4-2013',
      status: 'approved',
      reason: 'Bacon ipsum dolor sit amet salami venison chicken flank fatback doner.'
    },
    {
      id: 203,
      user: 'Gon freces',
      date: '01-4-2013',
      status: 'approved',
      reason: 'Bacon ipsum dolor sit amet salami venison chicken flank fatback doner.'
    } 
  ];