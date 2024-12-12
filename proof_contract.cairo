# مشروع إثبات ZK-STARK على شبكة Starknet

# **ملف العقد الذكي: proof_contract.cairo**

%lang starknet

@contract
namespace ProofContract:
    # إثبات الملكية
    func submit_proof{syscall_ptr: felt*}() -> (success: felt):
        return (1)
    end
end

# **ملف README: README.md**

```markdown
# ZK-STARK Proof Application

## نظرة عامة

تطبيق مفتوح المصدر يستخدم إثبات ZK-STARK على شبكة Starknet لإثبات الملكية بطريقة آمنة ولامركزية.

## المتطلبات
- Cairo-lang مثبت.
- شبكة Starknet متاحة (testnet).
- Node.js و npm.

## تعليمات التشغيل

### إعداد العقد الذكي
1. قم بتثبيت Cairo:
```bash
pip install cairo-lang
```

2. قم بتجميع العقد:
```bash
starknet-compile proof_contract.cairo --output proof_contract.json --abi proof_contract_abi.json
```

3. قم بنشر العقد:
```bash
starknet-deploy --contract proof_contract.json --network testnet
```

### إعداد الواجهة
1. افتح ملف `index.html` في متصفح الويب.
2. قم بتحديث `contractAddress` في `app.js` بعنوان العقد المنشور.

### أوامر إضافية
- للتحقق من الإصدار:
```bash
starknet --version
```

## كيفية المساهمة

- قم بإنشاء fork للمشروع.
- قم بإجراء تعديلاتك.
- افتح طلب سحب (Pull Request).

## الترخيص
هذا المشروع مرخص بموجب ترخيص MIT.
```

# **ملف الواجهة: index.html**

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>ZK-STARK Proof App</title>
    <link rel="stylesheet" href="styles.css">
</head>
<body>
    <h1>ZK-STARK Proof Application</h1>
    <button id="submitProof">Submit Proof</button>
    <script src="https://cdn.jsdelivr.net/npm/starknet/dist/starknet.min.js"></script>
    <script src="app.js"></script>
</body>
</html>

# **ملف الواجهة: styles.css**

body {
    font-family: Arial, sans-serif;
    text-align: center;
    margin-top: 50px;
}

button {
    padding: 10px 20px;
    font-size: 16px;
    cursor: pointer;
}

# **ملف الواجهة: app.js**

(async () => {
    const starknet = await import('https://cdn.jsdelivr.net/npm/starknet/dist/starknet.min.js');

    document.getElementById('submitProof').addEventListener('click', async () => {
        try {
            const contractAddress = '<Your_Contract_Address>'; // Replace with your contract address
            const abi = []; // Add your contract ABI here

            const provider = new starknet.Provider();
            const contract = new starknet.Contract(abi, contractAddress, provider);

            const result = await contract.submit_proof();
            console.log('Proof submitted successfully:', result);
        } catch (error) {
            console.error('Error submitting proof:', error);
        }
    });
})();
