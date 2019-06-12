function bezier(t, arr, r, index){
  if(r == 0){
    return arr[index];
  } else {
    return ((1-t)bezier(t,arr,r-1,index)) + (t*bezier(t,arr,r-1,index+1));
  }
}
