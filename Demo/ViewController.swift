//
//  ViewController.swift
//  Demo
//
//  Created by zzz on 2019/12/01.
//  Copyright © 2019 tester. All rights reserved.
//

import UIKit
class ViewController: UIViewController {
    @IBOutlet weak var myTableView: UITableView! {
        didSet {
            myTableView.register(UINib.init(nibName: "TableViewCellA", bundle: nil), forCellReuseIdentifier: "TableViewCellA")
             myTableView.register(UINib.init(nibName: "TableViewCellB", bundle: nil), forCellReuseIdentifier: "TableViewCellB")
            myTableView.rowHeight = UITableView.automaticDimension
            myTableView.estimatedRowHeight = 200
        }
    }
    let dataSouce: [Any] = ["abcdaedadfafafafafafdlafj;lafj;afa;fjsad;urioe;gndf.ndlja;oturepo;mgfds/fgmda;lta","ewsvafdfaa","dfafewfqfafdfaffafkfjalfjafjdafafjdsa;lf;lsmvslja;urepwjfsl/fmsldfjas;lfjaoruei;fjfdsafafafa;f;jjfd;lriefm/d.vmx/z.vmal;dfka'l/kma/.vm/fkda'lfm//.vmx/z.fkd;lfka/fma/.fma;lfdkad;dlkfma/.fma/slfka;lfmal/dfmafmafma;lfkmafmalfkmaldfamfaaldfmasd.flnsak.fnsarjep;fja/sf",
"dfasfaofieowpfndlfjasfjafjdafafdkl/safsa'mv/ava'fka;fm/vmxzfka;fad","eecccccccccccsfffffffkkkkkkkkkkkkk","pwfsfdsfsalfjlfjafjsafjafjafjafafdjafja","abcdaedadfafafafaffdsafjsa;flmalfma;fjapoeifmcvz.,xmvclxafjdoa;fmldf.lkajspfdlasfmadlfma;slfja;dfmdaafdlafj;lafj;afa;fjsad;urioe;gndf.ndlja;oturepo;mgfds/fgmda;lta","ewsvafdfaa","dfafewfqfafdfaffafkfjalfjafjdafafjdsa;lf;lsmvslja;urepwjfsl/fmsldfjas;lfjaoruei;fjaldfmasd.flnsak.fnsarjep;fja/sf","abcdaedadfafafafafafdlafj;lafj;afa;fjsad;urioe;gndf.ndlja;oturepo;mgfds/fgmda;lta","ewsvafdfaa","dfafewfqfafdfaffafkfjalfjafjdafafjdsa;lf;lsmvslja;urepwjfsl/fmsldfjas;lfjaoruei;fjaldfmasd.flnsak.fnsarjep;fja/sf","abcdaedadfafafafafafdlafj;lafj;afa;fjsad;urioe;gndf.ndlja;oturepo;mgfds/fgmda;lta","ewsvafdfaa","dfafewfqfafdfaffafkfjalfjafjdafafjdsa;lf;lsmvslja;urepwjfsl/fmsldfjas;lfjaoruei;fjfdsafafafa;f;jjfd;lriefm/d.vmx/z.vmal;dfka'l/kma/.vm/fkda'lfm//.vmx/z.fkd;lfka/fma/.fma;lfdkad;dlkfma/.fma/slfka;lfmal/dfmafmafma;lfkmafmalfkmaldfamfaaldfmasd.flnsak.fnsarjep;fja/sf","abcdaedadfafafafafafdlafj;lafj;afa;fjsad;urioe;gndf.ndlja;oturepo;mgfds/fgmda;lta","ewsvafdfaa","dfafewfqfafdfaffafkfjalfjafjdafafjdsa;lf;lsmvslja;urepwjfsl/fmsldfjas;lfjaoruei;fjfdsafafafa;f;jjfd;lriefm/d.vmx/z.vmal;dfka'l/kma/.vm/fkda'lfm//.vmx/z.fkd;lfka/fma/.fma;lfdkad;dlkfma/.fma/slfka;lfmal/dfmafmafma;lfkmafmalfkmaldfamfaaldfmasd.flnsak.fnsarjep;fja/sf","abcdaedadfafafafafafdlafj;lafj;afa;fjsad;urioe;gndf.ndlja;oturepo;mgfds/fgmda;lta","ewsvafdfaa","dfafewfqfafdfaffafkfjalfjafjdafafjdsa;lf;lsmvslja;urepwjfsl/fmsldfjas;lfjaoruei;fjfdsafafafa;f;jjfd;lriefm/d.vmx/z.vmal;dfka'l/kma/.vm/fkda'lfm//.vmx/z.fkd;lfka/fma/.fma;lfdkad;dlkfma/.fma/slfka;lfmal/dfmafmafma;lfkmafmalfkmaldfamfaaldfmasd.flnsak.fnsarjep;fja/sf","abcdaedadfafafafafafdlafj;lafj;afa;fjsad;urioe;gndf.ndlja;oturepo;mgfds/fgmda;lta","ewsvafdfaa","dfafewfqfafdfaffafkfjalfjafjdafafjdsa;lf;lsmvslja;urepwjfsl/fmsldfjas;lfjaoruei;fjaldfmasd.flnsak.fnsarjep;fja/sf",["aaaaaaaaaaaaaa","bbbbbbb","ccccccc","dddddddddd","eeeeeeeeeeee","ffffffffffff","ggggggggggg","hhhhhhhhh","iiiiiiiiii","jjjjjjj","kkkkkkkkkkkkk","llllllllllllllll"]
        ,"Last Line"
    ]
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func willTransition(to newCollection: UITraitCollection, with coordinator: UIViewControllerTransitionCoordinator) {
        super.willTransition(to: newCollection, with: coordinator)
        print("[[willTransition]] >>> \(coordinator)");
        coordinator.animate(alongsideTransition: { (_) in
            guard let tableView = self.myTableView else {
                return
            }
            tableView.reloadData()
        }) { (_) in
            guard let tableView = self.myTableView else {
                return
            }
            tableView.beginUpdates()
            tableView.endUpdates()

        }
    }
    
    override func systemLayoutFittingSizeDidChange(forChildContentContainer container: UIContentContainer) {
        super.systemLayoutFittingSizeDidChange(forChildContentContainer: container)
    }
}

extension ViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
}
extension ViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dataSouce.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard dataSouce.count > indexPath.row else {
            return UITableViewCell()
        }
        let data = dataSouce[indexPath.row]
        if let array = data as? NSArray {
            let tableViewCellB = tableView.dequeueReusableCell(withIdentifier: "TableViewCellB") as! TableViewCellB
            tableViewCellB.config(array: array)
            print("[[tableViewCellB]] >>> \(tableViewCellB.frame)")
            return tableViewCellB
        } else if let title = data as? String {
            let tableViewCellA = tableView.dequeueReusableCell(withIdentifier: "TableViewCellA") as! TableViewCellA
            tableViewCellA.configCell(title: title)
            print("[[tableViewCellA]] >>> \(tableViewCellA.frame)")
            return tableViewCellA
        }
        return UITableViewCell()
    }
}
