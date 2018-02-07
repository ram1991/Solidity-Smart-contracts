pragma solidity ^0.4.18;

contract RentABook {
    
   address public owner;
   
   address public student;
   
   uint public rentalDate;
   
  // uint public rentalHours;
   
   uint public price;
   
   bool public bookRented;
   
   uint public returnDate;
   
   uint public minRentalDays;
   
   uint constant Min_Days = 1;
   
   uint public maxRentalDays;
   
   uint constant Max_Days = 10;
   
   bool public available;
   
   
   event UpdateRent(address indexed student, uint rentalDate, uint returnDate, uint price);
   
   event rentBook(address indexed student, uint returnDate);
   
   
   modifier ifOwner {
      require(msg.sender == owner);
      _;
    }
   
     modifier ifStudent {
      require(msg.sender == student);
      _;
    }
    
     modifier whenBookAvailable {
      require(!bookRented || now > returnDate);
      _;
      
   }
   
    modifier whenBookIsRented {
      require(bookRented && now <= returnDate);
      _;
      
   }
   
    modifier IsAvailable {
      require(available);
      _;
      
   }
   
   function RentABook() public {
        owner = msg.sender;
       
   }
   
    function rentableSetup(uint _pricePerDay, uint _minRentalDays, uint _maxRentalDays)
        public ifOwner {
            
            require(!available);
            require(_minRentalDays >= Min_Days && _maxRentalDays <= Max_Days && 
            _minRentalDays <= _maxRentalDays);

            available = true;

            minRentalDays =_minRentalDays;
            maxRentalDays = _maxRentalDays;

            setRentalPerDay(_pricePerDay);

        }
        
    function setBookAvailable(bool _available) public ifOwner {
        available = _available;
    }
    
    function setRentalPerDay(uint _priceCost) public ifOwner whenBookAvailable {
        require(_priceCost > 0);
        price = _priceCost;
    }
    
    function setRentalPerhour(uint _priceCost) public ifOwner whenBookAvailable {
        require(_priceCost > 0);
        price = _priceCost;
    }
    
    function rent() public payable IsAvailable whenBookAvailable {

        require(msg.value > 0);
        require(price > 0);

        uint rentForNumberOfdays = msg.value/ price;

        require(rentForNumberOfdays >= minRentalDays && rentForNumberOfdays <= maxRentalDays);
        returnDate = now + rentForNumberOfdays;

        bookRented = true;
        student = msg.sender;
        rentalDate = now;

       UpdateRent(student, rentalDate, returnDate,price);
    }
        
    function remainBalanceDays() public view whenBookIsRented returns(uint) {
        return (returnDate - now);
    }

    function rentalTotalDays() public view whenBookIsRented returns(uint) {
        return (returnDate - rentalDate);
    }    

    function rentalElapsedTime() public view whenBookIsRented returns(uint) {
        return (now - rentalDate);
    }
    
    function rentalTotalTime() public view whenBookIsRented returns (uint){
        return (returnDate - rentalDate);
    }


    function returnBook() public ifStudent whenBookIsRented {
       uint amountPaid = 0;
        if(rentalElapsedTime() < Min_Days){
            amountPaid = (rentalTotalTime() - Min_Days) * price ;
        }else{
            amountPaid = remainBalanceDays();
        }

        rentBook(student, now);

        resetBookRent();

        msg.sender.transfer(amountPaid);

   }
   
   function resetBookRent () private {
       bookRented = false;
       student = address(0);
       rentalDate = 0;
       returnDate = 0;
   }   
}
