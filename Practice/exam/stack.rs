#[derive(Debug)]
struct Stack<T>(Option<Box<Node<T>>>);

impl<T: Clone> Clone for Stack<T> {
    fn clone(&self) -> Self { 
      match &self.0 {
        None => Stack(None),
        Some(node) => {
          Stack(
            Some(
              Box::new(
                Node(node.0.clone(), node.1.clone()) // Copio recursivamente todo el stack, head y tail
              )))
        }
      }
    }
}

#[derive(Debug)]
struct Node<T>(T, Stack<T>);

impl<T> Stack<T> {
    fn new() -> Self { 
      Stack(None)  
    } // An empty Stack 

    fn push(&self, value: T) -> Self where T: Clone, {
        Stack(Some(
          Box::new(
            Node(value, self.clone()) // agrego el valor en la cabeza y como tail tengo la copia del stack anterior
          ))
        )
    }

    fn peek(&self) -> Option<&T> { 
      self.0
      .as_ref()
      .map(|node| &node.0)
    }

    /// If the stack is empty returns `None`
    /// else returns Some(tuple) where tuple contains a reference to the value
    /// on the top of the stack plus the modified `Stack`
    fn pop(&self) -> Option<(&T, Stack<T>)> where T: Clone,{
        if self.is_empty() {
          None
        } else {
          self.0
          .as_ref()
          .map(|node| (&node.0, node.1.clone()))
        }
        
    }

    fn is_empty(&self) -> bool {
        self.0.is_none()
    }
}

fn main() {
    let stack = Stack::new();

    let stack1 = stack.push(1);
    let stack2 = stack1.push(2);


    if let Some((&item, stack3)) = stack2.pop() {
        println!("Popped item: {}", item);
        println!("Stack 3: {stack3:?}");
    }
    println!("Stack: {stack:?}");
    println!("Stack1: {stack1:?}");
    println!("Stack 2: {stack2:?}");
}

