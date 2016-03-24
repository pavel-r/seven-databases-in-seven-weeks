
distinctDigits = function(phone){
 var phoneStr = phone.components.number + '';
 var uniqueDigits = phoneStr.split('')
   .map(function(digitCh){
     return +digitCh;
   })
   .sort()
   .reduce(function(prev, curr){
     var last = prev.pop();
     if(last){
       prev.push(last);
     }
     if(last !== curr){
       prev.push(curr);
     }
     return prev;
   }, []);
 return uniqueDigits;
}

map = function(){
 var digits = distinctDigits(this);
 emit({digits : digits, country : this.components.country}, {count: 1});
}

reduce = function(key, values){
 var totalCount = values.reduce(function(prev, curr){
   prev += curr.count;
   return prev;
 }, 0);
 return {count : totalCount};
}

finalize = function(key, reducedValue){
 return {total : reducedValue.count};
}
