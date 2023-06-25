enum Products { recharge, cardBills, dth, lightBill, loanInstallment }

enum Status { success, fail }

class Transaction {
  final int id;
  final Products product;
  final double amount;
  final Status success;

  Transaction(this.product, this.amount,
      {this.success = Status.fail, this.id = 1});

  @override
  String toString() {
    return 'id: $id \nproduct: ${product.name} \namount: $amount \nstatus: ${success.name} \n';
  }
}

int productId = 0;

class TransactionProcessor {
  List<Transaction> transactionHistory = [];

//count of latest consecutive success
  int currentSuccessCount = 0;

//count of latest consecutive fail
  int currentFailCount = 0;

//count of highest consecutive Success
  int consecutiveSuccessCount = 0;

//count of highest consecutive fail
  int consecutiveFailCount = 0;

  void processTransaction(Products product, double amount) {
    Status success = amount % 3 == 0 ? Status.fail : Status.success;

    Transaction transaction =
        Transaction(product, amount, success: success, id: productId++);

    transactionHistory.add(transaction);

    //condition to manage current success and current fail count
    if (transaction.success == Status.success) {
      currentSuccessCount++;
      currentFailCount = 0;
    } else {
      currentFailCount++;
      currentSuccessCount = 0;
    }

    //condition to manage consecutive success & consecutive fail count
    currentSuccessCount > consecutiveSuccessCount
        ? consecutiveSuccessCount = currentSuccessCount
        : null;
    currentFailCount > consecutiveFailCount
        ? consecutiveFailCount = currentFailCount
        : null;
  }
  void printTransactions(){
    for(Transaction transaction in transactionHistory){
      print(transaction.toString());
    }
  }
}

void main() {
  TransactionProcessor processor = TransactionProcessor();
  processor.processTransaction(Products.recharge, 100.0);
  processor.processTransaction(Products.cardBills, 150.0);
  processor.processTransaction(Products.dth, 200.0);
  processor.processTransaction(Products.lightBill, 300.0);
  processor.processTransaction(Products.loanInstallment, 500.0);
  processor.processTransaction(Products.recharge, 120.0);
  processor.processTransaction(Products.cardBills, 210.0);
  processor.processTransaction(Products.dth, 320.0);
  processor.processTransaction(Products.recharge, 150.0);
  processor.processTransaction(Products.cardBills, 200.0);
  processor.processTransaction(Products.dth, 300.0);
  processor.processTransaction(Products.lightBill, 450.0);
  // printConsecutiveCounts(processor);
  processor.printTransactions();
}

void printConsecutiveCounts(TransactionProcessor processor) {
  print(processor.currentSuccessCount);
  print(processor.currentFailCount);
  print(processor.consecutiveSuccessCount);
  print(processor.consecutiveFailCount);
  print("\n");
}
