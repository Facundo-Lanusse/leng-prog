use std::rc::Rc;

#[derive(Debug)]
struct Stack<T>(Option<Rc<Node<T>>>);

impl<T> Clone for Stack<T> {
    fn clone(&self) -> Self { 
        match &self.0 {
          None => Stack(None),
          Some(ref rc) => Stack(Some(rc.clone())),
        }
    }
}

#[derive(Debug)]
struct Node<T>(T, Stack<T>);

impl<T> Stack<T> {
    fn new() -> Self { Stack(None) } // An empty Stack

    fn push(&self, value: T) -> Self {
      let new_node = Node(value, self.clone());  
      Stack(Some(Rc::new(new_node)))
    }

    fn peek(&self) -> Option<&T> { 
      match &self.0.as_ref() {
        None => None,
        Some(node) => Some(&node.0)
      } 
    }

    /// If the stack is empty returns `None`
    /// else returns Some(tuple) where tuple contains a reference to the value
    /// on the top of the stack plus the modified `Stack`
    fn pop(&self) -> Option<(&T, Stack<T>)> {
        match &self.0.as_ref() {
          None => None,
          Some(node) => Some((&node.0, node.1.clone()))
        }
    }

    fn is_empty(&self) -> bool {
        self.0.is_none()
    }
}

#[derive(Debug)]
struct Acount {
  number: i32,
  owner: Rc<String>
}
fn main() {
    let ac1 = Acount {
      number: 123, owner: Rc::new(String::from("Facu"))
    };

    println!("Account 1: {:?}", ac1);
    let stack = Stack::new();

    let stack1 = stack.push(1);
    let stack2 = stack1.push(2);

    let top = stack2.peek();
    println!("Top item: {:?}", top);

    if let Some((&item, stack3)) = stack2.pop() {
        println!("Popped item: {}", item);
        println!("Stack 3: {stack3:?}");
    }
    println!("Stack: {stack:?}");
    println!("Stack1: {stack1:?}");
    println!("Stack 2: {stack2:?}");
}
